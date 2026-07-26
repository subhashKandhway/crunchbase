-- Grants for crunchbase_loader on crunchbase_raw
-- Co-authored with CoCo

USE ROLE SECURITYADMIN;

-- Database and schema access
GRANT USAGE ON DATABASE crunchbase_raw TO ROLE crunchbase_loader;
GRANT USAGE ON SCHEMA crunchbase_raw.raw TO ROLE crunchbase_loader;
GRANT USAGE ON SCHEMA crunchbase_raw.ingestion TO ROLE crunchbase_loader;
GRANT USAGE ON SCHEMA crunchbase_raw.audit TO ROLE crunchbase_loader;

-- Create privileges
GRANT CREATE TABLE ON SCHEMA crunchbase_raw.raw TO ROLE crunchbase_loader;
GRANT CREATE STAGE, CREATE FILE FORMAT ON SCHEMA crunchbase_raw.ingestion TO ROLE crunchbase_loader;
GRANT CREATE TABLE ON SCHEMA crunchbase_raw.audit TO ROLE crunchbase_loader;

-- DML on raw tables
GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE ON ALL TABLES IN SCHEMA crunchbase_raw.raw TO ROLE crunchbase_loader;
GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE ON FUTURE TABLES IN SCHEMA crunchbase_raw.raw TO ROLE crunchbase_loader;

-- Stages
GRANT USAGE ON ALL STAGES IN SCHEMA crunchbase_raw.ingestion TO ROLE crunchbase_loader;
GRANT USAGE ON FUTURE STAGES IN SCHEMA crunchbase_raw.ingestion TO ROLE crunchbase_loader;
GRANT READ, WRITE ON ALL STAGES IN SCHEMA crunchbase_raw.ingestion TO ROLE crunchbase_loader;
GRANT READ, WRITE ON FUTURE STAGES IN SCHEMA crunchbase_raw.ingestion TO ROLE crunchbase_loader;

-- File formats
GRANT USAGE ON ALL FILE FORMATS IN SCHEMA crunchbase_raw.ingestion TO ROLE crunchbase_loader;
GRANT USAGE ON FUTURE FILE FORMATS IN SCHEMA crunchbase_raw.ingestion TO ROLE crunchbase_loader;
