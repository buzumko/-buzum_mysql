-- Здесь содержатся скрипты характерных выборок из таблиц базы edu_environment (10 штук)

-- 1. Выбираем преподавателя, его кафедру


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
		d.name
	FROM
		departments d
	WHERE
		d.id = dt.department_id ) AS department_name
FROM
	department_teachers dt
ORDER BY
	dt.department_id;

-- 2. Выбираем преподавателя, его курсы

SELECT
	(
	SELECT
		concat_ws(' ', first_name, patronymic, last_name)
	FROM
		profiles p
	WHERE
		p.user_id = c.teacher_user_id) AS teacher_name,
	(
	SELECT
		dc.name
	FROM
		department_courses dc
	WHERE
		dc.id = c.course_name_id) AS course_name,
	(
	SELECT
		d.name
	FROM
		departments d
	WHERE
		d.id IN (
		SELECT
			dc.department_id
		FROM
			department_courses dc
		WHERE
			dc.id = c.course_name_id)) AS course_depart
FROM
	courses c ;


-- 3. Составить список студентов, сдавших хотя бы одно задание   


WITH student_task AS (
SELECT
	concat_ws(' ', first_name, patronymic, last_name) AS student_name,
	count(1)
FROM
	profiles p
INNER JOIN task_complete tc ON
	( (p.user_id = tc.user_id)
		AND(tc.status_complete_id = 2
			OR tc.status_complete_id = 4) )
GROUP BY
	student_name)
SELECT
	student_name
FROM
	student_task;

-- 4. Составить список студентов, не сдавших ни одного задания   
SELECT
	concat_ws(' ', first_name, patronymic, last_name) AS student_name
FROM
	profiles p
WHERE
	((p.user_status_id = 1)
		AND (p.user_id NOT IN ((WITH student_task AS (
		SELECT
			p.user_id AS student_name,
			count(1)
		FROM
			profiles p
		INNER JOIN task_complete tc ON
			( (p.user_id = tc.user_id)
				AND(tc.status_complete_id = 2
					OR tc.status_complete_id = 4) )
		GROUP BY
			student_name)
		SELECT
			student_name
		FROM
			student_task
))));

-- 5. Считаем количество занятий на курсе  
 SELECT
	(
	SELECT
		name
	FROM
		department_courses dc
	WHERE
		dc.id = c.course_name_id),
	count(1) AS count_lessons
FROM
	courses c
INNER JOIN lessons l ON
	(c.id = l.course_id)
GROUP BY
	c.id
ORDER BY
	count_lessons DESC ;

SELECT
	*
FROM
	courses_questions;


-- 6. Задания; время дедлайна; темы занятий, по которым они заданы; студенты и их email, взявшие задания на выполнения; статус выполнения
 SELECT
	(
	SELECT
		title
	FROM
		lesson_tasks lt
	WHERE
		lt.id = tc.task_id) AS task,
	(
	SELECT
		dedline_at
	FROM
		lesson_tasks lt
	WHERE
		lt.id = tc.task_id) AS dedline,
	(
	SELECT
		l.title
	FROM
		lessons l
	WHERE
		l.id IN
		(SELECT
			lt.lesson_id
		FROM
			lesson_tasks lt
		WHERE
			lt.id = tc.task_id)) AS lesson,
	(
	SELECT
		concat_ws(' ', first_name, patronymic, last_name)
	FROM
		profiles p
	WHERE
		p.user_id = tc.user_id) AS student_name,
	(
	SELECT
		u.email
	FROM
		users u
	WHERE
		u.id = tc.user_id) AS student_email,
	(
	SELECT
		sc.name
	FROM
		status_complete sc
	WHERE
		sc.id = tc.status_complete_id) AS status
FROM
	task_complete tc
ORDER BY
	task;

-- 7. Преподаватели, у которых есть непроверенные задания

-- количество непроверенных заданий занятия
SELECT
	lt.title,
	count(1) AS count_not_score
FROM
	lesson_tasks lt 
INNER JOIN task_complete tc ON
	(tc.task_id = lt.id)
WHERE (tc.status_complete_id = 2)
GROUP BY
	lt.title 
ORDER BY
	count_not_score DESC ;


SELECT
	(
	SELECT
		concat_ws(' ', first_name, patronymic, last_name)
	FROM
		profiles p
	WHERE
		p.user_id IN (
		SELECT
			c.teacher_user_id
		FROM
			courses c
		WHERE
			c.id IN (
			SELECT
				l.course_id
			FROM
				lessons l
			WHERE
				l.id = lt.lesson_id))) AS teacher_name,
		count(1) AS count_not_score
	FROM
		lesson_tasks lt
	INNER JOIN task_complete tc ON
		(tc.task_id = lt.id)
	WHERE
		(tc.status_complete_id = 2)
	GROUP BY
		lt.title
	ORDER BY
		count_not_score DESC;
	
-- 8. Занятие 1 (проверила по 2 и 3 тоже) - количество выполненных, невыполненных, непроверенных заданий и черновиков

SELECT
	lt.title,
(SELECT
	count(1)
FROM
	task_complete tc WHERE (tc.task_id = lt.id AND tc.status_complete_id = 2)) AS count_not_score,
(SELECT
	count(1)
FROM
	task_complete tc WHERE (tc.task_id = lt.id AND tc.status_complete_id = 1)) AS count_not_done,
(SELECT
	count(1)
FROM
	task_complete tc WHERE (tc.task_id = lt.id AND tc.status_complete_id = 3)) AS count_drafts,
(SELECT
	count(1)
FROM
	task_complete tc WHERE (tc.task_id = lt.id AND tc.status_complete_id = 4)) AS count_score
FROM lesson_tasks lt
WHERE lt.id = 3
GROUP BY
	lt.title;

-- 9. Админы, у которых есть непрочитанные сообщения, и количесто сообщений

SELECT
	concat_ws(' ', first_name, patronymic, last_name) AS admin_name ,
	count(1) count_messages 
FROM
	profiles p
INNER JOIN messages m ON
	(p.user_id = m.to_user_id AND m.is_delivered = 0)
WHERE
	(p.user_status_id = 3)
GROUP BY
	 admin_name
ORDER BY
	count_messages DESC;


-- 10. Самый активный студент - активность значит самое большое количество отправленных работ и сообщений

-- считаем количество выполненных заданий
SELECT
	concat_ws(' ', p.first_name, p.last_name) AS student_name,
	count(1)
FROM
	profiles p
LEFT JOIN task_complete tc ON
	( p.id = tc.user_id
		AND (tc.status_complete_id = 2
			OR tc.status_complete_id = 4) )
GROUP BY
	student_name;
-- считаем количество сообщений
 SELECT
	concat_ws(' ', p.first_name, p.last_name) AS student_name,
	count(1)
FROM
	profiles p
LEFT JOIN messages m ON
	( p.id = m.from_user_id
		AND p.user_status_id = 1 )
GROUP BY
	student_name;
-- объединим
 SELECT
	concat_ws(' ', p.first_name, p.last_name) AS student_name,
	((
	SELECT
		count(1)
	FROM
		messages m
	WHERE
		( p.id = m.from_user_id
			AND p.user_status_id = 1 )) + (
	SELECT
		count(1)
	FROM
		task_complete tc
	WHERE
		( p.id = tc.user_id
			AND (tc.status_complete_id = 2
				OR tc.status_complete_id = 4) )) ) AS count_out
FROM
	profiles p
GROUP BY
	student_name
ORDER BY
count_out DESC
LIMIT 1;