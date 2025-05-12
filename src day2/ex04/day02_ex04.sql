SELECT m.pizza_name, pizzeria.name AS pizzeria_name, m.price FROM menu m
JOIN pizzeria ON pizzeria.id = m.pizzeria_id
WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza'
ORDER BY pizza_name, pizzeria_name