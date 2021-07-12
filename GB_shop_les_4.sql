/*
1. ����������� ������� ������� ������������� � ������� users.
*/

USE shop;

SELECT
AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS avg
FROM
  users;


/*
2. ����������� ���������� ���� ��������, ������� ���������� �� ������ �� ���� ������. 
������� ������, ��� ���������� ��� ������ �������� ����, � �� ���� ��������.
*/


SELECT
  COUNT(*),
  WEEKDAY( DATE_ADD(birthday_at, INTERVAL (YEAR(NOW()) - YEAR (birthday_at))  YEAR )) AS week_day
FROM
  users
GROUP BY
  week_day
ORDER BY
  week_day;