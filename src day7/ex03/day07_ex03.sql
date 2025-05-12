WITH visits AS (
    SELECT
        pz.name AS pizzeria_name,
        COUNT(pv.id) AS count_of_visits
    FROM person_visits pv
    JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    GROUP BY pz.name
),
orders AS (
    SELECT
        pz.name AS pizzeria_name,
        COUNT(po.id) AS count_of_orders
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
    GROUP BY pz.name
)
SELECT
    COALESCE(v.pizzeria_name, o.pizzeria_name) AS name,
    COALESCE(v.count_of_visits, 0) + COALESCE(o.count_of_orders, 0) AS total_count
FROM visits v
FULL OUTER JOIN orders o ON v.pizzeria_name = o.pizzeria_name
ORDER BY total_count DESC, name ASC;
