-- Revert stinch-db:uuid from pg

BEGIN;

DROP EXTENSION "uuid-ossp" CASCADE;

COMMIT;
