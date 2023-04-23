CREATE DATABASE IF NOT EXISTS hw_03;

USE hw_03;

DROP TABLE IF EXISTS staff;
CREATE TABLE staff
(
	id INT PRIMARY KEY AUTO_INCREMENT, 
    firstname VARCHAR(45),
    lastname VARCHAR(45),
    post VARCHAR(45),
    seniority INT, 
    salary DECIMAL (8,2),
    age INT
);

INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
 ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
 ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
 ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
 ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
 ('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
 ('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
 ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
 ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
 ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
 ('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
 ('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
 ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
 
 SELECT * 
 FROM staff;
 
 -- Задание 1.
 -- Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания
 
SELECT *
FROM staff
ORDER BY salary DESC;

SELECT *
FROM staff
ORDER BY salary;

 -- Задание 2.
 -- Выведите 5 максимальных заработных плат (salary)
 
SELECT salary
FROM staff
ORDER BY salary DESC
LIMIT 5;

 -- Задание 3.
 -- Посчитайте суммарную зарплату по каждой специальности (роst)
 
SELECT 
	post AS "Специальность",
    SUM(salary) AS "Сумарная ЗП по cпециальности"
FROM staff
GROUP BY post;

 -- Задание 4.
 -- Найдите кол во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
 
SELECT 
    COUNT(post) AS "Количество сотрудников Рабочий в возрасте 24-49 лет"
FROM staff
WHERE age BETWEEN 24 and 49
GROUP BY post
HAVING post = "Рабочий";

 -- Задание 5.
 -- Найдите количество специальностей
 
SELECT 
    COUNT(DISTINCT post) AS "Количество специальностей"
FROM staff;

 -- Задание 6.
 -- Выведите специальности, у которых средний возраст сотрудников меньше 30 лет

SELECT 
	post AS "Cпециальность"
FROM staff
GROUP BY post
HAVING ROUND(AVG(age)) < 30;