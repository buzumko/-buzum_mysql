/* Проанализировать запросы, которые выполнялись на занятии, 
 * определить возможные корректировки и/или улучшения (JOIN пока не применять).
*/

SET FOREIGN_KEY_CHECKS = 0;
SET FOREIGN_KEY_CHECKS = 1;

USE vk;

-- UPDATE profiles SET gender = NULL;
-- UPDATE profiles SET gender = floor(1 + rand()*2);
-- SELECT * FROM profiles;

-- ALTER TABLE media ADD COLUMN metadata JSON;
-- SELECT * FROM media;

-- SELECT * FROM information_schema.REFERENTIAL_CONSTRAINTS WHERE TABLE_NAME = 'media';

-- ALTER TABLE media DROP CONSTRAINT fk_media_type_id;


-- DROP TABLE IF EXISTS media_types;
-- CREATE TABLE media_types (
--   id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
--   media_type_name VARCHAR(100) NOT NULL
-- );
-- 
-- INSERT INTO media_types 
--  (media_type_name) 
-- VALUES 
--   ('VIDEO'),
--   ('AUDIO'),
--   ('IMAGE'),
--   ('GIF');
-- SELECT * FROM media_types;

-- Create copy table media
-- CREATE TABLE copy_media
-- LIKE media;
-- INSERT INTO copy_media
-- SELECT *
-- FROM media;
-- SELECT * FROM copy_media;


-- ALTER TABLE media DROP COLUMN media_type;
-- ALTER TABLE media ADD COLUMN media_type INT UNSIGNED NOT NULL;
-- ALTER TABLE media ADD CONSTRAINT fk_media_type_id FOREIGN KEY (media_type) REFERENCES media_types(id);

-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");
-- INSERT INTO media (media_type, link) VALUES (floor(1 + RAND()*4), "http://my-server/dir/");

-- UPDATE media SET metadata = concat(
-- 		'{ "name" : "',
-- 		SUBSTRING(MD5(RAND()), 1, 10),
-- 		'", "extention": "',
-- 		CASE media_type
-- 			WHEN 1 THEN 'avi'
-- 			WHEN 2 THEN 'wav'
-- 			WHEN 3 THEN 'png'
-- 			ELSE 'gif'
-- 		END,
-- 		'", "size" : "',
-- 		floor(RAND()*1000000),
-- 		'KB" }'
-- 	);
-- 
SELECT * FROM media LIMIT 10;


-- SELECT
-- 	concat_ws('.', metadata->>"$.name", metadata->>"$.extention")
-- FROM
-- 	media
-- LIMIT 1;

-- UPDATE
-- 	media
-- SET
-- 	link = concat(
-- 	link, 
-- 	metadata->>"$.name", 
-- 	'.', 
-- 	metadata->>"$.extention"
-- );

-- **** 2 ****

SELECT * FROM friendship WHERE user_id = 1 AND friendship_status = 1 AND confirmed_at IS NOT NULL;

UPDATE friendship SET  user_id = 1 WHERE user_id < 10;
SELECT * FROM friendship WHERE user_id < 10 ORDER BY user_id;
UPDATE friendship SET  friend_id = 10 WHERE user_id = 1 AND  friend_id = 1;

-- **** 2 ****
SELECT * FROM friendship WHERE friend_id = 1 AND friendship_status = 1 AND confirmed_at IS NOT NULL;
UPDATE friendship SET  friend_id = 1 WHERE user_id BETWEEN 11 AND  20;

-- **** 3 ****
SELECT
	friend_id
FROM
	friendship
WHERE
	user_id = 1
	AND friendship_status = 1
	AND confirmed_at IS NOT NULL
UNION
SELECT
	user_id
FROM
	friendship
WHERE
	friend_id = 1
	AND friendship_status = 1
	AND confirmed_at IS NOT NULL;

-- *** 4 ***

UPDATE messages SET from_user_id = floor(1 + rand()*100), to_user_id = floor(1 + rand()*100);
SELECT * FROM messages;
UPDATE messages SET to_user_id =  1 WHERE id < 15;

UPDATE messages SET from_user_id = (
	SELECT
		friend_id
	FROM
		friendship
	WHERE
		user_id = 1
		AND friendship_status = 1
		AND confirmed_at IS NOT NULL
	UNION
	SELECT
		user_id AS friend_id
	FROM
		friendship
	WHERE
		friend_id = 1
		AND friendship_status = 1
		AND confirmed_at IS NOT NULL
	ORDER BY rand()
	LIMIT 1
)
WHERE 
 to_user_id = 1;



SELECT
	*
FROM
	messages 
WHERE
	to_user_id = 1
	AND is_delivered = 0
	AND from_user_id IN (
SELECT
		friend_id
	FROM
		friendship
	WHERE
		user_id = 1
		AND friendship_status = 1
		AND confirmed_at IS NOT NULL
	UNION
	SELECT
		user_id AS friend_id
	FROM
		friendship
	WHERE
		friend_id = 1
		AND friendship_status = 1
		AND confirmed_at IS NOT NULL
	);

SELECT
	from_user_id,
	to_user_id,
	count(1)
FROM
	messages 
WHERE
	to_user_id = 1
	AND is_delivered = 0
	AND from_user_id IN (
SELECT
		friend_id
	FROM
		friendship
	WHERE
		user_id = 1
		AND friendship_status = 1
		AND confirmed_at IS NOT NULL
	UNION
	SELECT
		user_id AS friend_id
	FROM
		friendship
	WHERE
		friend_id = 1
		AND friendship_status = 1
		AND confirmed_at IS NOT NULL
	)
GROUP BY 
	to_user_id, from_user_id
;

SELECT
	(
	SELECT concat_ws(' ', first_name, last_name) 
	FROM profiles p 
	WHERE p.user_id = m.from_user_id 
	) AS from_user_name,
	(
	SELECT concat_ws(' ', first_name, last_name) 
	FROM profiles p 
	WHERE p.user_id = m.to_user_id 
	) AS to_user_name,
	count(1) AS counter
FROM
	messages m
WHERE
	m.to_user_id = 1
	AND m.is_delivered = 0
	AND m.from_user_id IN (
SELECT
		friend_id
	FROM
		friendship
	WHERE
		user_id = 1
		AND friendship_status = 1
		AND confirmed_at IS NOT NULL
	UNION
	SELECT
		user_id AS friend_id
	FROM
		friendship
	WHERE
		friend_id = 1
		AND friendship_status = 1
		AND confirmed_at IS NOT NULL
	)
GROUP BY 
	to_user_id, from_user_id
ORDER BY 
	counter DESC 
;

-- **** new query Стена****

SELECT * FROM posts;


INSERT INTO posts (user_id, community_id, post_content, visibility) VALUES (
	floor(1 + RAND()*100),
	floor(1 + RAND()*100),
	MD5(RAND()),
	(	
		SELECT value
		FROM visibility
		ORDER BY RAND()
		LIMIT 1
	)
);

SELECT * FROM communities_users WHERE user_id = 1;
UPDATE communities_users SET user_id = 1 WHERE community_id < 30;

-- communities posts



