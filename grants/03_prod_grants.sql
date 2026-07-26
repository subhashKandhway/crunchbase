-- Grants for transformer and reporter roles on prod/dev databases
-- Co-authored with CoCo

USE ROLE SECURITYADMIN;

-- ============================================================
-- TRANSFORMER: read raw, write prod + dev
-- ============================================================

-- Read access on crunchbase_raw (dbt sources)
GRANT USAGE ON DATABASE crunchbase_raw TO ROLE crunchbase_transformer;
GRANT USAGE ON SCHEMA crunchbase_raw.raw TO ROLE crunchbase_transformer;
GRANT SELECT ON ALL TABLES IN SCHEMA crunchbase_raw.raw TO ROLE crunchbase_transformer;
GRANT SELECT ON FUTURE TABLES IN SCHEMA crunchbase_raw.raw TO ROLE crunchbase_transformer;

-- Write access on crunchbase_prod (dbt target)
GRANT USAGE ON DATABASE crunchbase_prod TO ROLE crunchbase_transformer;
GRANT USAGE ON ALL SCHEMAS IN DATABASE crunchbase_prod TO ROLE crunchbase_transformer;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE crunchbase_prod TO ROLE crunchbase_transformer;
GRANT CREATE TABLE, CREATE VIEW, CREATE DYNAMIC TABLE ON ALL SCHEMAS IN DATABASE crunchbase_prod TO ROLE crunchbase_transformer;
GRANT CREATE TABLE, CREATE VIEW, CREATE DYNAMIC TABLE ON FUTURE SCHEMAS IN DATABASE crunchbase_prod TO ROLE crunchbase_transformer;

-- Dev sandbox (dbt dev builds)
GRANT USAGE ON DATABASE crunchbase_dev TO ROLE crunchbase_transformer;
GRANT CREATE SCHEMA ON DATABASE crunchbase_dev TO ROLE crunchbase_transformer;

-- ============================================================
-- REPORTER: read-only on crunchbase_prod
-- ============================================================

GRANT USAGE ON DATABASE crunchbase_prod TO ROLE crunchbase_reporter;
GRANT USAGE ON ALL SCHEMAS IN DATABASE crunchbase_prod TO ROLE crunchbase_reporter;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE crunchbase_prod TO ROLE crunchbase_reporter;

GRANT SELECT ON ALL TABLES IN DATABASE crunchbase_prod TO ROLE crunchbase_reporter;
GRANT SELECT ON FUTURE TABLES IN DATABASE crunchbase_prod TO ROLE crunchbase_reporter;
GRANT SELECT ON ALL VIEWS IN DATABASE crunchbase_prod TO ROLE crunchbase_reporter;
GRANT SELECT ON FUTURE VIEWS IN DATABASE crunchbase_prod TO ROLE crunchbase_reporter;
