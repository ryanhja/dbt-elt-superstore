SELECT datname FROM pg_database;

CREATE COLLATION general_ci_ai (
   PROVIDER = icu,
   DETERMINISTIC = FALSE,
   LOCALE = '@ColStrength=primary'
);

\c superstore
