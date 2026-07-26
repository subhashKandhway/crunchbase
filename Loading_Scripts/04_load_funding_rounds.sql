-- Load funding_rounds.csv into the funding_rounds landing table
-- Co-authored with CoCo

USE ROLE CRUNCHBASE_LOADER;
USE WAREHOUSE CRUNCHBASE_INGEST_WH;
USE DATABASE CRUNCHBASE_RAW;
USE SCHEMA RAW;

COPY INTO crunchbase_raw.raw.funding_rounds
    (id, funding_round_id, object_id, funded_at, funding_round_type, funding_round_code,
     raised_amount_usd, raised_amount, raised_currency_code, pre_money_valuation_usd,
     pre_money_valuation, pre_money_currency_code, post_money_valuation_usd, post_money_valuation,
     post_money_currency_code, participants, is_first_round, is_last_round, source_url,
     source_description, created_by, created_at, updated_at,
     _source_file_name, _source_file_row_number, _source_file_content_key, _source_file_last_modified)
FROM (
    SELECT
        $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22,$23,
        METADATA$FILENAME, METADATA$FILE_ROW_NUMBER, METADATA$FILE_CONTENT_KEY, METADATA$FILE_LAST_MODIFIED
    FROM @crunchbase_raw.ingestion.crunchbase_s3_stage/funding_rounds/
)
FILE_FORMAT = (FORMAT_NAME = crunchbase_raw.ingestion.crunchbase_csv_format)
ON_ERROR = 'ABORT_STATEMENT'
FORCE = FALSE;
