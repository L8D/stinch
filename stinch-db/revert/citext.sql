-- Revert stinch-db:citext from pg

BEGIN;

DROP EXTENSION citext CASCADE;

COMMIT;
