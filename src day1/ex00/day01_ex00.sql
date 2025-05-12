SELECT m.id AS object_id, m.pizza_name AS object_name
FROM menu m
UNION
SELECT p.id AS object_id, p.name AS object_name
FROM person p
ORDER by object_id, object_name;