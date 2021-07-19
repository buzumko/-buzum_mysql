/* 3. Определить кто больше поставил лайков (всего) - мужчины или женщины?

*/


USE vk;

-- выбираем женщин

SELECT
	user_id
FROM
	profiles 
WHERE gender = 'F';


-- количество лайков от женщин
DESC likes ;

WITH f_likes AS 
(SELECT
	p.user_id AS ui,
	count(1) AS lc
FROM
	profiles p
LEFT JOIN likes l ON
	( p.user_id = l.from_user_id )
WHERE
	p.gender = 'F')
SELECT lc
FROM f_likes;


-- объединим 



SELECT IF (
(
WITH f_likes AS 
(SELECT
	p.user_id AS ui,
	count(1) AS lc
FROM
	profiles p
LEFT JOIN likes l ON
	( p.user_id = l.from_user_id )
WHERE
	p.gender = 'F')
SELECT lc
FROM f_likes) > 
	(WITH f_likes AS 
(SELECT
	p.user_id AS ui,
	count(1) AS lc
FROM
	profiles p
LEFT JOIN likes l ON
	( p.user_id = l.from_user_id )
WHERE
	p.gender = 'M')
SELECT lc 
FROM f_likes), 'женщины', 'мужчины'
	);

	

