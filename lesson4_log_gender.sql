USE vk;

SELECT * FROM vk.profiles LIMIT 10;
-- ALTER TABLE profiles DROP COLUMN gender;
ALTER TABLE profiles ADD COLUMN gender ENUM('M', 'F');


-- Варианты заполнения атрибута 'gender'


SELECT 
	CASE
		WHEN RAND() > 0.5 THEN 'M'
        ELSE 'F'
	END gender;
   
-- 1
UPDATE profiles SET gender = (
SELECT CASE WHEN RAND() > 0.5 THEN 'M' ELSE 'F' END 
);

-- 2
CREATE TEMPORARY TABLE temp_gender (
	`value` CHAR(1)
);

INSERT INTO temp_gender (`value`) VALUE ('M');
INSERT INTO temp_gender (`value`) VALUE ('F');
SELECT * FROM temp_gender;

SELECT `value` FROM temp_gender ORDER BY RAND() LIMIT 1;