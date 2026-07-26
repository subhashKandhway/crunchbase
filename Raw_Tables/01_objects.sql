-- Landing table for the objects master dataset (companies, people, funds, etc.)
-- Co-authored with CoCo

USE ROLE CRUNCHBASE_LOADER;
USE WAREHOUSE CRUNCHBASE_INGEST_WH;
USE DATABASE CRUNCHBASE_RAW;
USE SCHEMA RAW;

CREATE OR REPLACE TABLE crunchbase_raw.raw.objects (
    id                    VARCHAR,
    entity_type           VARCHAR,
    entity_id             VARCHAR,
    parent_id             VARCHAR,
    name                  VARCHAR,
    normalized_name       VARCHAR,
    permalink             VARCHAR,
    category_code         VARCHAR,
    status                VARCHAR,
    founded_at            DATE,
    closed_at             DATE,
    domain                VARCHAR,
    homepage_url          VARCHAR,
    twitter_username      VARCHAR,
    logo_url              VARCHAR,
    logo_width            NUMBER,
    logo_height           NUMBER,
    short_description     VARCHAR,
    description           VARCHAR,
    overview              VARCHAR,
    tag_list              VARCHAR,
    country_code          VARCHAR,
    state_code            VARCHAR,
    city                  VARCHAR,
    region                VARCHAR,
    first_investment_at   DATE,
    last_investment_at    DATE,
    investment_rounds     NUMBER,
    invested_companies    NUMBER,
    first_funding_at      DATE,
    last_funding_at       DATE,
    funding_rounds        NUMBER,
    funding_total_usd     NUMBER,
    first_milestone_at    DATE,
    last_milestone_at     DATE,
    milestones            NUMBER,
    relationships         NUMBER,
    created_by            VARCHAR,
    created_at            TIMESTAMP_NTZ,
    updated_at            TIMESTAMP_NTZ,
    _source_file_name           VARCHAR,
    _source_file_row_number     NUMBER,
    _source_file_content_key    VARCHAR,
    _source_file_last_modified  TIMESTAMP_NTZ,
    _loaded_at                  TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
)
COMMENT = 'Landing table for objects.csv - master entity table (companies, people, funds, etc.)';




SELECT * FROM crunchbase_raw.raw.objects limit 10;