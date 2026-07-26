-- Audit table to track ingestion load runs (COPY INTO results) for raw tables
-- Co-authored with CoCo

USE ROLE CRUNCHBASE_LOADER;
USE WAREHOUSE CRUNCHBASE_INGEST_WH;
USE DATABASE CRUNCHBASE_RAW;
USE SCHEMA AUDIT;

CREATE OR REPLACE TABLE crunchbase_raw.audit.ingestion_table_audit (
    audit_id            NUMBER AUTOINCREMENT START 1 INCREMENT 1,
    target_table        VARCHAR,
    source_file_name    VARCHAR,
    rows_parsed         NUMBER,
    rows_loaded         NUMBER,
    error_count         NUMBER,
    first_error_message VARCHAR,
    first_error_line    NUMBER,
    load_status         VARCHAR,
    loaded_by           VARCHAR DEFAULT CURRENT_USER(),
    loaded_at           TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
)
COMMENT = 'Tracks COPY INTO results for each raw table load run';


SELECT * from crunchbase_raw.audit.ingestion_table_audit;