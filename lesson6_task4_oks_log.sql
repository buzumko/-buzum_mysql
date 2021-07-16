/* 4. Определить кто больше поставил лайков (всего) - мужчины или женщины?

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
SELECT
	count(1)
FROM
	likes
WHERE
	from_user_id IN (
		SELECT
			user_id
		FROM
			profiles 
		WHERE gender = 'F'
	);


-- объединим 



SELECT IF (
(
SELECT
	count(1)
FROM
	likes
WHERE
	from_user_id IN (
		SELECT
			user_id
		FROM
			profiles 
		WHERE gender = 'F'
	)) > 
	(SELECT
	count(1)
FROM
	likes
WHERE
	from_user_id IN (
		SELECT
			user_id
		FROM
			profiles 
		WHERE gender = 'M'
	)), 'женщины', 'мужчины'
	);

	

