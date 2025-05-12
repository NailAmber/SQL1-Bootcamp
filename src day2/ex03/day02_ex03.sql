WITH date_series AS (
    SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) AS visit_date
),
	visits AS (
    SELECT DISTINCT visit_date FROM person_visits
    WHERE person_id = 1 OR person_id = 2
)
SELECT ds.visit_date::date AS missing_date
FROM date_series ds
LEFT JOIN visits ON ds.visit_date = visits.visit_date
WHERE visits.visit_date IS NULL
ORDER BY missing_date ASC