# Задание 2. 
# Выведите название, производителя и цену для товаров, количество которых превышает 2 (SQL - файл, скриншот, либо сам код)

SELECT product_name, manufacturer, price
FROM hw_01.mobile_phone
WHERE product_count > 2;

# Задние 3.
# Выведите весь ассортимент товаров марки “Samsung”

SELECT product_name
FROM hw_01.mobile_phone
WHERE manufacturer = "Samsung";

# Задание 4. 
# Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000**

SELECT product_name
FROM hw_01.mobile_phone
WHERE product_count * price > 100000 and product_count * price < 145000;

# Задание 4***. 
# С помощью регулярных выражений найти (можно использовать операторы “LIKE”, “RLIKE” для 4.3 ):
# Задание 4.1. Товары, в которых есть упоминание "Iphone"

SELECT product_name
FROM hw_01.mobile_phone
WHERE product_name LIKE "IPhone%";

# Задание 4.2. Товары, в которых есть упоминание "Galaxy"

SELECT product_name
FROM hw_01.mobile_phone
WHERE product_name LIKE "Galaxy%";

# Задание 4.4. Товары, в которых есть ЦИФРА "8"

SELECT product_name
FROM hw_01.mobile_phone
WHERE product_name LIKE "%8%";