-- SESSION #1
BEGIN;

-- SESSION #2
BEGIN;

-- SESSION #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- SESSION #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- SESSION #1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';

-- SESSION #2 Stucks after execute
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

-- SESSION #1
COMMIT;

-- SESSION #2
COMMIT;

-- SESSION #1 3.6 as result
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- SESSION #2 3.6 as result
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';