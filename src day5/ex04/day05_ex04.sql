-- Индексы работают для больших таблиц, 
-- где оптимизатор считает их использование эффективным.
-- Либо можно отключить Seq Scan для текущей сессии "SET enable_seqscan = OFF;"

-- Создание уникального индекса
CREATE UNIQUE INDEX idx_menu_unique ON menu(pizzeria_id, pizza_name);

-- Проверка использования индекса
EXPLAIN ANALYZE
SELECT *
FROM menu
WHERE pizzeria_id = 1 AND pizza_name = 'cheese pizza';