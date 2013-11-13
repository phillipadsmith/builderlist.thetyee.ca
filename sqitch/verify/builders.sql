-- Verify builders

BEGIN;

    SELECT subscriber_id, first_name, last_name, builder_is_anonymous
        FROM support.transactions
    WHERE false;

ROLLBACK;
