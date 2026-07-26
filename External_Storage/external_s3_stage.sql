-- External S3 stage for crunchbase CSV source files
-- Co-authored with CoCo

USE ROLE CRUNCHBASE_LOADER;
USE WAREHOUSE CRUNCHBASE_INGEST_WH;
USE DATABASE CRUNCHBASE_RAW;
USE SCHEMA ingestion;

CREATE OR REPLACE STAGE crunchbase_raw.ingestion.crunchbase_s3_stage
    STORAGE_INTEGRATION = crunchbase_s3_int
    URL = 's3://crunchbase-analytics/'
    FILE_FORMAT = crunchbase_raw.ingestion.crunchbase_csv_format
    DIRECTORY = (
            ENABLE = TRUE
    )
    COMMENT = 'External S3 stage for crunchbase csv source files';


LIST @crunchbase_raw.ingestion.crunchbase_s3_stage;