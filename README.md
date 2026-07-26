# Crunchbase Analytics Project

Learning Snowflake + dbt. It resembles a real-world startup/company dataset (similar to Crunchbase) with companies, funding rounds, investors, acquisitions, IPOs, people, and offices.

## Project Structure

```
├── infrastructure/            -- Snowflake object creation (run as SYSADMIN/USERADMIN)
│   ├── 01_roles.sql           -- Role hierarchy
│   ├── 02_databases.sql       -- raw, prod, dev databases
│   ├── 03_schemas.sql         -- Schemas in raw and prod
│   └── 04_warehouses.sql      -- Compute warehouses
│
├── grants/                    -- Permission grants (run as SECURITYADMIN)
│   ├── 01_warehouse_grants.sql
│   ├── 02_raw_grants.sql      -- Loader role on crunchbase_raw
│   └── 03_prod_grants.sql     -- Transformer + reporter roles on prod/dev
│
├── deploy.sql                 -- Execution order reference
└── README.md
```

## Roles

| Role | Purpose |
|------|---------|
| `crunchbase_admin` | Project admin, owns all child roles |
| `crunchbase_loader` | Loads raw data from S3 into `crunchbase_raw` |
| `crunchbase_transformer` | dbt transforms from raw → prod |
| `crunchbase_reporter` | Read-only access to `crunchbase_prod` |

## Databases

| Database | Purpose |
|----------|---------|
| `crunchbase_raw` | Source-aligned landing zone |
| `crunchbase_prod` | Production analytics models |
| `crunchbase_dev` | dbt development sandbox |

## Deployment Order

1. `infrastructure/01_roles.sql`
2. `infrastructure/02_databases.sql`
3. `infrastructure/03_schemas.sql`
4. `infrastructure/04_warehouses.sql`
5. `grants/01_warehouse_grants.sql`
6. `grants/02_raw_grants.sql`
7. `grants/03_prod_grants.sql`
