CREATE DATABASE IF NOT EXISTS crunchbase_dev 
DATA_RETENTION_TIME_IN_DAYS=1
COMMENT='Dev transformation created by dbt cloud';





CREATE DATABASE IF NOT EXISTS crunchbase_prod
DATA_RETENTION_TIME_IN_DAYS=1
COMMENT='Production crunchbase analytics models';



CREATE DATABASE IF NOT EXISTS crunchbase_raw
DATA_RETENTION_TIME_IN_DAYS=1
COMMENT='Landing database for source-aligned Crunchbase data';



