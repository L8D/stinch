-- Deploy stinch-db:record_triggers to pg
-- requires: uuid

BEGIN;

CREATE OR REPLACE FUNCTION stinch.on_record_insert() RETURNS trigger AS $$
    BEGIN
        NEW.id         := uuid_generate_v4();
        NEW.created_at := now();
        NEW.updated_at := now();
        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION stinch.on_record_update() RETURNS trigger AS $$
    BEGIN
        NEW.id         := OLD.id;
        NEW.created_at := OLD.created_at;
        NEW.updated_at := now();
        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

COMMIT;
