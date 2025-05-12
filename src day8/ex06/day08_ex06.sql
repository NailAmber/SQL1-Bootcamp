-- SESSION #1
BEGIN ISOLATION LEVEL REPEATABLE READ;

-- SESSION #2
BEGIN ISOLATION LEVEL REPEATABLE READ;

-- SESSION #1
SELECT SUM(rating) FROM pizzeria; -- 26.9

-- SESSION #2
INSERT INTO pizzeria (id, name, rating) 
VALUES (11, 'Kazan Pizza 2', 4);
COMMIT;

-- SESSION #1
SELECT SUM(rating) FROM pizzeria; -- 26.9
COMMIT;
SELECT SUM(rating) FROM pizzeria; -- 30.9

-- SESSION #2
SELECT SUM(rating) FROM pizzeria; -- 30.9
