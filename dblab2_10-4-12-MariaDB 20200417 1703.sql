--
-- Скрипт сгенерирован Devart dbForge Studio 2019 for MySQL, Версия 8.2.23.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 17.04.2020 17:03:42
-- Версия сервера: 5.5.5-10.4.12-MariaDB-1:10.4.12+maria~bionic-log
-- Версия клиента: 4.1
--

-- 
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установить режим SQL (SQL mode)
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Установка кодировки, с использованием которой клиент будет посылать запросы на сервер
--
SET NAMES 'utf8';

--
-- Установка базы данных по умолчанию
--
USE dblab2;

--
-- Удалить таблицу `django_migrations`
--
DROP TABLE IF EXISTS django_migrations;

--
-- Удалить таблицу `django_session`
--
DROP TABLE IF EXISTS django_session;

--
-- Удалить таблицу `auth_group_permissions`
--
DROP TABLE IF EXISTS auth_group_permissions;

--
-- Удалить таблицу `auth_user_groups`
--
DROP TABLE IF EXISTS auth_user_groups;

--
-- Удалить таблицу `auth_group`
--
DROP TABLE IF EXISTS auth_group;

--
-- Удалить таблицу `auth_user_user_permissions`
--
DROP TABLE IF EXISTS auth_user_user_permissions;

--
-- Удалить таблицу `django_admin_log`
--
DROP TABLE IF EXISTS django_admin_log;

--
-- Удалить таблицу `auth_user`
--
DROP TABLE IF EXISTS auth_user;

--
-- Удалить таблицу `auth_permission`
--
DROP TABLE IF EXISTS auth_permission;

--
-- Удалить таблицу `django_content_type`
--
DROP TABLE IF EXISTS django_content_type;

--
-- Установка базы данных по умолчанию
--
USE dblab2;

