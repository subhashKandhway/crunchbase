-- Load objects.csv into the objects landing table
-- Co-authored with CoCo

USE ROLE CRUNCHBASE_LOADER;
USE WAREHOUSE CRUNCHBASE_INGEST_WH;
USE DATABASE CRUNCHBASE_RAW;
USE SCHEMA RAW;

COPY INTO crunchbase_raw.raw.objects
    (id, entity_type, entity_id, parent_id, name, normalized_name, permalink, category_code,
     status, founded_at, closed_at, domain, homepage_url, twitter_username, logo_url,
     logo_width, logo_height, short_description, description, overview, tag_list,
     country_code, state_code, city, region, first_investment_at, last_investment_at,
     investment_rounds, invested_companies, first_funding_at, last_funding_at, funding_rounds,
     funding_total_usd, first_milestone_at, last_milestone_at, milestones, relationships,
     created_by, created_at, updated_at,
     _source_file_name, _source_file_row_number, _source_file_content_key, _source_file_last_modified)
FROM (
    SELECT
        $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,
        $21,$22,$23,$24,$25,$26,$27,$28,$29,$30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$40,
        METADATA$FILENAME, METADATA$FILE_ROW_NUMBER, METADATA$FILE_CONTENT_KEY, METADATA$FILE_LAST_MODIFIED
    FROM @crunchbase_raw.ingestion.crunchbase_s3_stage/objects/
)
FILE_FORMAT = (FORMAT_NAME = crunchbase_raw.ingestion.crunchbase_csv_format)
-- CONTINUE skips the handful of malformed rows (unescaped quotes shifting
-- columns) instead of aborting the entire 462K-row load
ON_ERROR = 'CONTINUE'
FORCE = FALSE;

-- Log this load run into the ingestion audit table
INSERT INTO crunchbase_raw.audit.ingestion_table_audit
    (target_table, source_file_name, rows_parsed, rows_loaded, error_count,
     first_error_message, first_error_line, load_status)
SELECT 'crunchbase_raw.raw.objects', "file", "rows_parsed", "rows_loaded",
       "errors_seen", "first_error", "first_error_line", "status"
FROM TABLE(RESULT_SCAN(LAST_QUERY_ID()));


-- COPY INTO crunchbase_raw.raw.objects
-- FROM @crunchbase_raw.ingestion.crunchbase_s3_stage/objects/
-- FILE_FORMAT = (FORMAT_NAME = crunchbase_raw.ingestion.crunchbase_csv_format)
-- VALIDATION_MODE = 'RETURN_ALL_ERRORS';



-- SELECT *
-- FROM TABLE(INFORMATION_SCHEMA.COPY_HISTORY(
--     TABLE_NAME=>'CRUNCHBASE_RAW.RAW.OBJECTS',
--     START_TIME=>DATEADD(HOUR,-2,CURRENT_TIMESTAMP())
-- ));


SELECT * FROM crunchbase_raw.raw.objects;

