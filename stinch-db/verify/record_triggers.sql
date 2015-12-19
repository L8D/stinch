-- Verify stinch-db:record_triggers on pg

BEGIN;

CREATE TABLE dummy_records
    ( id UUID PRIMARY KEY
    , created_at TIMESTAMP NOT NULL
    , updated_at TIMESTAMP NOT NULL
    );

CREATE TRIGGER records_insert
    BEFORE INSERT ON dummy_records
    FOR EACH ROW
    EXECUTE PROCEDURE stinch.on_record_insert();

CREATE TRIGGER records_update
    BEFORE UPDATE ON dummy_records
    FOR EACH ROW
    EXECUTE PROCEDURE stinch.on_record_update();

INSERT INTO dummy_records DEFAULT VALUES;

ROLLBACK;
