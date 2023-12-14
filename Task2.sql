--генерация отношения соискателей
WITH persons_data(
    id_random,
    text_random,
    phone_random) AS (
SELECT
    generate_series(1,100000),
    md5(random()::text),
    (89999999999 - random()* (89999999999 - 89000000000)))
INSERT
INTO persons(
    person_id,
    person_first_name,
    person_second_name,
    person_middleName,
    person_phone)
SELECT
    id_random,
    'nam' || text_random,
    'fam' || text_random,
    'mid' || text_random,
    phone_random
FROM persons_data;

-- генерация отношения регионов
WITH regions_data(
    id_random,
    text_random,
    mrot_random) AS (
SELECT
    generate_series(1,88),
    md5(random()::text),
    round( (20000 - random()* (20000 - 10000))::int, -3))
INSERT
INTO areas(
    area_id,
    name,
    area_MROT
 )
SELECT
    id_random,
    text_random,
    mrot_random
FROM regions_data;

-- заполнение отношения работодателей
INSERT INTO employers
    (employer_id,
     employer_name,
     employer_rating)
VALUES
    (100,'HeadHunter',5),
    (101,'Газпром',4),
    (102,'Роскосмос',3),
    (103,'АвтоВАЗ',2),
    (104,'Внуково',1),
    (105,'VK Team',0);

-- заполнение отношения cпециализаций
INSERT INTO specializations
    (sprecialization_id,
     sprecialization_name)
VALUES
    (1,'Автомобильный бизнес'),
    (2,'Безопасность'),
    (3,'Высший и средний менеджмент'),
    (4,'Добыча сырья'),
    (5,'Закупки'),
    (6,'Искусство, развлечения, массмедиа'),
    (7,'Маркетинг, реклама, PR'),
    (8,'Наука, образование'),
    (9,'Производство, сервисное обслуживание');

-- генерация отношения резюме
WITH resume_data(
    id_random,
    posting_date_random,
    person_id,
    salary_random,
    area_id_random,
    specialization_random) AS (
SELECT
    generate_series(1,100000),
    timestamp '2023-12-30 23:59:59' - random() * (timestamp '2023-12-30 23:59:59' - timestamp '2023-01-01 00:00:01'),
    (100000 - random()* (100000 - 1)),
    round((150000 - random()* (150000 - 100000))::int,-4),
    (88 - random()* (88 - 1)),
    (9 - random()* (9 - 1))
)
INSERT
INTO resumes(
    resume_id,
    posting_date,
    person_id,
    wished_salary,
    wished_area_id,
    wished_specialization_id
)
SELECT
    id_random,
    posting_date_random,
    person_id,
    salary_random,
    area_id_random,
    specialization_random
FROM resume_data;

-- генерация вакансий
WITH vacances_data(
    id_random,
    text_random,
    date_random,
    area_id,
    employers_id,
    salary,
    specialization_random
    ) AS (
SELECT
    generate_series(1,10000),
    md5(random()::text),
    timestamp '2023-12-30 23:59:59' - random() * (timestamp '2023-12-30 23:59:59' - timestamp '2023-01-01 00:00:01'),
    (88 - random()* (88 - 1)),
    (105 - random()* (105 - 100)),
    round( (250000 - random()* (250000 - 150000))::int, -3),
    (9 - random()* (9 - 1)))
INSERT
INTO vacances(
    vacancy_id,
    vacancy_name,
    posting_date,
    area_id,
    vacancy_daily_regime,
    vacancy_previous_experience,
    employer_id,
    compensation_from,
    compensation_to,
    compensation_gross,
    specialization_id)
SELECT
    id_random,
    text_random,
    date_random,
    area_id,
    'Полный',
    3,
    employers_id,
    salary,
    salary + 20000,
    FALSE,
    specialization_random
FROM vacances_data;

-- генерация откликов
WITH responses_data(
    id_random,
    vacancy_random,
    vacancy_resumes,
    data_random) AS (
SELECT
    generate_series(1,1000),
    (10000 - random()* (10000 - 1)),
    (100000 - random()* (100000 - 1)),
    timestamp '2023-12-30 23:59:59' - random() * (timestamp '2023-12-30 23:59:59' - timestamp '2023-01-01 00:00:01') )
INSERT
INTO responses(
    response_id,
    responses_vacancy,
    responses_resumes ,
    responses_data)
SELECT
    id_random,
    vacancy_random,
    vacancy_resumes,
    data_random
FROM responses_data;

