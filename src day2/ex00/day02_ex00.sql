SELECT p.id, name, rating FROM pizzeria p
LEFT JOIN person_visits ON p.id = person_visits.pizzeria_id
WHERE person_visits.pizzeria_id IS NULL
