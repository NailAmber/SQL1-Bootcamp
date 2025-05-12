WITH visits AS (
    SELECT
        pz.name AS pizzeria_name,
        COUNT(pv.id) AS count_of_visits,
        'visit' AS action_type
    FROM person_visits pv
    JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    GROUP BY pz.name
    ORDER BY count_of_visits DESC
    LIMIT 3
),
orders AS (
    SELECT
        pz.name AS pizzeria_name,
        COUNT(po.id) AS count_of_orders,
        'order' AS action_type
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
    GROUP BY pz.name
    ORDER BY count_of_orders DESC
    LIMIT 3
)
SELECT 
    pizzeria_name AS name,
    count_of_visits AS count,
    action_type
FROM visits

UNION ALL

SELECT 
    pizzeria_name AS name,
    count_of_orders AS count,
    action_type
FROM orders

ORDER BY action_type ASC, count DESC;
