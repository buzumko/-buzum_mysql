
-- 1. Составьте список пользователей users, 
-- которые осуществили хотя бы один заказ orders в интернет магазине.

USE shop;

DESC orders;

-- DROP TABLE IF EXISTS orders;
-- CREATE TABLE orders (
--   id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
--   user_id INT UNSIGNED,
--   created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
--   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--   KEY index_of_user_id(user_id)
-- ) COMMENT = 'Заказы';


-- INSERT INTO orders(user_id, created_at, updated_at) VALUES
--   (floor(1 + RAND()*9), NOW(), NOW());
-- INSERT INTO orders(user_id, created_at, updated_at) VALUES
--   (floor(1 + RAND()*9), NOW(), NOW());
--   INSERT INTO orders(user_id, created_at, updated_at) VALUES
--   (floor(1 + RAND()*9), NOW(), NOW());
--   INSERT INTO orders(user_id, created_at, updated_at) VALUES
--   (floor(1 + RAND()*9), NOW(), NOW());
--   INSERT INTO orders(user_id, created_at, updated_at) VALUES
--   (floor(1 + RAND()*9), NOW(), NOW());
--   INSERT INTO orders(user_id, created_at, updated_at) VALUES
--   (floor(1 + RAND()*9), NOW(), NOW());
--   INSERT INTO orders(user_id, created_at, updated_at) VALUES
--   (floor(1 + RAND()*9), NOW(), NOW());
--   INSERT INTO orders(user_id, created_at, updated_at) VALUES
--   (floor(1 + RAND()*9), NOW(), NOW());
--   INSERT INTO orders(user_id, created_at, updated_at) VALUES
--   (floor(1 + RAND()*9), NOW(), NOW());
--   INSERT INTO orders(user_id, created_at, updated_at) VALUES
--   (floor(1 + RAND()*9), NOW(), NOW());
--   INSERT INTO orders(user_id, created_at, updated_at) VALUES
--   (floor(1 + RAND()*9), NOW(), NOW());
--   INSERT INTO orders(user_id, created_at, updated_at) VALUES
--   (floor(1 + RAND()*9), NOW(), NOW());
--   INSERT INTO orders(user_id, created_at, updated_at) VALUES
--   (floor(1 + RAND()*9), NOW(), NOW());
--   INSERT INTO orders(user_id, created_at, updated_at) VALUES
--   (floor(1 + RAND()*9), NOW(), NOW());
--   INSERT INTO orders(user_id, created_at, updated_at) VALUES
--   (floor(1 + RAND()*9), NOW(), NOW());

SELECT * FROM users u ;
DESC users;
INSERT INTO users VALUES (10, 'Вадим', NULL, NOW(), NOW());

-- Составьте список пользователей users, 
-- которые осуществили хотя бы один заказ orders в интернет магазине.

WITH ord_us AS
(SELECT u.name, count(1)
FROM users u 
INNER JOIN orders o ON (
	u.id = o.user_id
	)
GROUP BY name)
SELECT name
FROM ord_us;

-- 2. Выведите список товаров products и разделов catalogs, который соответствует товару.

DESC products;
SELECT * FROM products p;

SELECT p.name AS p_name, c.name
FROM products p 
LEFT JOIN catalogs c ON (
	p.catalog_id = c.id 
	);
