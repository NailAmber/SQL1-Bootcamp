INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
SELECT 
    (SELECT COALESCE(MAX(id), 0) + 1 FROM person_visits), -- новый id = текущий максимум + 1
    (SELECT id FROM person WHERE name = 'Dmitriy'),
    (SELECT pz.id 
     FROM pizzeria pz
     JOIN menu m ON pz.id = m.pizzeria_id
     WHERE m.price < 800
       AND pz.name NOT IN (SELECT pizzeria_name FROM mv_dmitriy_visits_and_eats)
     LIMIT 1),
    '2022-01-08';

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;