-- Landing table for the relationships dataset
-- Co-authored with CoCo

USE ROLE CRUNCHBASE_LOADER;
USE WAREHOUSE CRUNCHBASE_INGEST_WH;
USE DATABASE CRUNCHBASE_RAW;
USE SCHEMA RAW;

CREATE OR REPLACE TABLE crunchbase_raw.raw.relationships (
    id                       VARCHAR,
    relationship_id          VARCHAR,
    person_object_id         VARCHAR,
    relationship_object_id   VARCHAR,
    start_at                 DATE,
    end_at                   DATE,
    is_past                  BOOLEAN,
    sequence                 NUMBER,
    title                    VARCHAR,
    created_at               TIMESTAMP_NTZ,
    updated_at               TIMESTAMP_NTZ,
    _source_file_name           VARCHAR,
    _source_file_row_number     NUMBER,
    _source_file_content_key    VARCHAR,
    _source_file_last_modified  TIMESTAMP_NTZ,
    _loaded_at                  TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
)
COMMENT = 'Landing table for relationships.csv - people-to-object relationships (e.g. employment)';
