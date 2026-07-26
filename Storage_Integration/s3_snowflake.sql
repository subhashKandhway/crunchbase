-- S3 storage integration for Crunchbase data ingestion
-- Co-authored with CoCo

USE ROLE ACCOUNTADMIN;

CREATE STORAGE INTEGRATION IF NOT EXISTS crunchbase_s3_int
    TYPE = EXTERNAL_STAGE
    STORAGE_PROVIDER = 'S3'
    ENABLED = TRUE
    STORAGE_AWS_ROLE_ARN = '&AWS_ROLE_ARN'
    STORAGE_ALLOWED_LOCATIONS = ('&S3_BUCKET_URL');

-- After creation, run this to get the AWS IAM values
-- needed for the trust policy on your IAM role:
DESC INTEGRATION crunchbase_s3_int;

