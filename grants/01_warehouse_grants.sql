-- Warehouse grants to functional roles
-- Co-authored with CoCo

USE ROLE SECURITYADMIN;

-- Loader: operate ingestion warehouse
GRANT USAGE, OPERATE ON WAREHOUSE crunchbase_ingest_wh
    TO ROLE crunchbase_loader;

-- Transformer: operate transform warehouse
GRANT USAGE, OPERATE ON WAREHOUSE crunchbase_transform_wh
    TO ROLE crunchbase_transformer;

-- Reporter: use transform warehouse (read-only queries)
GRANT USAGE ON WAREHOUSE crunchbase_transform_wh
    TO ROLE crunchbase_reporter;
