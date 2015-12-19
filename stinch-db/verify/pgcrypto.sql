-- Verify stinch-db:pgcrypto on pg

BEGIN;

SELECT crypt('foo', 'bar');

ROLLBACK;
