-- Здесь содержатся скрипты на создание таблиц базы edu_environment


DROP DATABASE IF EXISTS edu_environment;
CREATE DATABASE edu_environment;

USE edu_environment;

DROP TABLE IF EXISTS users;
-- Создаем таблицу пользователей
CREATE TABLE users (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
	email VARCHAR(100) NOT NULL UNIQUE COMMENT "Почта",
    nick VARCHAR(100) NOT NULL UNIQUE COMMENT "Имя пользователя",
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Таблица пользователей";

DROP TABLE IF EXISTS profiles;
-- Создаем таблицу профилей пользователей
CREATE TABLE profiles (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
    user_id INT UNSIGNED UNIQUE NOT NULL COMMENT "Ссылка на пользователя", 
	first_name VARCHAR(100) NOT NULL COMMENT "Имя пользователя",
	patronymic VARCHAR(100) COMMENT "Отчество пользователя",
	last_name VARCHAR(100) NOT NULL COMMENT "Фамилия пользователя",
    user_status_id INT UNSIGNED NOT NULL COMMENT "Текущий статус",
    about_user TEXT COMMENT "Информация о пользователе",
    user_foto VARCHAR(1000) COMMENT "Ссылка на фотограрифию пользователя",
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT "Таблица профилей пользователей";

-- Связываем поле "user_id" таблицы "profiles" с полем "id" таблицы "users" c помощью внешнего ключа
ALTER TABLE profiles ADD CONSTRAINT fk_profiles_user_id FOREIGN KEY (user_id) REFERENCES users(id);


DROP TABLE IF EXISTS user_status;
-- Создаем таблицу статуса пользователя
CREATE TABLE user_status (
	id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY COMMENT "Идентификатор строки",
	user_status_name varchar(100) NOT NULL
);

-- Связываем поле "user_id" таблицы "profiles" с полем "id" таблицы "users" c помощью внешнего ключа
ALTER TABLE profiles ADD CONSTRAINT fk_profiles_user_status_id FOREIGN KEY (user_status_id) REFERENCES user_status(id);

DROP TABLE IF EXISTS messages;
-- Создаем таблицу сообщений
CREATE TABLE messages (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
	from_user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на отправителя сообщения",
	to_user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на получателя сообщения",
    message_text TEXT NOT NULL COMMENT "Текст сообщения",
    is_delivered BOOLEAN NOT NULL DEFAULT TRUE COMMENT "Признак доставки",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Таблица сообщений пользователей";

-- Связываем поля from_user_id, to_user_id таблицы "messages" с полем "id" таблицы "users" c помощью внешнего ключа
ALTER TABLE messages ADD CONSTRAINT fk_messages_from_user_id FOREIGN KEY (from_user_id) REFERENCES users(id);
ALTER TABLE messages ADD CONSTRAINT fk_messages_to_user_id FOREIGN KEY (to_user_id) REFERENCES users(id);


DROP TABLE IF EXISTS lessons;
-- Создаем таблицу занятий
CREATE TABLE lessons (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
	course_id INT UNSIGNED NOT NULL COMMENT "Ссылка на курс",
	title VARCHAR(1000) NOT NULL COMMENT "Название",
	description TEXT COMMENT "Описание",
	is_visibility BOOLEAN NOT NULL DEFAULT TRUE COMMENT "Признак видимости",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Занятия";

DROP TABLE IF EXISTS courses;
-- Создаем таблицу курсы
CREATE TABLE courses (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
	course_name_id INT UNSIGNED NOT NULL COMMENT "Ссылка на название курса и через него на кафедру",
	teacher_user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на преподавателя",
	title VARCHAR(1000) NOT NULL COMMENT "Название",
	description TEXT COMMENT "Описание",
	is_visibility BOOLEAN NOT NULL DEFAULT TRUE COMMENT "Признак видимости",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Курсы";

DROP TABLE IF EXISTS lesson_tasks;
-- Создаем таблицу заданий для занятий
CREATE TABLE lesson_tasks (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
	lesson_id INT UNSIGNED NOT NULL COMMENT "Ссылка на занятие",
	title VARCHAR(1000) NOT NULL COMMENT "Название",
	description TEXT COMMENT "Описание",
	is_visibility BOOLEAN NOT NULL DEFAULT TRUE COMMENT "Признак видимости",
	task_type_id INT UNSIGNED NOT NULL COMMENT "Ссылка на тип контента",
	dedline_at DATETIME NOT NULL COMMENT "Время сдачи работы",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Задания";

-- Связываем поле lesson_id таблицы "lesson_tasks" с полем id таблицы "lessons" c помощью внешнего ключа
ALTER TABLE lesson_tasks ADD CONSTRAINT fk_lesson_tasks_lesson_id FOREIGN KEY (lesson_id) REFERENCES lessons(id);
ALTER TABLE lessons ADD CONSTRAINT fk_lessons_course_id FOREIGN KEY (course_id) REFERENCES courses(id);
-- Связываем поле "user_id" таблицы "courses" с полем "id" таблицы "users" c помощью внешнего ключа
ALTER TABLE courses ADD CONSTRAINT fk_courses_teacher_user_id FOREIGN KEY (teacher_user_id) REFERENCES users(id);

DROP TABLE IF EXISTS task_types;
-- Создаем таблицу типа задания
CREATE TABLE task_types (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
	`name` VARCHAR(100) NOT NULL COMMENT "Тип задания"
) COMMENT "Тип задания";

-- Связываем поле media_type_id таблицы "lesson_tasks" с полем id таблицы "task_types" c помощью внешнего ключа
ALTER TABLE lesson_tasks ADD CONSTRAINT fk_lesson_tasks_task_type_id FOREIGN KEY (task_type_id) REFERENCES task_types(id);

DROP TABLE IF EXISTS departments;
-- Таблица кафедры
CREATE TABLE departments (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор сроки",
  name VARCHAR(150) NOT NULL UNIQUE COMMENT "Название кафедры",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Кафедры";

DROP TABLE IF EXISTS department_courses;
-- Таблица связи кафедр и курсов
CREATE TABLE department_courses (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор сроки",
  department_id INT UNSIGNED NOT NULL COMMENT "Ссылка на кафедру",
  name VARCHAR(150) NOT NULL UNIQUE COMMENT "Название курса",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки"
) COMMENT "Курсы кафедры, связь кафедр и курсов";

ALTER TABLE department_courses ADD CONSTRAINT fk_dc_department_id FOREIGN KEY (department_id) REFERENCES departments(id);
ALTER TABLE courses ADD CONSTRAINT fk_courses_course_id FOREIGN KEY (course_name_id) REFERENCES department_courses(id);

DROP TABLE IF EXISTS department_teachers;
-- Таблица связи кафедр и преподавателей
CREATE TABLE department_teachers (
  department_id INT UNSIGNED NOT NULL UNIQUE COMMENT "Ссылка на кафедру",
  teacher_id INT UNSIGNED NOT NULL COMMENT "Ссылка на преподавателя",
  teacher_position INT UNSIGNED NOT NULL COMMENT "Ссылка на должность преподавателя",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
  PRIMARY KEY ( department_id, teacher_id) COMMENT "Составной первичный ключ"
) COMMENT "связь кафедр и преподавателей";

ALTER TABLE department_teachers ADD CONSTRAINT fk_dt_department_id FOREIGN KEY (department_id) REFERENCES departments(id);
ALTER TABLE department_teachers ADD CONSTRAINT fk_dt_teacher_id FOREIGN KEY (teacher_id) REFERENCES users(id);

DROP TABLE IF EXISTS teacher_positions;
-- Создаем таблицу должностей
CREATE TABLE teacher_positions (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
	`name` VARCHAR(100) NOT NULL COMMENT "Тип медиафайла"
) COMMENT "Тип должности";

ALTER TABLE department_teachers ADD CONSTRAINT fk_dt_teacher_position FOREIGN KEY (teacher_position) REFERENCES teacher_positions(id);

DROP TABLE IF EXISTS bank_questions;
-- Таблица банка вопросов
CREATE TABLE bank_questions (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор сроки",
  course_id INT UNSIGNED NOT NULL COMMENT "Ссылка на курс",
  question TEXT NOT NULL COMMENT "Текст вопроса",
  answer JSON DEFAULT NULL COMMENT "Текст ответов",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Создаем банк вопросов, связанных с курсом";

ALTER TABLE bank_questions ADD CONSTRAINT fk_bq_course_id FOREIGN KEY (course_id) REFERENCES courses(id);


DROP TABLE IF EXISTS course_students;
-- Таблица связи студентов и курсов
CREATE TABLE course_students (
  course_id INT UNSIGNED NOT NULL COMMENT "Ссылка на курс",
  student_id INT UNSIGNED NOT NULL COMMENT "Ссылка на студента",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
  PRIMARY KEY (course_id, student_id) COMMENT "Составной первичный ключ"
) COMMENT "Студенты курса, связь студентов и курсов";

ALTER TABLE course_students ADD CONSTRAINT fk_cs_student_id FOREIGN KEY (student_id) REFERENCES users(id);
ALTER TABLE course_students ADD CONSTRAINT fk_cs_course_id FOREIGN KEY (course_id) REFERENCES courses(id);

DROP TABLE IF EXISTS media;
-- Создаем таблицу приложений к занятиям, курсам, заданиям
CREATE TABLE media (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
	media_type_id INT UNSIGNED NOT NULL COMMENT "Ссылка на тип контента",
	link VARCHAR(1000) NOT NULL COMMENT "Ссылка на файл",
	metadata JSON DEFAULT NULL,
	is_visibility BOOLEAN NOT NULL COMMENT "Признак видимости",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Приложения";

desc media;
desc media_types;

DROP TABLE IF EXISTS media_types;
-- Создаем таблицу типа приложений к занятиям, курсам, заданиям
CREATE TABLE media_types (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
	`name` VARCHAR(100) NOT NULL COMMENT "Тип медиафайла"
) COMMENT "Тип контента";

-- Связываем поле media_type_id таблицы "media" с полем id таблицы "media_types" c помощью внешнего ключа
ALTER TABLE media ADD CONSTRAINT fk_media_media_type_id FOREIGN KEY (media_type_id) REFERENCES media_types(id);

DROP TABLE IF EXISTS task_media;
-- Создаем таблицу приложений к заданиям
CREATE TABLE task_media (
	task_id INT UNSIGNED NOT NULL COMMENT "Ссылка на идентификатор задания",
	media_id INT UNSIGNED NOT NULL COMMENT "Ссылка на идентификатор медиа",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
 	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
	PRIMARY KEY (task_id, media_id)
) COMMENT "Связь заданий и медиа";

ALTER TABLE task_media ADD CONSTRAINT fk_pm_media_id FOREIGN KEY (media_id) REFERENCES media(id);
ALTER TABLE task_media ADD CONSTRAINT fk_pm_task_id FOREIGN KEY (task_id) REFERENCES lesson_tasks(id);

DROP TABLE IF EXISTS lesson_media;
-- Создаем таблицу приложений к занятиям
CREATE TABLE lesson_media (
	lesson_id INT UNSIGNED NOT NULL COMMENT "Ссылка на идентификатор занятия",
	l_media_id INT UNSIGNED NOT NULL COMMENT "Ссылка на идентификатор медиа",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
	PRIMARY KEY (lesson_id, l_media_id)
) COMMENT "Связь занятий и медиа";

ALTER TABLE lesson_media ADD CONSTRAINT fk_pm_l_media_id FOREIGN KEY (l_media_id) REFERENCES media(id);
ALTER TABLE lesson_media ADD CONSTRAINT fk_pm_lesson_id FOREIGN KEY (lesson_id) REFERENCES lessons(id);

DROP TABLE IF EXISTS course_media;
-- Создаем таблицу типа приложений к курсам
CREATE TABLE course_media (
	course_id INT UNSIGNED NOT NULL COMMENT "Ссылка на идентификатор курса",
	c_media_id INT UNSIGNED NOT NULL COMMENT "Ссылка на идентификатор медиа",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
	PRIMARY KEY (course_id, c_media_id)
) COMMENT "Связь курсов и медиа";

ALTER TABLE course_media ADD CONSTRAINT fk_pm_c_media_id FOREIGN KEY (c_media_id) REFERENCES media(id);
ALTER TABLE course_media ADD CONSTRAINT fk_pm_course_id FOREIGN KEY (course_id) REFERENCES courses(id);

DROP TABLE IF EXISTS task_complete;
-- Таблица выполнения задания
CREATE TABLE task_complete (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
	task_id INT UNSIGNED NOT NULL COMMENT "Ссылка на задание",
	user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на студента",
	status_complete_id INT UNSIGNED NOT NULL COMMENT "Ссылка на словарь выполнения",
	link_answer VARCHAR(1000) DEFAULT NULL COMMENT "Ссылка на файл ответа студента",
	score INT DEFAULT NULL COMMENT "Оценка",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "выполнение заданий студентами";

ALTER TABLE task_complete ADD CONSTRAINT fk_tc_task_id FOREIGN KEY (task_id) REFERENCES lesson_tasks(id);
ALTER TABLE task_complete ADD CONSTRAINT fk_tc_user_id FOREIGN KEY (user_id) REFERENCES users(id);

DROP TABLE IF EXISTS status_complete;
-- Создаем таблицу типа выполнения
CREATE TABLE status_complete (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
	`name` VARCHAR(100) NOT NULL COMMENT "Статус выполнения задания"
) COMMENT "Тип выполнения";

ALTER TABLE task_complete ADD CONSTRAINT fk_tc_status_complete_id FOREIGN KEY (status_complete_id) REFERENCES status_complete(id);

-- Таблица логов для заполнения и обновления task_complite

DROP TABLE logs_tk;
CREATE TABLE logs_tk (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  data_ctreate DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'время и дата создания записи',
  last_user_id INT NOT NULL COMMENT 'идентификатор первичного ключа юзера',
  task_id INT COMMENT 'идентификатор первичного ключа задания',
  status_complete_id INT NOT NULL COMMENT 'идентификатор первичного ключа статуса',
  score INT COMMENT 'идентификатор первичного ключа оценки'
) ENGINE = Archive;

SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'edu_environment';

