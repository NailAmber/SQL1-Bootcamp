-- SESSION #1
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';  -- Should show rating = 5

-- SESSION #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- SESSION #1
COMMIT;

-- SESSION #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';