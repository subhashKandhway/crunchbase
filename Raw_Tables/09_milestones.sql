-- Landing table for the milestones dataset
-- Co-authored with CoCo

USE ROLE CRUNCHBASE_LOADER;
USE WAREHOUSE CRUNCHBASE_INGEST_WH;
USE DATABASE CRUNCHBASE_RAW;
USE SCHEMA RAW;

CREATE OR REPLACE TABLE crunchbase_raw.raw.milestones (
    id                    VARCHAR,
    object_id             VARCHAR,
    milestone_at          DATE,
    milestone_code        VARCHAR,
    description           VARCHAR,
    source_url            VARCHAR,
    source_description    VARCHAR,
    created_at            TIMESTAMP_NTZ,
    updated_at            TIMESTAMP_NTZ,
    _source_file_name           VARCHAR,
    _source_file_row_number     NUMBER,
    _source_file_content_key    VARCHAR,
    _source_file_last_modified  TIMESTAMP_NTZ,
    _loaded_at                  TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
)
COMMENT = 'Landing table for milestones.csv - key milestone events for objects';
