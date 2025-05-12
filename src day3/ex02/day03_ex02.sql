SELECT m.pizza_name, m.price, pz.name AS pizzeria_name FROM menu m
LEFT JOIN person_order po ON po.menu_id = m.id
JOIN pizzeria pz ON pz.id = m.pizzeria_id
WHERE po.menu_id IS NULL
ORDER BY m.pizza_name, m.price

