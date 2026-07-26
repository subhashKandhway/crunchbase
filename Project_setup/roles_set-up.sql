-- Creates roles for the crunchbase analytics project
-- Co-authored with CoCo

use role useradmin;


create role if not exists crunchbase_admin
 COMMENT='Administrative role for the crunchbase analytics project';

create role if not exists crunchbase_loader
 COMMENT='Role for loading raw data into the crunchbase analytics project';

create role if not exists crunchbase_transformer
 COMMENT='Role for transforming and modeling data in the crunchbase analytics project';

create role if not exists crunchbase_reporter
 COMMENT='Role for querying and reporting on data in the crunchbase analytics project';


-- Role hierarchy: reporter -> transformer -> loader -> admin -> sysadmin
grant role crunchbase_reporter to role crunchbase_transformer;
grant role crunchbase_transformer to role crunchbase_loader;
grant role crunchbase_loader to role crunchbase_admin;
grant role crunchbase_admin to role sysadmin;

grant role crunchbase_admin to user A762657;

