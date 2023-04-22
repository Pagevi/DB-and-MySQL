CREATE DATABASE IF NOT EXISTS hw_02;
USE hw_02;

-- Задание 1.
-- Используя операторы языка SQL, создайте таблицу “sales ”. Заполните ее данными

CREATE TABLE IF NOT EXISTS sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    count_product INT
);
INSERT INTO sales(order_date, count_product)
VALUES 
	(20220101, 156),
    (20220102, 180),
    (20220103, 21),
    (20220104, 124),
    (20220105, 341);
SELECT * FROM sales;

-- Задание 2.
-- Для данных таблицы sales  укажите тип заказа в зависимости от кол ва :
-- меньше 100 Маленький заказ
-- от 100 до 300 Средний заказ
-- больше 300 Большой заказ

SELECT 
id AS "id заказа",
CASE
	WHEN count_product < 100 THEN "Маленький заказ"
	WHEN count_product BETWEEN 100 AND 300 THEN "Средний заказ"
	WHEN count_product > 300 THEN "Большой заказ"
END AS "Тип заказа"
FROM sales;

-- Задание 3.
-- Создайте таблицу “ orders ”, заполните ее значениями
-- Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status OPEN « Order is in open state » ; 
-- CLOSED « Order is closed » ; CANCELLED « Order is cancelled »

CREATE TABLE IF NOT EXISTS orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(45) UNIQUE,
    amount FLOAT,
    order_status VARCHAR(45)
);
INSERT INTO orders(employee_id, amount, order_status)
VALUES 
	("e03", 15.00, "OPEN"),
    ("e01", 25.50, "OPEN"),
    ("e05", 100.70, "CLOSED"),
    ("e02", 22.18, "OPEN"),
    ("e04", 9.50, "CANCELLED");
    
SELECT 
CASE
	WHEN order_status = "OPEN" THEN "Order is in open state"
	WHEN order_status = "CLOSED" THEN "Order is closed"
	WHEN order_status = "CANCELLED" THEN "Order is cancelled"
END AS "full_order_status"
FROM orders;