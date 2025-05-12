-- SESSION #1
BEGIN ISOLATION LEVEL READ COMMITTED;

-- SESSION #2
BEGIN ISOLATION LEVEL READ COMMITTED;

-- SESSION #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- 4

-- SESSION #2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;

-- SESSION #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- 3.6
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- 3.6

-- SESSION #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- 3.6
