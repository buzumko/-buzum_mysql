/*
1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
Заполните их текущими датой и временем.
*/

USE shop;

UPDATE users 
SET created_at = NOW(),
    updated_at = NOW()
 WHERE id > 0;

SELECT * FROM users;

/*
2. Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR 
и в них долгое время помещались значения в формате 20.10.2017 8:10. Необходимо преобразовать поля к типу DATETIME, 
сохранив введённые ранее значения.
*/


ALTER TABLE users MODIFY created_at DATETIME;
ALTER TABLE users MODIFY updated_at DATETIME;

DESCRIBE users;
SELECT * FROM users;

/*
3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 
0, если товар закончился и выше нуля, если на складе имеются запасы. 
Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. 
Однако нулевые запасы должны выводиться в конце, после всех записей.
*/

INSERT INTO storehouses_products
  (value,  created_at,  updated_at)
VALUES
  (0, NOW(), NOW()),
  (2500, NOW(), NOW()),
  (0, NOW(), NOW()),
  (1, NOW(), NOW()),
  (30, NOW(), NOW()),
  (500, NOW(), NOW());


SELECT * FROM storehouses_products
  ORDER BY 
   CASE 
       WHEN value != 0 THEN value 
       ELSE 2147483647 
   END;

 SELECT value FROM storehouses_products
  ORDER BY 
   CASE 
       WHEN value != 0 THEN value 
       ELSE 2147483647 
   END;

--   5. (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. 
-- SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.

   SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY FIELD(id, 5, 1, 2) ASC,
    id ASC;
