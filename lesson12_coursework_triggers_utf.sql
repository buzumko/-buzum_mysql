-- Здесь содержатся скрипты триггеров, хранимых процедур и функций базы edu_environment


-- Процедуры проверки ошибок 
DROP PROCEDURE prepo_validation;

DELIMITER //
CREATE PROCEDURE prepo_validation(IN id_in INT)
READS SQL DATA
BEGIN
	IF (id_in != 2) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Пользователь должен быть преподавателем';
	END IF;
END //

DELIMITER ;

 
DELIMITER //
CREATE PROCEDURE department_course_validation(IN dep_teach_in INT, IN course_dep_in INT)
READS SQL DATA
BEGIN
	IF (dep_teach_in != course_dep_in) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'На кафедре преподавателя нет такого курса';
	END IF;
END //

DELIMITER ;


-- Триггер: на кафедре может работать только преподаватель

drop trigger ins_teacher_dep;
drop trigger update_courses;

DESC department_teachers ;

DELIMITER //

CREATE TRIGGER ins_teacher_dep BEFORE INSERT ON department_teachers
FOR EACH ROW
BEGIN 
	DECLARE status_user_v INT;
	DECLARE last_user_id_v INT;
	SET last_user_id_v = NEW.teacher_id;
	SELECT user_status_id INTO status_user_v FROM profiles p WHERE p.user_id = last_user_id_v;
	CALL prepo_validation(status_user_v);
	
END
//
DELIMITER ;

DELIMITER //

CREATE TRIGGER upd_teacher_dep BEFORE UPDATE ON department_teachers
FOR EACH ROW
BEGIN 
	DECLARE status_user_v INT;
	DECLARE last_user_id_v INT;
	SET last_user_id_v = NEW.teacher_id;
	SELECT user_status_id INTO status_user_v FROM profiles p WHERE p.user_id = last_user_id_v;
	CALL prepo_validation(status_user_v);

END
//
DELIMITER ;



-- Триггер: курс может вести преподаватель (!), работающий на кафедре

DROP TRIGGER update_courses;

drop trigger ins_courses;
drop trigger update_courses;

DELIMITER //

CREATE TRIGGER ins_courses BEFORE INSERT ON courses
FOR EACH ROW
BEGIN 
	DECLARE status_user_v INT;
	DECLARE last_user_id_v INT;
	DECLARE dep_teach_v INT;
	DECLARE course_dep_v INT;
	SET last_user_id_v = NEW.teacher_user_id;
	SELECT department_id INTO dep_teach_v FROM department_teachers dt WHERE dt.teacher_id = last_user_id_v;  
	SELECT department_id INTO course_dep_v FROM department_courses dc WHERE dc.id = NEW.course_name_id;  
	SELECT user_status_id INTO status_user_v FROM profiles p WHERE p.user_id = last_user_id_v;
	CALL prepo_validation(status_user_v);
	CALL department_course_validation(dep_teach_v, course_dep_v);

END
//
DELIMITER ;

DELIMITER //

CREATE TRIGGER update_courses BEFORE UPDATE ON courses
FOR EACH ROW
BEGIN 
	DECLARE status_user_v INT;
	DECLARE last_user_id_v INT;
	DECLARE dep_teach_v INT;
	DECLARE course_dep_v INT;
	SET last_user_id_v = NEW.teacher_user_id;
	SELECT department_id INTO dep_teach_v FROM department_teachers dt WHERE dt.teacher_id = last_user_id_v;  
	SELECT department_id INTO course_dep_v FROM department_courses dc WHERE dc.id = NEW.course_name_id;  
	SELECT user_status_id INTO status_user_v FROM profiles p WHERE p.user_id = last_user_id_v;
	CALL prepo_validation(status_user_v);
	CALL department_course_validation(dep_teach_v, course_dep_v);

END
//
DELIMITER ;

-- Триггер на заполнение таблицы логов для выполнения задания


DROP TRIGGER task_complete_ins;

DELIMITER //

CREATE TRIGGER task_complete_ins AFTER INSERT ON task_complete
FOR EACH ROW
BEGIN 
	DECLARE status_complete_id_v INT;
	DECLARE last_user_id_v INT;
	DECLARE score_v INT;
	SELECT user_id INTO last_user_id_v FROM task_complete ORDER BY id DESC LIMIT 1;
	SELECT status_complete_id INTO status_complete_id_v FROM task_complete ORDER BY id DESC LIMIT 1;
    SELECT score INTO score_v FROM task_complete ORDER BY id DESC LIMIT 1;
	INSERT INTO logs_tk (last_user_id, status_complete_id, score) VALUES
  (last_user_id_v, status_complete_id_v, score_v);

END
//

DELIMITER ;

DROP TRIGGER task_complete_upd;

DELIMITER //

CREATE TRIGGER task_complete_upd AFTER UPDATE ON task_complete
FOR EACH ROW
BEGIN 
	DECLARE status_complete_id_v INT;
	DECLARE last_user_id_v INT;
	DECLARE score_v INT;
	SELECT user_id INTO last_user_id_v FROM task_complete ORDER BY id DESC LIMIT 1;
	SELECT status_complete_id INTO status_complete_id_v FROM task_complete ORDER BY id DESC LIMIT 1;
    SELECT score INTO score_v FROM task_complete ORDER BY id DESC LIMIT 1;
	INSERT INTO logs_tk (last_user_id, status_complete_id, score) VALUES
  (last_user_id_v, status_complete_id_v, score_v);

END
//

DELIMITER ;

show triggers;

-- Функция.	Создаем хранимую функцию hello(), которая будет возвращать приветствие в зависимости от текущего времени суток. 
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", 
-- с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
-- с 18:00 до 00:00 — "Добрый вечер", 
-- с 00:00 до 6:00 — "Доброй ночи".

DROP FUNCTION hello;

DELIMITER //

CREATE FUNCTION hello(data_in DATETIME)
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
	DECLARE time_in INT;
	SET time_in = date_format(data_in,"%H"); 
	CASE 
		WHEN time_in BETWEEN 0 AND 5 THEN RETURN 'Доброй ночи';
		WHEN time_in BETWEEN 6 AND 11 THEN RETURN 'Доброе утро';
		WHEN time_in BETWEEN 12 AND 17 THEN RETURN 'Добрый день';
		WHEN time_in BETWEEN 18 AND 23 THEN RETURN 'Добрый вечер';
	END CASE;

END //

DELIMITER ;

select hello(NOW());