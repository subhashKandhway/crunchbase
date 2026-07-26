-- Warehouse setup for crunchbase project
-- Co-authored with CoCo

USE ROLE SYSADMIN;

CREATE WAREHOUSE IF NOT EXISTS crunchbase_ingest_wh
    WAREHOUSE_SIZE   = 'XSMALL'
    AUTO_SUSPEND     = 60
    AUTO_RESUME      = TRUE
    INITIALLY_SUSPENDED = TRUE
    MIN_CLUSTER_COUNT = 1
    MAX_CLUSTER_COUNT = 2
    SCALING_POLICY   = 'STANDARD'
    COMMENT          = 'Warehouse for S3-to-Snowflake Crunchbase ingestion';

CREATE WAREHOUSE IF NOT EXISTS crunchbase_transform_wh
    WAREHOUSE_SIZE   = 'XSMALL'
    AUTO_SUSPEND     = 60
    AUTO_RESUME      = TRUE
    INITIALLY_SUSPENDED = TRUE
    MIN_CLUSTER_COUNT = 1
    MAX_CLUSTER_COUNT = 1
    SCALING_POLICY   = 'STANDARD'
    COMMENT          = 'Warehouse for dbt transformations';
