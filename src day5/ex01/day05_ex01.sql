-- Индексы работают для больших таблиц, 
-- где оптимизатор считает их использование эффективным.
-- Либо можно отключить Seq Scan для текущей сессии "SET enable_seqscan = OFF;"

-- Запрос данных
SELECT 
    m.pizza_name,
    pz.name AS pizzeria_name
FROM menu m
JOIN pizzeria pz ON m.pizzeria_id = pz.id;

-- Проверка работы индексов
EXPLAIN ANALYZE
SELECT 
    m.pizza_name,
    pz.name AS pizzeria_name
FROM menu m
JOIN pizzeria pz ON m.pizzeria_id = pz.id;