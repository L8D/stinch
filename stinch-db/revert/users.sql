-- Revert stinch-db:users from pg

BEGIN;

DROP TABLE stinch.users CASCADE;

COMMIT;
