SELECT m.pizza_name AS pizza_name, m.price AS price, pz.name AS pizzeria_name, visit_date FROM person_visits pv
JOIN person AS p ON p.id = pv.person_id
JOIN pizzeria AS pz ON pz.id = pv.pizzeria_id
JOIN menu AS m ON m.pizzeria_id = pv.pizzeria_id
WHERE p.name = 'Kate' and m.price BETWEEN 800 AND 1000
ORDER BY pizza_name, price, pizzeria_name

