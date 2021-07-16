/* 3. ���������� ����� ���������� ������, ������� �������� 10 ����� ������� �������������.
 ������� ��������� ������� ������, ������� �������� ��� ������ �� ������������� � ������ �� ��� ������

*/

SET FOREIGN_KEY_CHECKS = 0;
-- SET FOREIGN_KEY_CHECKS = 1;

USE vk;
SELECT * FROM entity_types;
-- ������ �����
-- CREATE TABLE entity_types (
--   id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
--   entity_type_name varchar(100) UNIQUE NOT NULL
-- );

-- DROP TABLE likes;
-- CREATE TABLE likes (
-- 	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     from_user_id INT UNSIGNED NOT NULL,
--     entity_id INT UNSIGNED NOT NULL,
--     entity_type_id INT UNSIGNED NOT NULL,
--     created_at datetime DEFAULT CURRENT_TIMESTAMP,
--     updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
-- );

-- INSERT INTO entity_types (entity_type_name) VALUES ('profiles'),  ('posts'), ('media');

-- ALTER TABLE likes ADD CONSTRAINT fk_likes_entity_type_id FOREIGN KEY (entity_type_id) REFERENCES entity_types(id);
-- 
-- DESC likes;
-- 
-- INSERT INTO likes (from_user_id, entity_id, entity_type_id) VALUES (floor(1 + RAND()*100), floor(1 + RAND()*100), floor(1 + RAND()*3));
-- INSERT INTO likes (from_user_id, entity_id, entity_type_id) VALUES (floor(1 + RAND()*100), floor(1 + RAND()*100), floor(1 + RAND()*3));
-- INSERT INTO likes (from_user_id, entity_id, entity_type_id) VALUES (floor(1 + RAND()*100), floor(1 + RAND()*100), floor(1 + RAND()*3));
-- INSERT INTO likes (from_user_id, entity_id, entity_type_id) VALUES (floor(1 + RAND()*100), floor(1 + RAND()*100), floor(1 + RAND()*3));
-- INSERT INTO likes (from_user_id, entity_id, entity_type_id) VALUES (floor(1 + RAND()*100), floor(1 + RAND()*100), floor(1 + RAND()*3));
-- INSERT INTO likes (from_user_id, entity_id, entity_type_id) VALUES (floor(1 + RAND()*100), floor(1 + RAND()*100), floor(1 + RAND()*3));
-- INSERT INTO likes (from_user_id, entity_id, entity_type_id) VALUES (floor(1 + RAND()*100), floor(1 + RAND()*100), floor(1 + RAND()*3));
-- INSERT INTO likes (from_user_id, entity_id, entity_type_id) VALUES (floor(1 + RAND()*100), floor(1 + RAND()*100), floor(1 + RAND()*3));
-- INSERT INTO likes (from_user_id, entity_id, entity_type_id) VALUES (floor(1 + RAND()*100), floor(1 + RAND()*100), floor(1 + RAND()*3));
-- INSERT INTO likes (from_user_id, entity_id, entity_type_id) VALUES (floor(1 + RAND()*100), floor(1 + RAND()*100), floor(1 + RAND()*3));
-- INSERT INTO likes (from_user_id, entity_id, entity_type_id) VALUES (floor(1 + RAND()*100), floor(1 + RAND()*100), floor(1 + RAND()*3));


-- ����� 10 ����� ������� �������������

SELECT
	concat_ws(' ', first_name, last_name) AS user_name,
	floor((to_days(now()) - to_days(birth_date))/ 365.25) AS age
FROM
	profiles 
ORDER BY age
LIMIT 10;


-- ���������� ������ �� ������� ������������ 98 (�� ����� �������)

SELECT
	count(1)
FROM
	likes
WHERE
	entity_id = 98
	AND entity_type_id = 1;

-- ���������� ������ �� ��� ������ ������������ 98 (�� ����� �������)

SELECT
	count(1)
FROM
	likes
WHERE
	entity_id = 98;


-- ��������� 1 �������



SELECT
	count(1)
FROM
	likes
WHERE
	entity_type_id = 1
	AND entity_id IN ( 
		WITH age_sm_users AS (
		SELECT
			user_id AS u_id,
			floor((to_days(now()) - to_days(birth_date))/ 365.25) AS age
		FROM
			profiles
		ORDER BY
			age
		LIMIT 10)
		SELECT
			u_id
		FROM
			age_sm_users );


-- ��������� 2 �������



SELECT
	count(1) 
FROM
	likes
WHERE
	entity_id IN (
		WITH age_sm_users AS (
		SELECT
			  user_id AS u_id,
		      floor((to_days(now()) - to_days(birth_date))/ 365.25) AS age
			FROM
				profiles
			ORDER BY
				age
			LIMIT 10)
		SELECT
		u_id
		FROM age_sm_users 
	);


