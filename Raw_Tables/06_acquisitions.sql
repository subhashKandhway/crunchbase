-- Landing table for the acquisitions dataset
-- Co-authored with CoCo

USE ROLE CRUNCHBASE_LOADER;
USE WAREHOUSE CRUNCHBASE_INGEST_WH;
USE DATABASE CRUNCHBASE_RAW;
USE SCHEMA RAW;

CREATE OR REPLACE TABLE crunchbase_raw.raw.acquisitions (
    id                      VARCHAR,
    acquisition_id          VARCHAR,
    acquiring_object_id     VARCHAR,
    acquired_object_id      VARCHAR,
    term_code               VARCHAR,
    price_amount            NUMBER,
    price_currency_code     VARCHAR,
    acquired_at             DATE,
    source_url              VARCHAR,
    source_description      VARCHAR,
    created_at              TIMESTAMP_NTZ,
    updated_at              TIMESTAMP_NTZ,
    _source_file_name           VARCHAR,
    _source_file_row_number     NUMBER,
    _source_file_content_key    VARCHAR,
    _source_file_last_modified  TIMESTAMP_NTZ,
    _loaded_at                  TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
)
COMMENT = 'Landing table for acquisitions.csv - acquisition events between objects';
