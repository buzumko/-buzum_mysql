/*
1. ѕусть в таблице users пол€ created_at и updated_at оказались незаполненными. 
«аполните их текущими датой и временем.
*/

USE shop;

UPDATE users 
SET created_at = NOW(),
    updated_at = NOW()
 WHERE id > 0;

SELECT * FROM users;

/*
2. “аблица users была неудачно спроектирована. «аписи created_at и updated_at были заданы типом VARCHAR 
и в них долгое врем€ помещались значени€ в формате 20.10.2017 8:10. Ќеобходимо преобразовать пол€ к типу DATETIME, 
сохранив введЄнные ранее значени€.
*/


ALTER TABLE users MODIFY created_at DATETIME;
ALTER TABLE users MODIFY updated_at DATETIME;

DESCRIBE users;
SELECT * FROM users;

/*
3. ¬ таблице складских запасов storehouses_products в поле value могут встречатьс€ самые разные цифры: 
0, если товар закончилс€ и выше нул€, если на складе имеютс€ запасы. 
Ќеобходимо отсортировать записи таким образом, чтобы они выводились в пор€дке увеличени€ значени€ value. 
ќднако нулевые запасы должны выводитьс€ в конце, после всех записей.
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

--   5. (по желанию) »з таблицы catalogs извлекаютс€ записи при помощи запроса. 
-- SELECT * FROM catalogs WHERE id IN (5, 1, 2); ќтсортируйте записи в пор€дке, заданном в списке IN.

   SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY FIELD(id, 5, 1, 2) ASC,
    id ASC;
