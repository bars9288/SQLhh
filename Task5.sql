SELECT vacancy_id, vacancy_name FROM vacances
JOIN responses ON vacances.vacancy_id = responses.responses_vacancy
    AND extract(week from responses.responses_data) - extract(week from vacances.posting_date) <= 1
GROUP BY vacances.vacancy_id
HAVING count(response_id) > 5;


