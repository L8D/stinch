-- Revert stinch-db:appschema from pg

BEGIN;

DROP SCHEMA stinch CASCADE;

COMMIT;
