/* 4. ���������� ��� ������ �������� ������ (�����) - ������� ��� �������?

*/


USE vk;

-- �������� ������

SELECT
	user_id
FROM
	profiles 
WHERE gender = 'F';


-- ���������� ������ �� ������
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


-- ��������� 



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
	)), '�������', '�������'
	);

	

