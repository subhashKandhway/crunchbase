-- Landing table for the investments dataset
-- Co-authored with CoCo

USE ROLE CRUNCHBASE_LOADER;
USE WAREHOUSE CRUNCHBASE_INGEST_WH;
USE DATABASE CRUNCHBASE_RAW;
USE SCHEMA RAW;

CREATE OR REPLACE TABLE crunchbase_raw.raw.investments (
    id                    VARCHAR,
    funding_round_id      VARCHAR,
    funded_object_id      VARCHAR,
    investor_object_id    VARCHAR,
    created_at            TIMESTAMP_NTZ,
    updated_at            TIMESTAMP_NTZ,
    _source_file_name           VARCHAR,
    _source_file_row_number     NUMBER,
    _source_file_content_key    VARCHAR,
    _source_file_last_modified  TIMESTAMP_NTZ,
    _loaded_at                  TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
)
COMMENT = 'Landing table for investments.csv - links investors to funding rounds';
