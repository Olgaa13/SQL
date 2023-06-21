USE mobile_phones;

SELECT * FROM mobile_phones;

-- 2. 	Выведите название, производителя и цену для товаров, количество которых превышает 2 
SELECT ProductName, Manufacturer, Price FROM mobile_phones WHERE ProductCount > 2;

-- 3.  	Выведите весь ассортимент товаров марки “Samsung”
SELECT * FROM mobile_phones WHERE Manufacturer = 'Samsung';

-- 4. 	Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000**
SELECT * FROM mobile_phones WHERE ProductCount * Price > 100000 and ProductCount * Price < 145000;

/* 
4.*** С помощью регулярных выражений найти (можно использовать операторы “LIKE”, “RLIKE” для 4.3 ):
	4.1. Товары, в которых есть упоминание "Iphone"
	4.2. "Galaxy"
	4.3.  Товары, в которых есть ЦИФРЫ
	4.4.  Товары, в которых есть ЦИФРА "8"  
*/
-- 4.1
SELECT * FROM mobile_phones WHERE ProductName LIKE '%Iphone%';
-- 4.2
SELECT * FROM mobile_phones WHERE CONCAT_WS(' ', ProductName, Manufacturer) LIKE '%Samsung%';
-- 4.3
SELECT * FROM mobile_phones WHERE ProductName REGEXP '[0-9]';
-- 4.4
SELECT * FROM mobile_phones WHERE ProductName LIKE '%8%';