-- Соискатели + (1)
    CREATE TABLE persons (
      person_id SERIAL NOT NULL PRIMARY KEY,
      person_first_name VARCHAR NOT NULL DEFAULT 'Иван',
      person_second_name VARCHAR NOT NULL DEFAULT 'Иванов',
      person_middleName VARCHAR DEFAULT 'Иванович',
      person_phone INT8 NOT NULL DEFAULT 89992223344
    );

-- Регионы + (2)
    CREATE TABLE areas (
      area_id SERIAL NOT NULL PRIMARY KEY,  -- код региона РФ
      name VARCHAR NOT NULL,
      area_MROT INTEGER NOT NULL DEFAULT 999 -- Мин Разм Оплаты Труда по региону
    );

-- Работодатели + (3)
    CREATE TABLE employers (    -- Работодатели
      employer_id SERIAL NOT NULL PRIMARY KEY,
      employer_name VARCHAR,
      employer_rating INTEGER DEFAULT 0 -- Рейтинг
    );

-- Специализации + (4)
    CREATE TABLE specializations (    -- Специализаци
      sprecialization_id SERIAL NOT NULL PRIMARY KEY,
      sprecialization_name VARCHAR(50) NOT NULL-- Отрасль экономики
    );

-- Резюме + (5)
   CREATE TABLE  resumes (
     resume_id SERIAL NOT NULL PRIMARY KEY,
     posting_date DATE NOT NULL DEFAULT timestamp '2022-02-24 00:04:00',
     person_id INTEGER NOT NULL REFERENCES persons ( person_id ),
     wished_salary INTEGER NOT NULL,
     wished_area_id INTEGER NOT NULL REFERENCES areas ( area_id ) DEFAULT 77,
     wished_specialization_id INTEGER REFERENCES specializations ( sprecialization_id )

   );

-- Вакансии + (6)
    CREATE TABLE vacances (
      vacancy_id SERIAL NOT NULL PRIMARY KEY,
      vacancy_name VARCHAR NOT NULL,
      posting_date DATE NOT NULL DEFAULT timestamp '2022-02-24 00:04:00',
      area_id INTEGER NOT NULL REFERENCES areas ( area_id ) DEFAULT 77,
      vacancy_daily_regime VARCHAR DEFAULT 'Полный',  -- График труда (полный, свободный, частитчный, удаленка)
      vacancy_previous_experience INTEGER DEFAULT 0,  -- Требуемый опыт, лет
      employer_id INTEGER NOT NULL REFERENCES employers ( employer_id ), -- Работодатель
      compensation_from INTEGER DEFAULT 5000,  -- Зарплата минимум
      compensation_to INTEGER DEFAULT 10000,  -- Зарплата максимум
      compensation_gross BOOLEAN DEFAULT FALSE,  -- НДФЛ 13% учет (Итого = Значение - налог, если TRUE)
      specialization_id INTEGER REFERENCES specializations ( sprecialization_id ) -- код специализации
    );


-- Отклики + (7)
   CREATE TABLE  responses (
     response_id SERIAL NOT NULL PRIMARY KEY,
     responses_vacancy INTEGER NOT NULL REFERENCES vacances ( vacancy_id ),
     responses_resumes INTEGER NOT NULL REFERENCES resumes ( resume_id ),
     responses_data DATE NOT NULL
   );

