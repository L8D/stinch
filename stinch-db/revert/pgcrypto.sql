-- Revert stinch-db:pgcrypto from pg

BEGIN;

DROP EXTENSION pgcrypto CASCADE;

COMMIT;
