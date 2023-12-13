-- Наибольшее количество Вакансий - месяц (с учетом года)
SELECT
    extract(year from posting_date) AS Year,
    extract(month from posting_date) AS Month,
    count(vacancy_id) AS items
FROM vacances
GROUP BY Year, Month
ORDER BY items
OFFSET 11;


-- Наибольшее количество Резюме - месяц (с учетом года)
SELECT
    extract(year from posting_date) AS Year,
    extract(month from posting_date) AS Month,
    count(resume_id) AS items
FROM resumes
GROUP BY Year, Month
ORDER BY items
OFFSET 11;

