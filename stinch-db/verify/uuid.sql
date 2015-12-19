-- Verify stinch-db:uuid on pg

BEGIN;

SELECT '38730bd4-a42a-11e5-ab7a-4c454224ff49'::uuid;

ROLLBACK;
