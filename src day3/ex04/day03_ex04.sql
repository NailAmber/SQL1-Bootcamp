WITH people AS (
    SELECT p.gender, pz.name AS pizzeria_name
    FROM person_order AS po
    JOIN person AS p ON po.person_id = p.id
    JOIN menu AS m ON po.menu_id = m.id
    JOIN pizzeria AS pz ON m.pizzeria_id = pz.id
)
, pizzerias_gender AS (
    SELECT pizzeria_name
    FROM people
    GROUP BY pizzeria_name
    HAVING COUNT(DISTINCT gender) = 1
)
SELECT pizzeria_name
FROM pizzerias_gender
ORDER BY pizzeria_name;
