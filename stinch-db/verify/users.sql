-- Verify stinch-db:users on pg

BEGIN;

SELECT id, name, email, password, created_at, updated_at FROM stinch.users WHERE FALSE;

INSERT INTO
    stinch.users (name, email, password)
    VALUES ('bob', 'bob@example.com', gen_salt('bf', 8));

ROLLBACK;
