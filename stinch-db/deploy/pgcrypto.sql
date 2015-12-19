-- Deploy stinch-db:pgcrypto to pg

BEGIN;

CREATE EXTENSION pgcrypto;

COMMIT;
