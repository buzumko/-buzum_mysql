/* 2. ѕусть задан некоторый пользователь. 
»з всех друзей этого пользовател€ найдите человека, который больше всех общалс€ с нашим пользователем.
*/

-- SET FOREIGN_KEY_CHECKS = 0;
-- SET FOREIGN_KEY_CHECKS = 1;

USE vk;

	

-- этот вариант самый примитивный и мне не нравитс€, потом перепишу
SELECT
	(
	-- найдем в таблице профилей полное им€ пользовател€, отправившего сообщение
	SELECT
		concat_ws(' ', first_name, last_name)
	FROM
		profiles p
	WHERE
		p.user_id = m.from_user_id
		-- коррелированный подзапрос
) AS from_user_name,
	COUNT(1) AS counter
FROM
	messages m
WHERE
	-- выбираем непрочитанные сообщени€ пользователю 1
 m.to_user_id = 1
	AND m.from_user_id IN (
	-- все друзь€ 1
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
		AND confirmed_at IS NOT NULL )
ORDER BY 2 DESC
LIMIT 1;
	

	