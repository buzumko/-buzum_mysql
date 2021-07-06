USE vk;

#
# TABLE STRUCTURE FOR: entity_types
#

INSERT INTO `entity_types` (`name`) VALUES ('ab');
INSERT INTO `entity_types` (`name`) VALUES ('doloremque');
INSERT INTO `entity_types` (`name`) VALUES ('et');
INSERT INTO `entity_types` (`name`) VALUES ('fugiat');
INSERT INTO `entity_types` (`name`) VALUES ('fugit');
INSERT INTO `entity_types` (`name`) VALUES ('molestias');
INSERT INTO `entity_types` (`name`) VALUES ('placeat');
INSERT INTO `entity_types` (`name`) VALUES ('quis');
INSERT INTO `entity_types` (`name`) VALUES ('voluptas');
INSERT INTO `entity_types` (`name`) VALUES ('voluptatem');


#
# TABLE STRUCTURE FOR: likes
# В likes была ошибка, потому что entity_id убрали. 
# Поэтому грохаю таблицу и создаю по новой
# 

DROP TABLE  IF EXISTS likes;

CREATE TABLE likes (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Идентификатор строки',
    from_user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя лайкнувшего пост",
    entity_name VARCHAR(128) NOT NULL COMMENT "Ссылка на сущность",
    created_at datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
    updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки'
) COMMENT 'Таблица лайков';

ALTER TABLE likes ADD CONSTRAINT fk_likes_entity_name FOREIGN KEY (entity_name) REFERENCES entity_types(`name`);

INSERT INTO `likes` (`id`, `from_user_id`, `entity_name`, `created_at`, `updated_at`) VALUES (105, 8, 'voluptatem', '2007-04-09 20:22:11', '2009-10-11 13:58:11');
INSERT INTO `likes` (`id`, `from_user_id`, `entity_name`, `created_at`, `updated_at`) VALUES (107, 3, 'et', '2011-09-06 05:49:07', '2006-09-09 14:37:09');
INSERT INTO `likes` (`id`, `from_user_id`, `entity_name`, `created_at`, `updated_at`) VALUES (114, 9, 'fugit', '1996-02-23 12:02:52', '1987-03-30 03:31:57');
INSERT INTO `likes` (`id`, `from_user_id`, `entity_name`, `created_at`, `updated_at`) VALUES (119, 0, 'et', '1972-04-30 05:10:24', '2010-05-04 14:43:08');
INSERT INTO `likes` (`id`, `from_user_id`, `entity_name`, `created_at`, `updated_at`) VALUES (162, 5, 'et', '1998-05-16 00:05:29', '1974-01-02 10:26:12');
INSERT INTO `likes` (`id`, `from_user_id`, `entity_name`, `created_at`, `updated_at`) VALUES (176, 7, 'et', '1992-10-09 15:29:24', '2004-03-31 21:10:18');
INSERT INTO `likes` (`id`, `from_user_id`, `entity_name`, `created_at`, `updated_at`) VALUES (177, 2, 'quis', '1998-04-21 03:47:49', '1977-03-15 23:21:02');

