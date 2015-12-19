-- Verify stinch-db:citext on pg

BEGIN;

SELECT 'Foo'::citext;

ROLLBACK;
