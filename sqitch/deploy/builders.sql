-- Deploy builders
-- requires: schema

BEGIN;

   SET client_min_messages = 'warning';

   ALTER TABLE builderlist.builders ADD COLUMN  builder_sub_date timestamp NULL;

COMMIT;
