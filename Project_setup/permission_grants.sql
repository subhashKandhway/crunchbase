grant usage, operate 
      on warehouse crunchbase_ingest_wh
      to role crunchbase_loader;


grant usage, operate 
      on warehouse crunchbase_transform_wh
      to role crunchbase_transformer;


grant usage 
      on warehouse crunchbase_transform_wh
      to role crunchbase_reporter;