-- Зарплаты по регионам РФ
SELECT
    area_id,
    avg(compensation_from)::int AS compensation_from,
    avg(compensation_to)::int AS compensation_to,
    avg((compensation_to + compensation_from)/2)::int AS среднее_арифметическое_from_и_to
FROM vacances
GROUP BY area_id
ORDER BY area_id;

