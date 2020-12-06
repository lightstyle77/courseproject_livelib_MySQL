/* Требования к курсовому проекту:
1.	Составить общее текстовое описание БД и решаемых ею задач;
2.	Минимальное количество таблиц - 10;
3.	Скрипты создания структуры БД (с первичными ключами, индексами, внешними ключами);
4.	Создать ERDiagram для БД - отдельный файл;
5.	Скрипты наполнения БД данными;
6.	Скрипты характерных выборок (включающие группировки, JOIN'ы, вложенные таблицы);
7.	Представления (минимум 2);
8.	Хранимые процедуры / триггеры; */

/* 1. База данных для книжного рекомендательного сервиса с самой большой коллекцией рецензий в Рунете
livelib - это место общения единомышленников.
Помимо традиционных групп по интересам, на сайте существует клубное пространство,
где книжные клубы России и не только делятся своими открытиями и опытом. */

/* 2. Количество таблиц - 16 */

/* 3. Cкрипты создания структуры БД (с первичными ключами, индексами, внешними ключами) */

/* 5. Cкрипты наполнения БД данными */

DROP DATABASE IF EXISTS livelib;
CREATE DATABASE livelib;
use livelib;


DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	firstname VARCHAR (20) COMMENT 'User name',	
	surname VARCHAR (40),
	email VARCHAR(55) UNIQUE,
	phone BIGINT UNSIGNED NOT NULL,
    
	INDEX users_firstname_surname_idx(firstname, surname)
);

INSERT INTO users VALUES 

('1', 'Colton', 'Berry', 'Berry@lacinia.org', '0500531702'),
('2', 'Austin', 'Love', 'love.mi@egestas.com', '05559283804'),
('3', 'Davis', 'Green', 'orci.luctus.et@Aliquam.ca', '03479519288'),
('4', 'Elton', 'Bean', 'Elton@euismod.co.uk', '07037913090'),
('5', 'Melvin', 'Daniel', 'a@mollis.com', '01718457890'),
('6', 'Simon', 'Olson', 'simon@convallisligulaDonec.edu', '0113203808'),
('7', 'Nash', 'Reed', 'nash@auguescelerisque.org', '05585359403'),
('8', 'Jesse', 'Ortega', 'jesseortega@dapibusquam.net', '08001111'),
('9', 'Ira', 'Vasquez', 'cursus.Integer@hymenaeos.net', '03748255087'),
('10', 'Reed', 'Taylor', 'elit@libero.org', '07524806791');

DROP TABLE IF EXISTS photo;
CREATE TABLE photos(
	id SERIAL PRIMARY KEY,
	filename VARCHAR (55)
);

INSERT INTO photos VALUES 

('1', 'img1.jpeg'),
('2', 'img2.jpeg'),
('3', 'img3.jpeg'),
('4', 'img4.jpeg'),
('5', 'img5.jpeg'),
('6', 'img6.jpeg'),
('7', 'img7.jpeg'),
('8', 'img8.jpeg'),
('9', 'img9.jpeg'),
('10', 'img10.jpeg');

