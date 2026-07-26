-- Load ipos.csv into the ipos landing table
-- Co-authored with CoCo

USE ROLE CRUNCHBASE_LOADER;
USE WAREHOUSE CRUNCHBASE_INGEST_WH;
USE DATABASE CRUNCHBASE_RAW;
USE SCHEMA RAW;

COPY INTO crunchbase_raw.raw.ipos
    (id, ipo_id, object_id, valuation_amount, valuation_currency_code, raised_amount,
     raised_currency_code, public_at, stock_symbol, source_url, source_description,
     created_at, updated_at,
     _source_file_name, _source_file_row_number, _source_file_content_key, _source_file_last_modified)
FROM (
    SELECT
        $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,
        METADATA$FILENAME, METADATA$FILE_ROW_NUMBER, METADATA$FILE_CONTENT_KEY, METADATA$FILE_LAST_MODIFIED
    FROM @crunchbase_raw.ingestion.crunchbase_s3_stage/ipos/
)
FILE_FORMAT = (FORMAT_NAME = crunchbase_raw.ingestion.crunchbase_csv_format)
ON_ERROR = 'ABORT_STATEMENT'
FORCE = FALSE;

-- Log this load run into the ingestion audit table
INSERT INTO crunchbase_raw.audit.ingestion_table_audit
    (target_table, source_file_name, rows_parsed, rows_loaded, error_count,
     first_error_message, first_error_line, load_status)
SELECT 'crunchbase_raw.raw.ipos', "file", "rows_parsed", "rows_loaded",
       "errors_seen", "first_error", "first_error_line", "status"
FROM TABLE(RESULT_SCAN(LAST_QUERY_ID()));
