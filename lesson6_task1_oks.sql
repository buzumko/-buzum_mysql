/* 1.Пусть задан некоторый пользователь. 
 * Из всех друзей этого пользователя найдите человека, 
 * который больше всех общался с нашим пользователем.
*/


SET FOREIGN_KEY_CHECKS=0;
SET FOREIGN_KEY_CHECKS=1;
USE vk;

-- выбираем пользователя, который больше всего общается с пользователем 1 

UPDATE messages SET from_user_id =floor(1 + RAND()*100), to_user_id=floor(1 + RAND()*100);

UPDATE messages SET to_user_id =1 WHERE id < 15;

WITH friends AS (
	SELECT f.friend_id 
	FROM friendship f 
	WHERE 
		f.user_id = 1
		AND f.friendship_status = 'FRIENDSHIP'
		AND confirmed_at IS NOT NULL 
	UNION
	SELECT f.user_id 
	FROM friendship f 
	WHERE 
		f.friend_id = 1
		AND f.friendship_status = 'FRIENDSHIP'
		AND confirmed_at IS NOT NULL 
)
SELECT
	concat_ws(' ', p.first_name, p.last_name) AS user_name,
	count(1) AS count_out
FROM
	profiles p
LEFT JOIN messages m ON
	(( p.id = m.from_user_id
		AND m.to_user_id = 1)
	OR (p.id = m.to_user_id
		AND m.from_user_id = 1
		AND m.is_delivered) )
GROUP BY
	user_name
ORDER BY
	count_out DESC
LIMIT 1;

-- выбираем друга, который больше всего общается с пользователем 1 


WITH friends AS (
SELECT
	f.friend_id
FROM
	friendship f
WHERE
	f.user_id = 1
	AND f.friendship_status = 'FRIENDSHIP'
	AND confirmed_at IS NOT NULL
UNION
SELECT
	f.user_id
FROM
	friendship f
WHERE
	f.friend_id = 1
	AND f.friendship_status = 'FRIENDSHIP'
	AND confirmed_at IS NOT NULL )
SELECT
	concat_ws(' ', p.first_name, p.last_name) AS user_name,
	count(1) AS count_out
FROM
	friends f
INNER JOIN profiles p ON
	( f.friend_id = p.user_id )
LEFT JOIN messages m ON
	(( p.id = m.from_user_id
		AND m.to_user_id = 1)
	OR (p.id = m.to_user_id
		AND m.from_user_id = 1
		AND m.is_delivered) )
GROUP BY user_name
ORDER BY count_out DESC 
LIMIT 1;



