-- Verify stinch-db:appschema on pg

BEGIN;

SELECT pg_catalog.has_schema_privilege('stinch', 'usage');

ROLLBACK;
