USE ROLE sysadmin;

CREATE WAREHOUSE IF NOT EXISTS crunchbase_ingest_wh
warehouse_size='XSMALL'
auto_suspend=60
auto_resume=true
initially_suspended=true
MIN_CLUSTER_COUNT =1
MAX_CLUSTER_COUNT =2
scaling_policy='STANDARD'
comment='warehouse for s3 to snowflake Crunchbase ingestion';


CREATE WAREHOUSE IF NOT EXISTS crunchbase_transform_wh
warehouse_size='XSMALL'
auto_suspend=60
auto_resume=true
initially_suspended=true
MIN_CLUSTER_COUNT =1
MAX_CLUSTER_COUNT =1
scaling_policy='STANDARD'
comment='warehouse for dbt cloud for crunchbase dbt transformation';



