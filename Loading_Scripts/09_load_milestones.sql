-- Load milestones.csv into the milestones landing table
-- Co-authored with CoCo

USE ROLE CRUNCHBASE_LOADER;
USE WAREHOUSE CRUNCHBASE_INGEST_WH;
USE DATABASE CRUNCHBASE_RAW;
USE SCHEMA RAW;

COPY INTO crunchbase_raw.raw.milestones
    (id, object_id, milestone_at, milestone_code, description, source_url, source_description,
     created_at, updated_at,
     _source_file_name, _source_file_row_number, _source_file_content_key, _source_file_last_modified)
FROM (
    SELECT
        $1,$2,$3,$4,$5,$6,$7,$8,$9,
        METADATA$FILENAME, METADATA$FILE_ROW_NUMBER, METADATA$FILE_CONTENT_KEY, METADATA$FILE_LAST_MODIFIED
    FROM @crunchbase_raw.ingestion.crunchbase_s3_stage/milestones/
)
FILE_FORMAT = (FORMAT_NAME = crunchbase_raw.ingestion.crunchbase_csv_format)
ON_ERROR = 'ABORT_STATEMENT'
FORCE = FALSE;
