-- SESSION #1
BEGIN ISOLATION LEVEL READ COMMITTED;

-- SESSION #2
BEGIN ISOLATION LEVEL READ COMMITTED;

-- SESSION #1
SELECT SUM(rating) FROM pizzeria; -- 21.9

-- SESSION #2
INSERT INTO pizzeria (id, name, rating) 
VALUES (10, 'Kazan Pizza', 5);
COMMIT;

-- SESSION #1
SELECT SUM(rating) FROM pizzeria; -- 26.9
COMMIT;
SELECT SUM(rating) FROM pizzeria; -- 26.9

-- SESSION #2
SELECT SUM(rating) FROM pizzeria; -- 26.9
