COMMENT ON TABLE person_discounts IS 'Stores personalized discount information.';

COMMENT ON COLUMN person_discounts.id IS 'Unique identifier for each discount record (Primary Key).';

COMMENT ON COLUMN person_discounts.person_id IS 'Identifier for the person receiving the discount (Foreign Key referencing person.id).';

COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Identifier for the pizzeria offering the discount (Foreign Key referencing pizzeria.id).';

COMMENT ON COLUMN person_discounts.discount IS 'The discount percentage (0 to 100) assigned to the person at the specified pizzeria.';