DROP TABLE IF EXISTS profiles_photo;
CREATE TABLE profiles_photo (
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	photo_id BIGINT UNSIGNED NOT NULL,
    
    INDEX (user_id, photo_id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (photo_id) REFERENCES photos(id)
    );
    
INSERT INTO profiles_photo (user_id, photo_id) VALUES ('1', '1');
INSERT INTO profiles_photo (user_id, photo_id) VALUES ('2', '2');
INSERT INTO profiles_photo (user_id, photo_id) VALUES ('1', '3');
INSERT INTO profiles_photo (user_id, photo_id) VALUES ('3', '4');
INSERT INTO profiles_photo (user_id, photo_id) VALUES ('4', '5');
INSERT INTO profiles_photo (user_id, photo_id) VALUES ('5', '6');
INSERT INTO profiles_photo (user_id, photo_id) VALUES ('6', '7');
INSERT INTO profiles_photo (user_id, photo_id) VALUES ('8', '10');
INSERT INTO profiles_photo (user_id, photo_id) VALUES ('9', '9');
INSERT INTO profiles_photo (user_id, photo_id) VALUES ('10', '8');

DROP TABLE IF EXISTS books;
CREATE TABLE books (
	id SERIAL PRIMARY KEY,
	title VARCHAR (120),
	body TEXT,
	ISBN BIGINT UNSIGNED NOT NULL
);

INSERT INTO books VALUES 

('1', 'Гарри Поттер и философский камень', 'Первый роман в серии книг про юного волшебника Гарри Поттера', '9785389136212'),
('2', 'Голодные игры', 'Эти парень и девушка знакомы с детства и еще могут полюбить друг друга, но им придется стать врагами…
 По жребию они должны участвовать в страшных «Голодных играх», где выживает только один — сильнейший', '9785171011079'),
('3', 'Властелин колец', 'Роман-эпопея про хоббита Бильбо Бэггинс',	'9785171194314'),
('4', 'Игра престолов',	'Лорды и герои, воины и чернокнижники совершают великие деяния и предательства,
 плетут политические интриги, борются за власть - все ради того, чтобы исполнилось древнее пророчество о мире
 Семи Королевств - мире суровых земель вечного холода и цветущих земель вечного лета', '9785171141226'),
('5', 'Ведьмак', 'Сага о Геральте', '9785171216962'),
('6', 'Игра Эндера','Научно-фантастическая книга о будущем, где человечество чудом пережило вторжение агрессивной инопланетной расы,
 прозванной жукеры', '9785389148888');


DROP TABLE IF EXISTS authors;
CREATE TABLE authors (
	id SERIAL PRIMARY KEY,
	firstname VARCHAR (55) COMMENT 'Name',
	surname VARCHAR (55) COMMENT 'Surname',
	body TEXT COMMENT 'Biography',
    
    INDEX authors_firstname_surname_idx(firstname, surname)
);

INSERT INTO authors VALUES 

('1', 'Джоан', 'Роулинг', 'Родилась 31 июля 1965 года. Британская писательница,
 сценаристка и кинопродюсер, наиболее известная как автор серии романов о Гарри Поттере.'),
 
 ('2', 'Анджей',	'Сапковский',	'Родился 21 июня 1948 года Польский писатель-фантаст и публицист,
 автор популярной фэнтези-саги Ведьмак.'),
 
('3', 'Джон', 'Толкин', '3 января 1892 года — 2 сентября 1973 года. Английский писатель и поэт, переводчик, лингвист, филолог.
 Один из самых известных писателей. Профессор Оксфордского университета.
 Наиболее известен как автор классических произведений «высокого фэнтези»:
 «Хоббит, или Туда и обратно», «Властелин колец» и «Сильмариллион».'),
	
('4', 'Джордж','Мартин',	'Родился 20 сентября 1948. Современный американский писатель-фантаст,
 сценарист, продюсер и редактор, лауреат многих литературных премий.'),
	
('5', 'Орсон',	'Кард', 'Родился 24 августа 1951 года. Американский писатель-фантаст,
 автор ряда книг в жанрах научной фантастики, фэнтези и альтернативной истории.'),

('6', 'Сьюзен',	'Коллинз', 'Родилась 10 августа 1962 года. Американская писательница,
 автор многочисленных сценариев к детским телепрограммам и мультфильмам, рассказов для детей,
 а также известная как создательница двух популярных книжных серий для молодежи.');

DROP TABLE IF EXISTS book_author;
CREATE TABLE book_author (
	id SERIAL PRIMARY KEY,
	book_id BIGINT UNSIGNED NOT NULL,
	author_id BIGINT UNSIGNED NOT NULL,
    
	FOREIGN KEY (book_id) REFERENCES books(id),
	FOREIGN KEY (author_id) REFERENCES authors(id)
);

INSERT INTO book_author VALUES 

('1', '1', '1'),
('2', '2', '6'),
('3', '3', '3'),
('4', '4', '4'),
('5', '5', '2'),
('6', '6', '5');

DROP TABLE IF EXISTS genres;
CREATE TABLE genres (
	id SERIAL PRIMARY KEY,
	type VARCHAR (55),
    
    KEY genres_type_idx(type)
);

INSERT INTO genres VALUES 

('1', 'Научная фантастика'),	
('2', 'Роман'),
('3', 'Фэнтези');

DROP TABLE IF EXISTS genres_author;
CREATE TABLE genres_author (
	id SERIAL PRIMARY KEY,
	author_id BIGINT UNSIGNED NOT NULL,
	genres_id BIGINT UNSIGNED NOT NULL,
    
    INDEX genres_author_author_id_genres_id (author_id, genres_id),
	FOREIGN KEY (author_id) REFERENCES authors(id),
	FOREIGN KEY (genres_id) REFERENCES genres(id)
);

INSERT INTO genres_author (author_id, genres_id) VALUES ('1', '2');
INSERT INTO genres_author (author_id, genres_id) VALUES ('2', '3');
INSERT INTO genres_author (author_id, genres_id) VALUES ('2', '2');
INSERT INTO genres_author (author_id, genres_id) VALUES ('4', '2');
INSERT INTO genres_author (author_id, genres_id) VALUES ('3', '1');
INSERT INTO genres_author (author_id, genres_id) VALUES ('5', '1');
INSERT INTO genres_author (author_id, genres_id) VALUES ('5', '3');

DROP TABLE IF EXISTS quotos;
CREATE TABLE quotos (
	id SERIAL PRIMARY KEY,
	book_id BIGINT UNSIGNED NOT NULL,
	body TEXT,
    
    FOREIGN KEY (book_id) REFERENCES books(id)
);

INSERT INTO quotos VALUES 

('1', '2', 'То, что я чувствую, должно принадлежать только мне.'),

('2', '4', 'Страх ранит глубже, чем меч.'),

('3', '1', 'Есть события, пережив которые нельзя не проникнуться друг к другу симпатией.'),

('4', '5',	'Хорошо, хорошо. Не будешь княгиней. Станешь хомячком и будешь жить в норке.'),

('5', '6', 'Значит, мы воюем просто потому, что не можем поговорить?'),

('6', '3', 'Даже самый маленький человек способен изменить ход будущего.');
 


DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
	user_id SERIAL PRIMARY KEY,
	gender ENUM ('M', 'F'), 
	birthday DATE,
	hometown VARCHAR(100),
	profile_photo_id BIGINT UNSIGNED NOT NULL,
	joined_at DATETIME,
	user_name VARCHAR(100),	
	updates DATETIME DEFAULT NOW(),
    
    FOREIGN KEY (profile_photo_id) REFERENCES profiles_photo(id)
);

INSERT INTO profiles (user_id, gender, birthday, hometown, profile_photo_id, joined_at, user_name) VALUES

('1', 'M', '1985-10-01', 'Miami', '3', '2020-10-01 11:32:54', 'Berry'),
('2', 'M', '1990-09-01', 'San Francisco', '2', '2011-02-23 10:49:50', 'lovemi'),
('3', 'M', '2001-07-05', 'Avon', '4', '2007-03-19 09:55:03', 'orci'),
('4', 'M', '1975-05-01', 'Miami', '5', '2019-05-19 10:45:32', 'Elton'),
('5', 'M', '1983-12-25', 'San Francisco',	'6', '2017-05-19 10:45:32', 'Melvin'),
('6', 'M', '1997-04-10', 'San Francisco', '8', '2010-01-04 21:54:31', 'simon'),
('7', 'M', '1981-11-01', 'Miami', '9', '2003-09-25 20:00:00', 'nash'),
('8', 'F', '1992-10-11', 'Miami', '10', '2014-07-03 21:55:32', 'jesseortega'),
('9', 'F', '1973-01-01', 'San Francisco', '7', '2000-02-01 21:54:32', 'cursus'),
('10', 'F',	'1987-04-01', 'Avon', '1', '2007-01-01 22:00:32', 'elite');


DROP TABLE IF EXISTS users_books;
CREATE TABLE users_books (
	user_id BIGINT UNSIGNED NOT NULL,
	book_id BIGINT UNSIGNED NOT NULL,
	status ENUM ('read', 'currently reading', 'want to read'),
    
    PRIMARY KEY (user_id, book_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);

INSERT INTO users_books (user_id, book_id, status) VALUES

('2', '2','read'),
('2', '1', 'want to read'),	
('2', '6', 'currently reading'),
('4', '5', 'currently reading'),	
('5', '4','read'),
('6', '3', 'currently reading'),
('7', '6', 'want to read');

DROP TABLE IF EXISTS covers;
CREATE TABLE covers (
	id SERIAL PRIMARY KEY,
	filename VARCHAR (55)
);

INSERT INTO covers (filename) VALUES 

('pic100.jpeg'),
('pic22.jpeg'),
('pic33.jpeg'),
('pic4.jpeg'),
('pic5.jpeg'),
('pic6.jpeg'),
('pic7.jpeg'),
('pic8.jpeg'),
('pic9.jpeg'),
('pic10.jpeg');


DROP TABLE IF EXISTS book_covers;
CREATE TABLE book_covers (
	id SERIAL PRIMARY KEY,
	book_id BIGINT UNSIGNED NOT NULL,
	cover_id BIGINT UNSIGNED NOT NULL,
    
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (cover_id) REFERENCES covers(id)
);

INSERT INTO book_covers (book_id, cover_id) VALUES 

('2', '1'),
('5', '3'),
('1', '4'),
('3', '5'),
('4', '6'),
('6', '8'),
('6', '7'),
('1', '9'),
('1', '10');


DROP TABLE IF EXISTS friend_requested;
CREATE TABLE friend_requested (
	from_user_id BIGINT UNSIGNED NOT NULL,
	to_user_id BIGINT UNSIGNED NOT NULL,
	status ENUM('requested', 'approved', 'unfriended', 'declined'),
	requested_at DATETIME,
	confirmed_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

	PRIMARY KEY (from_user_id, to_user_id),
    FOREIGN KEY (from_user_id) REFERENCES users(id),
    FOREIGN KEY (to_user_id) REFERENCES users(id)
);
      
INSERT INTO friend_requested (from_user_id, to_user_id, status, requested_at) VALUES 

('1', '2','approved', '2003-01-04'),
('2', '3', 'requested', '2002-02-01'),
('4', '1', 'declined', '2007-05-04'),
('5', '1', 'declined', '2020-01-01'),
('6', '2','approved', '2019-02-03'),
('7', '8', 'approved', '2019-03-02'),
('2', '6', 'requested', '2019-07-09'),
('3', '7', 'requested', '2019-05-05'),
('9', '8', 'unfriended', '2014-01-10'),
('10', '2', 'unfriended','2015-01-10');


DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
	id SERIAL PRIMARY KEY,
	from_user_id BIGINT UNSIGNED NOT NULL,
	to_user_id BIGINT UNSIGNED NOT NULL,
	body TEXT,
	created_at DATETIME DEFAULT NOW(),
    
    FOREIGN KEY (from_user_id) REFERENCES users(id),
    FOREIGN KEY (to_user_id) REFERENCES users(id)
);

INSERT INTO messages (from_user_id, to_user_id, body) VALUES 

('2', '3', 'Добрый день'),
('4', '1', 'Отличная рецензия книги'),
('6', '2', 'Нравится эта книга ?'),
('2','9', 'Вступайте в наш книжный клуб');


DROP TABLE IF EXISTS books_info; 
CREATE TABLE books_info (
	book_cover_id BIGINT UNSIGNED NOT NULL,
	pages BIGINT UNSIGNED NOT NULL,
	date_published YEAR,
	get_a_copy VARCHAR(55),
	publisher VARCHAR(55),
    
	FOREIGN KEY (book_cover_id) REFERENCES book_covers(id)
);

INSERT INTO books_info VALUES 

('9', '140', '2019', 'Ozon', 'Эксмо'),
('1', '320', '2020', 'Читай-город', 'АСТ'),
('5', '550', '2014', 'Ozon', 'АСТ'),
('5', '470', '2019', 'Ozon', 'Азбука'),
('6', '410', '2017', 'Читай-город', 'АСТ'),
('3', '555', '2019', 'Ozon', 'АСТ'),
('7', '275', '2020', 'Ozon', 'АСТ'),
('8', '320', '2020', 'Ozon', 'АСТ');


/* 6. Cкрипты характерных выборок (включающие группировки, JOIN'ы, вложенные таблицы) */

-- SELECT
SELECT body FROM quotos;
SELECT surname, body FROM authors;
-- WHERE 
SELECT * FROM profiles WHERE gender = 'M';
SELECT * FROM profiles WHERE hometown = 'Miami';
SELECT * FROM users_books WHERE status = 'currently reading';
-- DISTINCT
SELECT distinct publisher FROM books_info;
-- BETWEEN
SELECT * FROM profiles WHERE user_id BETWEEN 3 AND 7;
SELECT * FROM profiles WHERE birthday BETWEEN '2000-01-01' AND '2010-01-01';
-- ORDER BY 
SELECT * FROM profiles WHERE hometown = 'San Francisco' order by user_id desc;
SELECT distinct hometown FROM profiles ORDER BY hometown;
SELECT user_id, SUBSTRING(birthday,1,3) AS decade FROM profiles ORDER BY decade;
-- LIKE
SELECT  * FROM profiles WHERE hometown LIKE 'Mi%';
SELECT  * FROM profiles WHERE hometown NOT LIKE 'Mi%';
SELECT * FROM profiles WHERE birthday LIKE '19%';
-- RAND
SELECT email FROM users ORDER BY RAND() LIMIT 1;
SELECT body FROM quotos ORDER BY RAND() LIMIT 1;
-- GROUP BY
SELECT publisher FROM books_info GROUP BY publisher;
SELECT hometown FROM profiles GROUP BY hometown;
-- COUNT
SELECT COUNT(user_id) from profiles;
SELECT COUNT(*), SUBSTRING(birthday,1,3) AS decade FROM profiles GROUP BY decade ORDER BY decade desc;
-- HAVING
SELECT * FROM profiles HAVING birthday > '1987-04-01';
SELECT * FROM books_info HAVING publisher = 'АСТ';

-- UNION
SELECT * FROM photos 
UNION 
SELECT * FROM covers;

SELECT body as description FROM books
UNION
SELECT body from authors;

-- Вложенные таблицы
SELECT
  book_id, body 
FROM 
  quotos 
WHERE
  book_id = (SELECT id from books WHERE title = 'Игра Эндера');

SELECT
 body,
 (SELECT title from books WHERE id = book_id) as 'Book name'
FROM 
  quotos;
  
-- JOIN'ы
SELECT books.title, genres.type FROM genres JOIN books;
  
SELECT 
  p.hometown, u.firstname, u.surname 
FROM 
  profiles as p 
JOIN 
  users as u
ON u.id = p.user_id;

SELECT
 *
FROM 
  genres as fst
JOIN
  genres as snd
USING (id);

SELECT 
	firstname, surname, email, phone, gender, birthday, hometown
  FROM profiles
    JOIN users ON users.id = profiles.user_id
  WHERE users.id = 1;
  
SELECT m.body as 'message', u.firstname, u.surname, m.created_at
  FROM messages as m
    JOIN users as u ON u.id = m.to_user_id
  WHERE u.id = 2;
  
  SELECT m.body as 'message', u.firstname, u.surname, m.created_at
  FROM messages as m
    JOIN users as u ON u.id = m.from_user_id
  WHERE u.id = 2;
  
  SELECT firstname, surname, COUNT(*) AS friends
  FROM users
    JOIN friend_requested ON (users.id = friend_requested.from_user_id or users.id = friend_requested.to_user_id)
  WHERE friend_requested.status = 'approved'
  GROUP BY users.id;
  
  SELECT  u.firstname, u.surname, COUNT(*) AS total_friends
  FROM users as u
  JOIN friend_requested as f ON u.id = f.to_user_id and f.from_user_id
  WHERE f.status = 'approved'
  GROUP BY u.id;
  
   SELECT  firstname, surname, COUNT(*) AS total_friends
  FROM users as u
  JOIN friend_requested as f ON u.id = f.to_user_id and f.from_user_id
  WHERE f.status = 'unfriended'
  GROUP BY u.id;
  
  /* 7. Представления */
  -- Переменные
  SELECT @month := NOW() - INTERVAL 5 MONTH;
  SELECT CURDATE(), @month;
  
  SELECT @title := title FROM books;
  
  -- Представления
  CREATE VIEW friends AS SELECT firstname, surname, COUNT(*) AS total_friends
  FROM users as u
  JOIN friend_requested as f ON u.id = f.to_user_id and f.from_user_id
  WHERE f.status = 'unfriended'
  GROUP BY u.id;
  
  SELECT * FROM friends;
  
CREATE VIEW book_stats AS SELECT firstname, surname, COUNT(*) AS total_books
  FROM users 
    JOIN users_books ON users.id = users_books.user_id
	  GROUP BY users.id;
      
 SELECT * FROM book_stats;
 
 SHOW TABLES;
 
DROP VIEW IF EXISTS friends, book_stats;

/* 8. Хранимые процедуры / триггеры */

SHOW PROCEDURE STATUS;

DELIMITER //
CREATE PROCEDURE test ()
BEGIN 
  SELECT VERSION();
END //
DELIMITER ;

CALL test();
SHOW CREATE PROCEDURE test;


DELIMITER //
CREATE TRIGGER user_count AFTER INSERT ON users
FOR EACH ROW
BEGIN 
  SELECT COUNT(*) INTO @total FROM users;
END //
DELIMITER ;

INSERT INTO users VALUES ('11', 'Anna', 'Olsen', 'olsen545@yahoo.eu', '0450532707');
SELECT * FROM users;
SELECT @total;