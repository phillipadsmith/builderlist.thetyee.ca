-- Deploy builders
-- requires: schema

BEGIN;

   SET client_min_messages = 'warning';

   CREATE TABLE builderlist.builders (
       subscriber_id         int PRIMARY KEY NOT NULL,
       first_name            text NOT NULL,
       last_name             text NOT NULL,
       builder_is_anonymous  int NOT NULL
    ); 

COMMIT;
