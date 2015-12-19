-- Deploy stinch-db:citext to pg

BEGIN;

CREATE EXTENSION citext;

COMMIT;
