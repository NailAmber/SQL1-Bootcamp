-- SESSION #1
BEGIN;

-- SESSION #2
BEGIN;

-- SESSION #1
UPDATE pizzeria SET rating = 3.6 WHERE id = 1;

-- SESSION #2
UPDATE pizzeria SET rating = 3.6 WHERE id = 2;

-- SESSION #1
UPDATE pizzeria SET rating = 3.6 WHERE id = 2;

-- SESSION #2
UPDATE pizzeria SET rating = 3.6 WHERE id = 1;

-- SESSION #1
COMMIT;

-- SESSION #2
COMMIT;
