/*
1. ����� � ������� users ���� created_at � updated_at ��������� ��������������. 
��������� �� �������� ����� � ��������.
*/

USE shop;

UPDATE users 
SET created_at = NOW(),
    updated_at = NOW()
 WHERE id > 0;

SELECT * FROM users;

/*
2. ������� users ���� �������� ��������������. ������ created_at � updated_at ���� ������ ����� VARCHAR 
� � ��� ������ ����� ���������� �������� � ������� 20.10.2017 8:10. ���������� ������������� ���� � ���� DATETIME, 
�������� �������� ����� ��������.
*/


ALTER TABLE users MODIFY created_at DATETIME;
ALTER TABLE users MODIFY updated_at DATETIME;

DESCRIBE users;
SELECT * FROM users;

/*
3. � ������� ��������� ������� storehouses_products � ���� value ����� ����������� ����� ������ �����: 
0, ���� ����� ���������� � ���� ����, ���� �� ������ ������� ������. 
���������� ������������� ������ ����� �������, ����� ��� ���������� � ������� ���������� �������� value. 
������ ������� ������ ������ ���������� � �����, ����� ���� �������.
*/

INSERT INTO storehouses_products
  (value,  created_at,  updated_at)
VALUES
  (0, NOW(), NOW()),
  (2500, NOW(), NOW()),
  (0, NOW(), NOW()),
  (1, NOW(), NOW()),
  (30, NOW(), NOW()),
  (500, NOW(), NOW());


SELECT * FROM storehouses_products
  ORDER BY 
   CASE 
       WHEN value != 0 THEN value 
       ELSE 2147483647 
   END;

 SELECT value FROM storehouses_products
  ORDER BY 
   CASE 
       WHEN value != 0 THEN value 
       ELSE 2147483647 
   END;

--   5. (�� �������) �� ������� catalogs ����������� ������ ��� ������ �������. 
-- SELECT * FROM catalogs WHERE id IN (5, 1, 2); ������������ ������ � �������, �������� � ������ IN.

   SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY FIELD(id, 5, 1, 2) ASC,
    id ASC;
