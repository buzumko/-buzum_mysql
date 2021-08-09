-- Здесь содержатся скрипты на создание трех таблиц-представлений базы edu_environment


-- Представление 1.	Создайте представление, которое выводит ФИО преподавателя из таблицы profiles 
-- и соответствующее название кафедры из таблицы departments.
DROP VIEW teachers; 
CREATE VIEW teachers AS
SELECT
	(
	SELECT
		concat_ws(' ', first_name, patronymic, last_name)
	FROM
		profiles p
	WHERE
		p.user_id = dt.teacher_id ) AS teacher_name,
	(
	SELECT
		u.email
	FROM
		users u
	WHERE
		u.id = dt.teacher_id ) AS teacher_email,
	(
	SELECT
		tp.name
	FROM
		teacher_positions tp
	WHERE
		tp.id = dt.teacher_position ) AS teacher_position,
	(
	SELECT
		d.name
	FROM
		departments d
	WHERE
		d.id = dt.department_id ) AS department_name
FROM
	department_teachers dt
ORDER BY
	dt.department_id;
	
SELECT * FROM teachers;

-- Представление 2. студенты + email, курсы, на которые они записаны, а также их преподаватели с email 

DROP VIEW courses_students; 
CREATE VIEW courses_students AS
SELECT
	(
	SELECT
		concat_ws(' ', first_name, patronymic, last_name)
	FROM
		profiles p
	WHERE
		p.user_id = cs.student_id ) AS student_name,
	(
	SELECT
		u.email
	FROM
		users u
	WHERE
		u.id = cs.student_id ) AS student_email,
	(
	SELECT
		(
		SELECT
			dc.name
		FROM
			department_courses dc
		WHERE
			dc.id = c.course_name_id)
	FROM
		courses c
	WHERE
		c.id = cs.course_id ) AS course_name,
	(
	SELECT
		concat_ws(' ', first_name, patronymic, last_name)
	FROM
		profiles p
	WHERE
		p.user_id IN 
		(
		SELECT
			c2.teacher_user_id
		FROM
			courses c2
		WHERE
			c2.id = cs.course_id) ) AS prepo_name,
		(
	SELECT
		u2.email 
	FROM
		users u2 
	WHERE
		u2.id IN 
		(
		SELECT
			c2.teacher_user_id
		FROM
			courses c2
		WHERE
			c2.id = cs.course_id) ) AS prepo_email
FROM
	course_students cs
ORDER BY
	cs.student_id;
	
SELECT * FROM courses_students;

-- Представление 3. Курсы и вопросы из банка вопросов по ним
DROP VIEW courses_questions; 
CREATE VIEW courses_questions AS
SELECT
	(
	SELECT
		dc.name
	FROM
		department_courses dc
	WHERE
		dc.id = c.course_name_id) AS course_name,
	bq.question
FROM
	courses c
INNER JOIN bank_questions bq ON
	(c.id = bq.course_id)
ORDER BY
	course_name;
SELECT * FROM courses_questions;
