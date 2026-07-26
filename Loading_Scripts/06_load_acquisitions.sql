-- Load acquisitions_raw.json into the acquisitions landing table
-- Only the flat source file is loaded here; acquisitions_by_acquirer.json is a
-- grouped rollup of the same records and is handled separately via LATERAL FLATTEN.
-- Co-authored with CoCo

USE ROLE CRUNCHBASE_LOADER;
USE WAREHOUSE CRUNCHBASE_INGEST_WH;
USE DATABASE CRUNCHBASE_RAW;
USE SCHEMA RAW;

COPY INTO crunchbase_raw.raw.acquisitions
    (id, acquisition_id, acquiring_object_id, acquired_object_id, term_code, price_amount,
     price_currency_code, acquired_at, source_url, source_description, created_at, updated_at,
     _source_file_name, _source_file_row_number, _source_file_content_key, _source_file_last_modified)
FROM (
    SELECT
        $1:id::VARCHAR,
        $1:acquisition_id::VARCHAR,
        $1:acquiring_object_id::VARCHAR,
        $1:acquired_object_id::VARCHAR,
        $1:term_code::VARCHAR,
        $1:price_amount::NUMBER,
        $1:price_currency_code::VARCHAR,
        $1:acquired_at::DATE,
        $1:source_url::VARCHAR,
        $1:source_description::VARCHAR,
        $1:created_at::TIMESTAMP_NTZ,
        $1:updated_at::TIMESTAMP_NTZ,
        METADATA$FILENAME, METADATA$FILE_ROW_NUMBER, METADATA$FILE_CONTENT_KEY, METADATA$FILE_LAST_MODIFIED
    FROM @crunchbase_raw.ingestion.crunchbase_s3_stage/acquisitions/
    (PATTERN => '.*acquisitions_raw\\.json')
)
FILE_FORMAT = (FORMAT_NAME = crunchbase_raw.ingestion.crunchbase_json_format)
ON_ERROR = 'ABORT_STATEMENT'
FORCE = FALSE;



-- Log this load run into the ingestion audit table
INSERT INTO crunchbase_raw.audit.ingestion_table_audit
    (target_table, source_file_name, rows_parsed, rows_loaded, error_count,
     first_error_message, first_error_line, load_status)
SELECT 'crunchbase_raw.raw.acquisitions', "file", "rows_parsed", "rows_loaded",
       "errors_seen", "first_error", "first_error_line", "status"
FROM TABLE(RESULT_SCAN(LAST_QUERY_ID()));
