-- Verify builders

BEGIN;

    SELECT subscriber_id, first_name, last_name, builder_is_anonymous, builder_sub_date
        FROM support.transactions
    WHERE false;

ROLLBACK;
