-- Индексы работают для больших таблиц, 
-- где оптимизатор считает их использование эффективным.
-- Либо можно отключить Seq Scan для текущей сессии "SET enable_seqscan = OFF;"

-- Создание частичного уникального индекса
CREATE UNIQUE INDEX idx_person_order_order_date ON person_order (person_id, menu_id)
WHERE order_date = '2022-01-01';

-- Проверка использования индекса через EXPLAIN ANALYZE
EXPLAIN ANALYZE
SELECT person_id, menu_id
FROM person_order
WHERE order_date = '2022-01-01' AND person_id = 1 AND menu_id = 1;