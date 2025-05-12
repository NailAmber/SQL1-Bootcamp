SELECT m.id AS menu_id FROM menu m
WHERE NOT EXISTS 
	(
	SELECT po.menu_id AS menu_id 
	FROM person_order po 
	WHERE po.menu_id = m.id
	)
ORDER BY menu_id

