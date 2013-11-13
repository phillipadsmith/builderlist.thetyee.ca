-- Verify schema

BEGIN;

    SELECT pg_catalog.has_schema_privilege('builderlist', 'usage');

ROLLBACK;
