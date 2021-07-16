/* 
5. ����� 10 �������������, ������� ��������� ���������� ���������� � ������������� ���������� ����.
����������: ������ �����, ����� ���������, ������ ���������, ������ �����, ���������� ������� �� ������, ��������� � �������
*/


USE vk;

-- ������� ���������� ������
DESC posts;
SELECT * FROM posts;

SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = posts.user_id
	) AS to_user_name,
	count(1) AS count_posts 
FROM 
	posts
GROUP BY to_user_name
ORDER BY count_posts;

-- ������� ���������� ��������� ���������
DESC messages;

SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = messages.from_user_id
	) AS to_user_name,
	count(1) AS count_out_mess 
FROM 
	messages
GROUP BY to_user_name
ORDER BY count_out_mess;

-- ������� ���������� �������� ����������� ���������
DESC messages;

SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = messages.to_user_id
	) AS to_user_name,
	count(1) AS count_out_mess 
FROM 
	messages
WHERE is_delivered
GROUP BY to_user_name
ORDER BY count_out_mess;


-- ���������� ������ �� ������������
DESC likes ;
SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = likes.from_user_id
	) AS to_user_name,
	count(1) AS count_out_likes 
FROM 
	likes
GROUP BY to_user_name
ORDER BY to_user_name;


-- ����������  �������� �� ������
DESC friendship;
SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = friendship.user_id
	) AS to_user_name,
	count(1) AS count_out 
FROM 
	friendship
GROUP BY to_user_name
ORDER BY to_user_name;
-- 
-- ����������  ������� � �������
DESC communities_users;
SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = communities_users.user_id
	) AS to_user_name,
	count(1) AS count_out 
FROM 
	communities_users
GROUP BY to_user_name
ORDER BY to_user_name;


-- ��������� ���, � ���� ���� ����������
DESC profiles ;
SELECT first_name, last_name FROM profiles WHERE first_name = 'Jamison';

SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = posts.user_id
	) AS to_user_name,
	count(1) AS count_out 
FROM 
	posts
UNION 
SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = messages.from_user_id
	) AS to_user_name,
	count(1) AS count_out 
FROM 
	messages
UNION
SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = messages.to_user_id
	) AS to_user_name,
	count(1) AS count_out
FROM 
	messages
WHERE is_delivered
UNION 
SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = likes.from_user_id
	) AS to_user_name,
	count(1) AS count_out 
FROM 
	likes
UNION 
SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = friendship.user_id
	) AS to_user_name,
	count(1) AS count_out 
FROM 
	friendship
UNION
SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = communities_users.user_id
	) AS to_user_name,
	count(1) AS count_out 
FROM 
	communities_users	
GROUP BY to_user_name
ORDER BY count_out;

-- ������� ���, � ���� ��� ����������
DESC profiles ;
SELECT first_name, last_name FROM profiles WHERE first_name = 'Jamison';

SELECT 
concat_ws(' ', first_name, last_name) AS to_user_name,
count(0) - 1 AS count_out
FROM profiles prof
WHERE 
concat_ws(' ', first_name, last_name) NOT IN
(WITH actives AS 
(SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = posts.user_id
	) AS to_user_name,
	count(1) AS count_out 
FROM 
	posts
UNION 
SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = messages.from_user_id
	) AS to_user_name,
	count(1) AS count_out 
FROM 
	messages
UNION
SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = messages.to_user_id
	) AS to_user_name,
	count(1) AS count_out
FROM 
	messages
WHERE is_delivered
UNION 
SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = likes.from_user_id
	) AS to_user_name,
	count(1) AS count_out 
FROM 
	likes
UNION 
SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = friendship.user_id
	) AS to_user_name,
	count(1) AS count_out 
FROM 
	friendship
UNION
SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = communities_users.user_id
	) AS to_user_name,
	count(1) AS count_out 
FROM 
	communities_users	
GROUP BY to_user_name)
SELECT
to_user_name
FROM actives)
GROUP BY to_user_name;

-- ����� ����������


SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = posts.user_id
	) AS to_user_name,
	count(1) AS count_out 
FROM 
	posts
UNION 
SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = messages.from_user_id
	) AS to_user_name,
	count(1) AS count_out 
FROM 
	messages
UNION
SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = messages.to_user_id
	) AS to_user_name,
	count(1) AS count_out
FROM 
	messages
WHERE is_delivered
UNION 
SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = likes.from_user_id
	) AS to_user_name,
	count(1) AS count_out 
FROM 
	likes
UNION 
SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = friendship.user_id
	) AS to_user_name,
	count(1) AS count_out 
FROM 
	friendship
UNION
SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = communities_users.user_id
	) AS to_user_name,
	count(1) AS count_out 
FROM 
	communities_users
UNION 	
SELECT 
concat_ws(' ', first_name, last_name) AS to_user_name,
count(0) - 1 AS count_out
FROM profiles prof
WHERE 
concat_ws(' ', first_name, last_name) NOT IN
(WITH actives AS 
(SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = posts.user_id
	) AS to_user_name,
	count(1) AS count_out 
FROM 
	posts
UNION 
SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = messages.from_user_id
	) AS to_user_name,
	count(1) AS count_out 
FROM 
	messages
UNION
SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = messages.to_user_id
	) AS to_user_name,
	count(1) AS count_out
FROM 
	messages
WHERE is_delivered
UNION 
SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = likes.from_user_id
	) AS to_user_name,
	count(1) AS count_out 
FROM 
	likes
UNION 
SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = friendship.user_id
	) AS to_user_name,
	count(1) AS count_out 
FROM 
	friendship
UNION
SELECT
	(
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles prof
		WHERE prof.user_id = communities_users.user_id
	) AS to_user_name,
	count(1) AS count_out 
FROM 
	communities_users	
GROUP BY to_user_name)
SELECT
to_user_name
FROM actives)	
GROUP BY to_user_name
ORDER BY count_out
LIMIT 10;
