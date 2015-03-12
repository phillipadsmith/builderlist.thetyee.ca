-- Deploy builders
-- requires: schema

BEGIN;

   SET client_min_messages = 'warning';

   drop TABLE builderlist.builders;

COMMIT;
