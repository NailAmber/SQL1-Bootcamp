WITH visits AS (
	SELECT pv.pizzeria_id,
	COUNT (CASE WHEN p.gender = 'female' THEN 1 ELSE NULL END) AS female_visits,
	COUNT (CASE WHEN p.gender = 'male' THEN 1 ELSE NULL END) AS male_visits
	FROM person_visits pv
	JOIN person p ON p.id = pv.person_id
	GROUP BY pv.pizzeria_id
)
SELECT p.name AS pizzeria_name FROM pizzeria p
JOIN visits v ON v.pizzeria_id = p.id
WHERE v.female_visits > v.male_visits
UNION ALL
SELECT p.name AS pizzeria_name FROM pizzeria p
JOIN visits v ON v.pizzeria_id = p.id
WHERE v.male_visits > v.female_visits
ORDER BY pizzeria_name
