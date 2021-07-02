USE vk;

-- Моя часть

DROP TABLE IF EXISTS media;
-- Таблица медиа
CREATE TABLE media (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
	from_user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на создателя медиа",
	media_link TEXT NOT NULL COMMENT "Ссылка на медиа",
    media_type ENUM('PICT', 'VIDEO', 'MUSIC') COMMENT "Тип медиа",
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания медиа",
	FOREIGN KEY (from_user_id) REFERENCES users(id),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


DROP TABLE IF EXISTS posts;
-- Таблица постов
CREATE TABLE posts (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
	from_user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на создателя поста",
	to_groups ENUM('FOR_ALL', 'FOR_FRIENDS', 'FOR_USER')  DEFAULT 'FOR_ALL' COMMENT "Ссылка на группу получателей поста",
	post_subject ENUM('TOURISM', 'HUMOR', 'SPORT', 'FOTO', 'IT', 'PLAYS', 'MUSIC') COMMENT "Тема поста",
	post_body TEXT NOT NULL COMMENT "Текст поста",
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания поста",
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (from_user_id) REFERENCES users(id)    
);

DROP TABLE IF EXISTS likes;
-- Таблица лайки
CREATE TABLE likes (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
	from_user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на создателя лайка",
    to_entity ENUM('PROFILE', 'MEDIA', 'POST') COMMENT "выбор объекта для лайка",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания медиа",
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (from_user_id) REFERENCES users(id)
);

