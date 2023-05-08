DROP DATABASE IF EXISTS hw_05;
CREATE DATABASE hw_05;
USE hw_05;

CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

-- Задание 1.1. Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов

CREATE VIEW cars_before_25k AS
SELECT *
FROM cars
WHERE cost <= 25000;

SELECT *
FROM cars_before_25k;

-- Задание 1.2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)

CREATE OR REPLACE VIEW cars_before_25k AS
SELECT *
FROM cars
WHERE cost <= 30000;

SELECT *
FROM cars_before_25k;

-- Задание 1.3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

CREATE VIEW audi_skoda AS
SELECT *
FROM cars
WHERE `name` IN ("Audi", "Skoda");

SELECT *
FROM audi_skoda;

-- Задание 2. Добавьте новый столбец под названием «время до следующей станции».

CREATE TABLE trains
(
	train_id INT,
    station VARCHAR(20),
    station_time TIME
);

INSERT trains
VALUES
	(110, "San Francisco", "10:00:00"),
    (110, "Redwood City", "10:54:00"),
    (110, "Palo Alto", "11:02:00"),
    (110, "San Jose", "12:35:00"),
	(120, "San Francisco", "11:00:00"),
    (120, "Palo Alto", "12:49:00"), 
    (120, "San Jose", "13:30:00"); 
    
SELECT *
FROM trains;

SELECT *,
CASE
	WHEN TIMEDIFF(LEAD(station_time) OVER(), station_time) < 0
		THEN NULL
	ELSE TIMEDIFF(LEAD(station_time) OVER() , station_time)
END AS "time_to_next_station"
FROM trains;