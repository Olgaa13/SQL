-- 1. Создайте таблицу “orders”, заполните ее значениями. 
-- Покажите “полный” статус заказа, используя оператор CASE. 

USE dz_2_sql;

DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
order_date DATE NOT NULL,
bucket VARCHAR(50) NOT NULL
);

INSERT INTO sales (order_date, bucket)
VALUES 
("2021-01-01", "101 to 300"),
("2021-01-02", "101 to 300"),
("2021-01-03", "less than equal to 100"),
("2021-01-04", "101 to 300"),
("2021-01-05", "greater than 300");

SELECT * FROM sales;


-- 2. Разделите  значения поля “bucket” на 3 сегмента: меньше 100(“Маленький заказ”),  
-- 100-300(“Средний заказ”) и больше 300 (“Большой заказ”)

-- SELECT order_date, bucket,
-- CASE bucket
-- WHEN bucket = '101 to 300' THEN 'Средний заказ'
-- WHEN bucket = 'less than equal to 100' THEN 'Маленький заказ'
-- ELSE 'Большой заказ'
-- END AS bucket_comment
-- FROM sales;
--   
SET SQL_SAFE_UPDATES = 0;
UPDATE sales
SET bucket=
CASE
	WHEN bucket = "101 to 300" THEN "Средний заказ"
	WHEN bucket = "less than equal to 100" THEN "Маленький заказ"
	WHEN bucket = "greater than 300" THEN "Большой заказ" 
END;
select * FROM sales;

-- 3. Создайте таблицу “orders”, заполните ее значениями. 
-- Покажите “полный” статус заказа, используя оператор CASE. 


DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
employeeid VARCHAR (10) NOT NULL,
amount DECIMAL (5, 2) NOT NULL,
orderstatus TEXT NOT NULL
);

INSERT INTO orders (employeeid, amount, orderstatus)
VALUES
("e03", 15.00, "OPEN"),
("e01", 25.50, "OPEN"),
("e05", 100.70, "CLOSED"),
("e02", 22.18, "OPEN"),
("e04", 9.50, "CANCELLED"),
("e04", 99.99, "OPEN");
SELECT * FROM orders;

SELECT id, orderstatus,
CASE orderstatus
	WHEN "OPEN" THEN "Order is in open state."
	WHEN "CLOSED" THEN "Order is closed."
	ELSE "Order is cancelled." 
END AS order_summary
FROM orders;
SELECT * FROM orders;

-- 4. 	Чем 0 отличается от NULL?
-- Напишите ответ в комментарии к домашнему заданию на платформе

-- 0 - это цифровое значение. NULL - это отсутствие значений в ячейке.
