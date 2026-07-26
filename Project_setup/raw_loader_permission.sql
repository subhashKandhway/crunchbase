-- Grants for crunchbase_loader role on crunchbase_raw database
-- Co-authored with CoCo

GRANT USAGE ON DATABASE crunchbase_raw TO ROLE crunchbase_loader;

GRANT USAGE ON SCHEMA crunchbase_raw.raw TO ROLE crunchbase_loader;

GRANT USAGE ON SCHEMA crunchbase_raw.ingestion TO ROLE crunchbase_loader;

GRANT USAGE ON SCHEMA crunchbase_raw.audit TO ROLE crunchbase_loader;



GRANT CREATE TABLE ON SCHEMA crunchbase_raw.raw TO ROLE crunchbase_loader;

GRANT CREATE STAGE, CREATE FILE FORMAT ON SCHEMA crunchbase_raw.ingestion TO ROLE crunchbase_loader;

GRANT CREATE TABLE ON SCHEMA crunchbase_raw.audit TO ROLE crunchbase_loader;



GRANT SELECT,DELETE,INSERT,UPDATE,TRUNCATE ON ALL TABLES IN SCHEMA crunchbase_raw.raw TO ROLE crunchbase_loader;
GRANT SELECT,DELETE,INSERT,UPDATE,TRUNCATE ON FUTURE TABLES IN SCHEMA crunchbase_raw.raw TO ROLE crunchbase_loader;


-- Grant access to existing and future stages
GRANT USAGE ON ALL STAGES IN SCHEMA crunchbase_raw.ingestion TO ROLE crunchbase_loader;
GRANT USAGE ON FUTURE STAGES IN SCHEMA crunchbase_raw.ingestion TO ROLE crunchbase_loader;
GRANT READ, WRITE ON ALL STAGES IN SCHEMA crunchbase_raw.ingestion TO ROLE crunchbase_loader;
GRANT READ, WRITE ON FUTURE STAGES IN SCHEMA crunchbase_raw.ingestion TO ROLE crunchbase_loader;

-- Grant access to existing and future file formats
GRANT USAGE ON ALL FILE FORMATS IN SCHEMA crunchbase_raw.ingestion TO ROLE crunchbase_loader;
GRANT USAGE ON FUTURE FILE FORMATS IN SCHEMA crunchbase_raw.ingestion TO ROLE crunchbase_loader;


