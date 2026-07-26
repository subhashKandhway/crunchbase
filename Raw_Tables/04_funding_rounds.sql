-- Landing table for the funding_rounds dataset
-- Co-authored with CoCo

USE ROLE CRUNCHBASE_LOADER;
USE WAREHOUSE CRUNCHBASE_INGEST_WH;
USE DATABASE CRUNCHBASE_RAW;
USE SCHEMA RAW;

CREATE OR REPLACE TABLE crunchbase_raw.raw.funding_rounds (
    id                          VARCHAR,
    funding_round_id            VARCHAR,
    object_id                   VARCHAR,
    funded_at                   DATE,
    funding_round_type          VARCHAR,
    funding_round_code          VARCHAR,
    raised_amount_usd           NUMBER,
    raised_amount               NUMBER,
    raised_currency_code        VARCHAR,
    pre_money_valuation_usd     NUMBER,
    pre_money_valuation         NUMBER,
    pre_money_currency_code     VARCHAR,
    post_money_valuation_usd    NUMBER,
    post_money_valuation        NUMBER,
    post_money_currency_code    VARCHAR,
    participants                NUMBER,
    is_first_round              BOOLEAN,
    is_last_round               BOOLEAN,
    source_url                  VARCHAR,
    source_description          VARCHAR,
    created_by                  VARCHAR,
    created_at                  TIMESTAMP_NTZ,
    updated_at                  TIMESTAMP_NTZ,
    _source_file_name           VARCHAR,
    _source_file_row_number     NUMBER,
    _source_file_content_key    VARCHAR,
    _source_file_last_modified  TIMESTAMP_NTZ,
    _loaded_at                  TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
)
COMMENT = 'Landing table for funding_rounds.csv - funding round events linked to objects';
