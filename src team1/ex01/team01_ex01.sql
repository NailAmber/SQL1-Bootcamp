INSERT INTO currency VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');
INSERT INTO currency VALUES (100, 'EUR', 0.79, '2022-01-08 13:29');


WITH detailed_currency AS (
    SELECT
        b.user_id,
        b.money,
        cur.name AS currency_name,
        (
            SELECT cs.rate_to_usd
            FROM currency cs
            WHERE cs.id = b.currency_id
              AND cs.updated <= b.updated
            ORDER BY cs.updated DESC
            LIMIT 1
        ) AS past_rate,
        (
            SELECT cs.rate_to_usd
            FROM currency cs
            WHERE cs.id = b.currency_id
              AND cs.updated > b.updated
            ORDER BY cs.updated ASC
            LIMIT 1
        ) AS future_rate
    FROM balance b
    JOIN currency cur ON cur.id = b.currency_id
	GROUP BY
    	b.money, cur.name, cur.id, b.updated, b.currency_id, b.user_id
    ORDER BY past_rate DESC, future_rate ASC, b.updated ASC
)

SELECT 
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    dc.currency_name,
    dc.money * COALESCE(dc.past_rate, dc.future_rate) AS currency_in_usd
FROM detailed_currency dc
LEFT JOIN public."user" u ON dc.user_id = u.id
ORDER BY name DESC, lastname ASC, currency_name ASC;
