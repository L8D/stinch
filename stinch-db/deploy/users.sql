-- Deploy stinch-db:users to pg
-- requires: appschema
-- requires: uuid
-- requires: citext
-- requires: record_triggers
-- requires: pgcrypto

BEGIN;

CREATE TABLE stinch.users
    ( id         UUID PRIMARY KEY
    , name       TEXT NOT NULL
    , email      CITEXT NOT NULL UNIQUE
    , password   TEXT NOT NULL -- This will be a crypt() hash
    , created_at TIMESTAMP NOT NULL
    , updated_at TIMESTAMP NOT NULL
    );

CREATE UNIQUE INDEX users_email
    ON stinch.users (email);

CREATE TRIGGER users_insert
    BEFORE INSERT ON stinch.users
    FOR EACH ROW
    EXECUTE PROCEDURE stinch.on_record_insert();

CREATE TRIGGER users_update
    BEFORE UPDATE ON stinch.users
    FOR EACH ROW
    EXECUTE PROCEDURE stinch.on_record_update();

COMMIT;
