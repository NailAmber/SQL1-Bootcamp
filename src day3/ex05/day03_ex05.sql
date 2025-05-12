SELECT DISTINCT pz.name AS pizzeria_name
FROM person_visits pv
JOIN pizzeria pz ON pv.pizzeria_id = pz.id
JOIN person p ON pv.person_id = p.id
JOIN menu m ON m.pizzeria_id = pz.id
LEFT JOIN person_order po ON pv.person_id = po.person_id AND m.id = po.menu_id
WHERE p.name = 'Andrey' AND po.id IS NULL
ORDER BY pz.name;
