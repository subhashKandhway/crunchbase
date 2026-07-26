-- Role hierarchy for crunchbase analytics project
-- Co-authored with CoCo

USE ROLE USERADMIN;

-- Functional roles
CREATE ROLE IF NOT EXISTS crunchbase_admin
    COMMENT = 'Administrative role for the crunchbase analytics project';

CREATE ROLE IF NOT EXISTS crunchbase_loader
    COMMENT = 'Role for loading raw data into crunchbase_raw';

CREATE ROLE IF NOT EXISTS crunchbase_transformer
    COMMENT = 'Role for dbt transformations from raw to prod';

CREATE ROLE IF NOT EXISTS crunchbase_reporter
    COMMENT = 'Read-only role for dashboards and reporting on crunchbase_prod';

-- Role hierarchy: reporter -> transformer -> loader -> admin -> sysadmin
GRANT ROLE crunchbase_reporter    TO ROLE crunchbase_transformer;
GRANT ROLE crunchbase_transformer TO ROLE crunchbase_loader;
GRANT ROLE crunchbase_loader      TO ROLE crunchbase_admin;
GRANT ROLE crunchbase_admin       TO ROLE SYSADMIN;

-- Assign admin to project owner
GRANT ROLE crunchbase_admin TO USER A762657;
