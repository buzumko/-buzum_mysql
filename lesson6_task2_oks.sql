/* 2. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
 немного невнятные условия задачи, сделала отдельно для лайков на пользователей и лайков на все подряд

*/



USE vk;

SELECT concat_ws(' ', p.first_name, p.last_name) AS user_name, count(1)
FROM profiles p 
LEFT JOIN likes l ON (
	p.id = l.entity_id
	)
WHERE 	
	p.user_id IN (
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
	)
GROUP BY user_name;


