-- Landing table for the ipos dataset
-- Co-authored with CoCo

USE ROLE CRUNCHBASE_LOADER;
USE WAREHOUSE CRUNCHBASE_INGEST_WH;
USE DATABASE CRUNCHBASE_RAW;
USE SCHEMA RAW;

CREATE OR REPLACE TABLE crunchbase_raw.raw.ipos (
    id                          VARCHAR,
    ipo_id                      VARCHAR,
    object_id                   VARCHAR,
    valuation_amount            NUMBER,
    valuation_currency_code     VARCHAR,
    raised_amount               NUMBER,
    raised_currency_code        VARCHAR,
    public_at                   DATE,
    stock_symbol                VARCHAR,
    source_url                  VARCHAR,
    source_description          VARCHAR,
    created_at                  TIMESTAMP_NTZ,
    updated_at                  TIMESTAMP_NTZ,
    _source_file_name           VARCHAR,
    _source_file_row_number     NUMBER,
    _source_file_content_key    VARCHAR,
    _source_file_last_modified  TIMESTAMP_NTZ,
    _loaded_at                  TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
)
COMMENT = 'Landing table for ipos.csv - IPO events for objects';
