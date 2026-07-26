-- JSON file format for the acquisitions dataset
-- Co-authored with CoCo

USE ROLE CRUNCHBASE_LOADER;
USE WAREHOUSE CRUNCHBASE_INGEST_WH;
USE DATABASE CRUNCHBASE_RAW;
USE SCHEMA ingestion;

CREATE OR REPLACE FILE FORMAT crunchbase_json_format
    TYPE = JSON
    COMPRESSION = AUTO
    STRIP_OUTER_ARRAY = TRUE
    IGNORE_UTF8_ERRORS = FALSE
    COMMENT = 'JSON format for the crunchbase acquisitions source files';
