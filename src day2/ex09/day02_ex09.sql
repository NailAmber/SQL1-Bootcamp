WITH cheese_person(person_name) AS (
	SELECT p.name FROM person_order po
	JOIN person AS p ON po.person_id = p.id
	JOIN menu AS m ON m.id = po.menu_id
	WHERE (m.pizza_name = 'cheese pizza') AND p.gender = 'female'
	ORDER BY name
),
pepperoni_person(person_name) AS (
	SELECT p.name FROM person_order po
	JOIN person AS p ON po.person_id = p.id
	JOIN menu AS m ON m.id = po.menu_id
	WHERE (m.pizza_name = 'pepperoni pizza') AND p.gender = 'female'
	ORDER BY name
)

SELECT cheese_person.person_name FROM cheese_person
JOIN pepperoni_person ON cheese_person.person_name = pepperoni_person.person_name
ORDER BY person_name