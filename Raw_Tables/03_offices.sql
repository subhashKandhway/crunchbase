-- Landing table for the offices dataset
-- Co-authored with CoCo

USE ROLE CRUNCHBASE_LOADER;
USE WAREHOUSE CRUNCHBASE_INGEST_WH;
USE DATABASE CRUNCHBASE_RAW;
USE SCHEMA RAW;

CREATE OR REPLACE TABLE crunchbase_raw.raw.offices (
    id            VARCHAR,
    object_id     VARCHAR,
    office_id     VARCHAR,
    description   VARCHAR,
    region        VARCHAR,
    address1      VARCHAR,
    address2      VARCHAR,
    city          VARCHAR,
    zip_code      VARCHAR,
    state_code    VARCHAR,
    country_code  VARCHAR,
    latitude      FLOAT,
    longitude     FLOAT,
    created_at    TIMESTAMP_NTZ,
    updated_at    TIMESTAMP_NTZ,
    _source_file_name           VARCHAR,
    _source_file_row_number     NUMBER,
    _source_file_content_key    VARCHAR,
    _source_file_last_modified  TIMESTAMP_NTZ,
    _loaded_at                  TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
)
COMMENT = 'Landing table for offices.csv - office locations linked to objects';


