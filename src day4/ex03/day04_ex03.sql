SELECT
    generated_date AS missing_date
FROM
    v_generated_dates
LEFT JOIN
    person_visits AS pv ON pv.visit_date = generated_date
WHERE
    pv.id IS NULL
ORDER BY
    missing_date;