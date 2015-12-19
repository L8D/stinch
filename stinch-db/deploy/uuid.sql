-- Deploy stinch-db:uuid to pg

BEGIN;

CREATE EXTENSION "uuid-ossp";

COMMIT;