--
-- Создать таблицу `django_content_type`
--
CREATE TABLE django_content_type (
  id int(11) NOT NULL AUTO_INCREMENT,
  app_label varchar(100) NOT NULL,
  model varchar(100) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 7,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `django_content_type_app_label_model_76bd3d3b_uniq` для объекта типа таблица `django_content_type`
--
ALTER TABLE django_content_type
ADD UNIQUE INDEX django_content_type_app_label_model_76bd3d3b_uniq (app_label, model);

--
-- Создать таблицу `auth_permission`
--
CREATE TABLE auth_permission (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  content_type_id int(11) NOT NULL,
  codename varchar(100) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 25,
AVG_ROW_LENGTH = 682,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `auth_permission_content_type_id_codename_01ab375a_uniq` для объекта типа таблица `auth_permission`
--
ALTER TABLE auth_permission
ADD UNIQUE INDEX auth_permission_content_type_id_codename_01ab375a_uniq (content_type_id, codename);

--
-- Создать внешний ключ
--
ALTER TABLE auth_permission
ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id)
REFERENCES django_content_type (id);

--
-- Создать таблицу `auth_user`
--
CREATE TABLE auth_user (
  id int(11) NOT NULL AUTO_INCREMENT,
  password varchar(128) NOT NULL,
  last_login datetime(6) DEFAULT NULL,
  is_superuser tinyint(1) NOT NULL,
  username varchar(150) NOT NULL,
  first_name varchar(30) NOT NULL,
  last_name varchar(150) NOT NULL,
  email varchar(254) NOT NULL,
  is_staff tinyint(1) NOT NULL,
  is_active tinyint(1) NOT NULL,
  date_joined datetime(6) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 2,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `username` для объекта типа таблица `auth_user`
--
ALTER TABLE auth_user
ADD UNIQUE INDEX username (username);

--
-- Создать таблицу `django_admin_log`
--
CREATE TABLE django_admin_log (
  id int(11) NOT NULL AUTO_INCREMENT,
  action_time datetime(6) NOT NULL,
  object_id longtext DEFAULT NULL,
  object_repr varchar(200) NOT NULL,
  action_flag smallint(5) UNSIGNED NOT NULL CHECK (action_flag >= 0),
  change_message longtext NOT NULL,
  content_type_id int(11) DEFAULT NULL,
  user_id int(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать внешний ключ
--
ALTER TABLE django_admin_log
ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id)
REFERENCES django_content_type (id);

--
-- Создать внешний ключ
--
ALTER TABLE django_admin_log
ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id)
REFERENCES auth_user (id);

--
-- Создать таблицу `auth_user_user_permissions`
--
CREATE TABLE auth_user_user_permissions (
  id int(11) NOT NULL AUTO_INCREMENT,
  user_id int(11) NOT NULL,
  permission_id int(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` для объекта типа таблица `auth_user_user_permissions`
--
ALTER TABLE auth_user_user_permissions
ADD UNIQUE INDEX auth_user_user_permissions_user_id_permission_id_14a6b632_uniq (user_id, permission_id);

--
-- Создать внешний ключ
--
ALTER TABLE auth_user_user_permissions
ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id)
REFERENCES auth_permission (id);

--
-- Создать внешний ключ
--
ALTER TABLE auth_user_user_permissions
ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id)
REFERENCES auth_user (id);

--
-- Создать таблицу `auth_group`
--
CREATE TABLE auth_group (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(150) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `name` для объекта типа таблица `auth_group`
--
ALTER TABLE auth_group
ADD UNIQUE INDEX name (name);

--
-- Создать таблицу `auth_user_groups`
--
CREATE TABLE auth_user_groups (
  id int(11) NOT NULL AUTO_INCREMENT,
  user_id int(11) NOT NULL,
  group_id int(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `auth_user_groups_user_id_group_id_94350c0c_uniq` для объекта типа таблица `auth_user_groups`
--
ALTER TABLE auth_user_groups
ADD UNIQUE INDEX auth_user_groups_user_id_group_id_94350c0c_uniq (user_id, group_id);

--
-- Создать внешний ключ
--
ALTER TABLE auth_user_groups
ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id)
REFERENCES auth_group (id);

--
-- Создать внешний ключ
--
ALTER TABLE auth_user_groups
ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id)
REFERENCES auth_user (id);

--
-- Создать таблицу `auth_group_permissions`
--
CREATE TABLE auth_group_permissions (
  id int(11) NOT NULL AUTO_INCREMENT,
  group_id int(11) NOT NULL,
  permission_id int(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` для объекта типа таблица `auth_group_permissions`
--
ALTER TABLE auth_group_permissions
ADD UNIQUE INDEX auth_group_permissions_group_id_permission_id_0cd325b0_uniq (group_id, permission_id);

--
-- Создать внешний ключ
--
ALTER TABLE auth_group_permissions
ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id)
REFERENCES auth_permission (id);

--
-- Создать внешний ключ
--
ALTER TABLE auth_group_permissions
ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id)
REFERENCES auth_group (id);

--
-- Создать таблицу `django_session`
--
CREATE TABLE django_session (
  session_key varchar(40) NOT NULL,
  session_data longtext NOT NULL,
  expire_date datetime(6) NOT NULL,
  PRIMARY KEY (session_key)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `django_session_expire_date_a5c62663` для объекта типа таблица `django_session`
--
ALTER TABLE django_session
ADD INDEX django_session_expire_date_a5c62663 (expire_date);

--
-- Создать таблицу `django_migrations`
--
CREATE TABLE django_migrations (
  id int(11) NOT NULL AUTO_INCREMENT,
  app varchar(255) NOT NULL,
  name varchar(255) NOT NULL,
  applied datetime(6) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 18,
AVG_ROW_LENGTH = 963,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

-- 
-- Вывод данных для таблицы django_content_type
--
INSERT INTO django_content_type VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- 
-- Вывод данных для таблицы auth_user
--
INSERT INTO auth_user VALUES
(1, 'pbkdf2_sha256$180000$x1QlrsuTScUu$wGnlGcAc4cy6cKPVG64l0DKIj98sDqCYEUC10AeRuts=', '2020-04-17 10:23:51.751187', 1, 'root', '', '', '', 1, 1, '2020-04-17 10:23:07.517872');

-- 
-- Вывод данных для таблицы auth_permission
--
INSERT INTO auth_permission VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

-- 
-- Вывод данных для таблицы auth_group
--
-- Таблица dblab2.auth_group не содержит данных

-- 
-- Вывод данных для таблицы django_session
--
INSERT INTO django_session VALUES
('aczir5v1rhbewjqhq49nsyb6ta0gp896', 'YzQ2NjBhMGRiZjBlYjQxODZhNzVkZWE3MDI4MGUyODNjZTUxYWY4OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3ZTFiYWQ0NWQ1OWJlMTg2MDNhNjFmNmJmOTVkZDAwZmM1YWQ1OTk3In0=', '2020-05-01 10:23:51.753673');

-- 
-- Вывод данных для таблицы django_migrations
--
INSERT INTO django_migrations VALUES
(1, 'contenttypes', '0001_initial', '2020-04-17 10:14:53.860323'),
(2, 'auth', '0001_initial', '2020-04-17 10:14:54.267732'),
(3, 'admin', '0001_initial', '2020-04-17 10:14:55.61259'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-04-17 10:14:55.957358'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-04-17 10:14:55.971971'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-04-17 10:14:56.10123'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-04-17 10:14:56.273049'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-04-17 10:14:56.472063'),
(9, 'auth', '0004_alter_user_username_opts', '2020-04-17 10:14:56.488985'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-04-17 10:14:56.580614'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-04-17 10:14:56.589361'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-04-17 10:14:56.608988'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-04-17 10:14:56.62818'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-04-17 10:14:56.646983'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-04-17 10:14:56.828084'),
(16, 'auth', '0011_update_proxy_permissions', '2020-04-17 10:14:56.846876'),
(17, 'sessions', '0001_initial', '2020-04-17 10:14:56.911862');

-- 
-- Вывод данных для таблицы django_admin_log
--
-- Таблица dblab2.django_admin_log не содержит данных

-- 
-- Вывод данных для таблицы auth_user_user_permissions
--
-- Таблица dblab2.auth_user_user_permissions не содержит данных

-- 
-- Вывод данных для таблицы auth_user_groups
--
-- Таблица dblab2.auth_user_groups не содержит данных

-- 
-- Вывод данных для таблицы auth_group_permissions
--
-- Таблица dblab2.auth_group_permissions не содержит данных

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;