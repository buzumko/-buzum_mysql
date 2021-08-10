-- Здесь содержится оконная функция

-- Построить запрос, который будет выводить следующие столбцы:
-- название кафедры;
-- общее количество преподавателей  на кафедру;
-- всего преподавателей в системе;
-- отношение в процентах (количество преподавателей на кафедре / всего преподавателей) * 100.

SELECT
	DISTINCT ROW_NUMBER() OVER () AS total_rn,
	d.name AS department_name,
	count(u.id) OVER () AS all_teacher_depart,
	count(u.id) OVER (PARTITION BY dt.department_id) AS teacher_depart,
	floor(count(u.id) OVER (PARTITION BY dt.department_id) * 100 / count(u.id) OVER ()) AS percent_teacher_depart
FROM
	department_teachers dt
INNER JOIN departments d
LEFT JOIN users u ON
	(d.id = dt.department_id )
WHERE
	(u.id = dt.teacher_id) ;

