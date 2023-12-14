SELECT vacancy_id, vacancy_name FROM vacances
JOIN responses ON vacances.vacancy_id = responses.responses_vacancy
    WHERE date_part('day', responses.responses_data - vacances.posting_date) <= 7
GROUP BY vacances.vacancy_id
HAVING count(response_id) > 5;


