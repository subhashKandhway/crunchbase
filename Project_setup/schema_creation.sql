-- Schema creation for crunchbase_prod with purpose-specific comments
-- Co-authored with CoCo

CREATE SCHEMA IF NOT EXISTS crunchbase_prod.core
COMMENT = 'Conformed dimensions and shared entities';


CREATE SCHEMA IF NOT EXISTS crunchbase_prod.finance
COMMENT = 'Financial data including funding rounds, acquisitions, and IPOs';


CREATE SCHEMA IF NOT EXISTS crunchbase_prod.people
COMMENT = 'People and relationship data including founders, employees, and degrees';


CREATE SCHEMA IF NOT EXISTS crunchbase_prod.semantic
COMMENT = 'Semantic layer views and analyst-facing models';


CREATE SCHEMA IF NOT EXISTS crunchbase_prod.audit
COMMENT = 'Data quality checks, lineage tracking, and audit logs';



CREATE SCHEMA IF NOT EXISTS crunchbase_raw.raw
DATA_RETENTION_TIME_IN_DAYS=1
COMMENT='Raw Crunchbase source tables loaded from s3';


CREATE SCHEMA IF NOT EXISTS crunchbase_raw.ingestion
DATA_RETENTION_TIME_IN_DAYS=1
COMMENT='Stages, file formats and ingestion metadata';


CREATE SCHEMA IF NOT EXISTS crunchbase_raw.audit
DATA_RETENTION_TIME_IN_DAYS=1
COMMENT='Load-control and ingestion-audit tables';


