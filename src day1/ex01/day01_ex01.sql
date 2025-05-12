SELECT object_name FROM (
SELECT m.pizza_name AS object_name, 2 AS sort
FROM menu m
UNION ALL
SELECT p.name AS object_name, 1 AS sort
FROM person p
ORDER BY sort, object_name
);