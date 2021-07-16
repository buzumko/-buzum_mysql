/* 2. ����� ����� ��������� ������������. 
�� ���� ������ ����� ������������ ������� ��������, ������� ������ ���� ������� � ����� �������������.
*/

-- SET FOREIGN_KEY_CHECKS = 0;
-- SET FOREIGN_KEY_CHECKS = 1;

USE vk;

	

-- ���� ������� ����� ����������� � ��� �� ��������, ����� ��������
SELECT
	(
	-- ������ � ������� �������� ������ ��� ������������, ������������ ���������
	SELECT
		concat_ws(' ', first_name, last_name)
	FROM
		profiles p
	WHERE
		p.user_id = m.from_user_id
		-- ��������������� ���������
) AS from_user_name,
	COUNT(1) AS counter
FROM
	messages m
WHERE
	-- �������� ������������� ��������� ������������ 1
 m.to_user_id = 1
	AND m.from_user_id IN (
	-- ��� ������ 1
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
	

	