-- Load acquisitions_full_nested.json into the acquisitions landing table
-- The outer array is stripped by STRIP_OUTER_ARRAY=TRUE in the JSON file format,
-- so each element becomes one row; nested objects are read with dot-notation paths.
-- No LATERAL FLATTEN is needed here because there are no nested arrays, only nested objects.
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
        $1:acquisition.id::VARCHAR,
        $1:acquisition.acquisition_id::VARCHAR,
        $1:acquisition.company.acquiring_object_id::VARCHAR,
        $1:acquisition.company.acquired_object_id::VARCHAR,
        $1:acquisition.term_code::VARCHAR,
        TRY_TO_NUMBER($1:acquisition.price.amount::VARCHAR),
        $1:acquisition.price.currency::VARCHAR,
        TRY_TO_DATE($1:acquisition.acquired_at::VARCHAR),
        $1:acquisition.source.url::VARCHAR,
        $1:acquisition.source.description::VARCHAR,
        TRY_TO_TIMESTAMP_NTZ($1:acquisition.audit.created_at::VARCHAR),
        TRY_TO_TIMESTAMP_NTZ($1:acquisition.audit.updated_at::VARCHAR),
        METADATA$FILENAME, METADATA$FILE_ROW_NUMBER, METADATA$FILE_CONTENT_KEY, METADATA$FILE_LAST_MODIFIED
    FROM @crunchbase_raw.ingestion.crunchbase_s3_stage/acquisitions/
    (PATTERN => '.*acquisitions_full_nested\\.json')
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
