/* 
4. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.
активность: делает посты, пишет сообщения, читает сообщения, ставит лайки, отправляют запросы на дружбу, участвуют в группах
*/


USE vk;

-- считаем количество постов
DESC posts;
SELECT * FROM posts;

SELECT concat_ws(' ', p.first_name, p.last_name) AS user_name, count(1)
FROM profiles p 
LEFT JOIN posts p2 ON (
	p.id = p2.user_id 
	)
GROUP BY user_name;

-- считаем количество исходящих сообщений
DESC messages;

SELECT concat_ws(' ', p.first_name, p.last_name) AS user_name, count(1)
FROM profiles p 
LEFT JOIN messages m ON (
	p.id = m.from_user_id 
	)
GROUP BY user_name;

-- считаем количество входящих прочитанных сообщений
DESC messages;

SELECT concat_ws(' ', p.first_name, p.last_name) AS user_name, count(1)
FROM profiles p 
LEFT JOIN messages m ON (
	p.id = m.to_user_id
	)
WHERE m.is_delivered
GROUP BY user_name;


-- количество лайков от пользователя
DESC likes ;

SELECT concat_ws(' ', p.first_name, p.last_name) AS user_name, count(1)
FROM profiles p 
LEFT JOIN likes l ON (
	p.id = l.from_user_id 
	)
GROUP BY user_name;


-- количество  запросов на дружбу

SELECT concat_ws(' ', p.first_name, p.last_name) AS user_name, count(1)
FROM profiles p 
LEFT JOIN friendship f ON (
	p.id = f.user_id 
	)
GROUP BY user_name;
-- 
-- количество  участия в группах
DESC communities_users;


SELECT concat_ws(' ', p.first_name, p.last_name) AS user_name, count(1)
FROM profiles p 
LEFT JOIN communities_users cu ON (
	p.id = cu.user_id 
	)
GROUP BY user_name;

-- объединим тех, у кого активность самая маленькая
DESC profiles ;

SELECT concat_ws(' ', p.first_name, p.last_name) AS user_name, count(1) AS count_out
FROM profiles p 
LEFT JOIN posts p2 ON (
	p.id = p2.user_id 
	)
LEFT JOIN messages m ON (
	p.id = m.from_user_id OR (p.id = m.to_user_id AND m.is_delivered)
	)
LEFT JOIN likes l ON (
	p.id = l.from_user_id 
	)
LEFT JOIN friendship f ON (
	p.id = f.user_id 
	)
LEFT JOIN communities_users cu ON (
	p.id = cu.user_id
	)
GROUP BY user_name
ORDER BY count_out
LIMIT 10;
