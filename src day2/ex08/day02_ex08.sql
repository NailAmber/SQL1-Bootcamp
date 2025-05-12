SELECT p.name FROM person_order po
JOIN person AS p ON po.person_id = p.id
JOIN menu AS m ON m.id = po.menu_id
WHERE (p.address = 'Moscow' OR p.address = 'Samara') AND 
	(m.pizza_name = 'pepperoni pizza' OR m.pizza_name = 'mushroom pizza') AND
	p.gender = 'male'
ORDER BY name DESC
