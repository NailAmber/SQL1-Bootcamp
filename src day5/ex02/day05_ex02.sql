-- Индексы работают для больших таблиц, 
-- где оптимизатор считает их использование эффективным.
-- Либо можно отключить Seq Scan для текущей сессии "SET enable_seqscan = OFF;"

-- Создание функционального индекса на UPPER(name)
CREATE INDEX idx_person_name ON person (UPPER(name));

-- Пример запроса, использующего индекс
SELECT *
FROM person
WHERE UPPER(name) = 'ANDREY';

-- Проверка использования индекса через EXPLAIN ANALYZE
EXPLAIN ANALYZE
SELECT *
FROM person
WHERE UPPER(name) = 'ANDREY';