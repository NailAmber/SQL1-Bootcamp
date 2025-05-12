-- SESSION #1
BEGIN ISOLATION LEVEL SERIALIZABLE;

-- SESSION #2
BEGIN ISOLATION LEVEL SERIALIZABLE;

-- SESSION #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- 3.6

-- SESSION #2
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';
COMMIT;

-- SESSION #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- 3.6
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- 3.0

-- SESSION #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- 3.0
