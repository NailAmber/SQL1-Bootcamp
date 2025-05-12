SELECT m.pizza_name, pz.name AS pizzeria_name FROM menu m
JOIN pizzeria 		AS pz 	ON pz.id = m.pizzeria_id
JOIN person_order 	AS po 	ON po.menu_id = m.id
JOIN person 		AS p 	ON p.id = po.person_id
WHERE p.name = 'Denis' OR p.name = 'Anna'
ORDER BY pizza_name, pizzeria_name