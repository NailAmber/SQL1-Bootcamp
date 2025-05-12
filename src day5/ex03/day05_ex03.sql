-- Индексы работают для больших таблиц, 
-- где оптимизатор считает их использование эффективным.
-- Либо можно отключить Seq Scan для текущей сессии "SET enable_seqscan = OFF;"

-- Создание многоколоночного индекса
CREATE INDEX idx_person_order_multi ON person_order (person_id, menu_id, order_date);

-- Проверка использования индекса
EXPLAIN ANALYZE
SELECT person_id, menu_id, order_date
FROM person_order
WHERE person_id = 8 AND menu_id = 19;