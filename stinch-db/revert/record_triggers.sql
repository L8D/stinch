-- Revert stinch-db:record_triggers from pg

BEGIN;

DROP FUNCTION stinch.on_record_insert() CASCADE;

DROP FUNCTION stinch.on_record_update() CASCADE;

COMMIT;
