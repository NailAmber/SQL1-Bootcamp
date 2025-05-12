CREATE SEQUENCE seq_person_discounts
    START WITH 1;

ALTER TABLE person_discounts
    ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');

DO $$
DECLARE
    row_count integer;
BEGIN
    SELECT COUNT(*) INTO row_count FROM person_discounts;
    PERFORM setval('seq_person_discounts', row_count + 1, false);
END $$;

SELECT last_value, is_called
FROM seq_person_discounts;

