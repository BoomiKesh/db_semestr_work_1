CREATE TABLE main.Genres (
	genre_id SERIAL PRIMARY KEY,
	name VARCHAR NOT NULL
);
CREATE TABLE main.Publishers (
	publisher_id SERIAL PRIMARY KEY,
	name VARCHAR NOT NULL,
	country VARCHAR NOT NULL
);
CREATE TABLE main.Authors (
	author_id SERIAL PRIMARY KEY,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	country VARCHAR NOT NULL
);
CREATE TABLE main.Books (
	book_id SERIAL PRIMARY KEY,
	title VARCHAR NOT NULL,
	author_id INTEGER REFERENCES main.Authors(author_id),
	publisher_id INTEGER REFERENCES main.Publishers(publisher_id),
	publication_year INTEGER
);
CREATE TABLE main.BookGenres(
	book_id INTEGER REFERENCES main.Books(book_id),
	genre_id INTEGER REFERENCES main.Genres(genre_id)
);
CREATE TABLE customerinteractions.Customers(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT  NULL,
	age INTEGER
);
CREATE TABLE customerinteractions.Library(
	library_id SERIAL PRIMARY KEY,
	addres VARCHAR
);
CREATE TABLE customerinteractions.Employees(
	employee_id SERIAL PRIMARY KEY,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT  NULL,
	age INTEGER,
	library_id INTEGER REFERENCES customerinteractions.Library(library_id)
);
CREATE TABLE customerinteractions.BookAvalibility(
	book_id INTEGER REFERENCES main.Books(book_id),
	library_id INTEGER REFERENCES customerinteractions.Library(library_id),
	amount INTEGER
);
CREATE TABLE customerinteractions.CustomerBooks(
	customer_id INTEGER REFERENCES customerinteractions.Customers(customer_id),
	book_id INTEGER REFERENCES main.Books(book_id),
	library_id INTEGER REFERENCES customerinteractions.Library(library_id),
	expiration_date DATE
);

COMMENT ON TABLE main.Genres IS 'Таблица жанров книг';
COMMENT ON COLUMN main.Genres.genre_id IS 'Уникальный идентификатор жанра';
COMMENT ON COLUMN main.Genres.name IS 'Название жанра';

COMMENT ON TABLE main.Publishers IS 'Таблица издательств';
COMMENT ON COLUMN main.Publishers.publisher_id IS 'Уникальный идентификатор издательства';
COMMENT ON COLUMN main.Publishers.name IS 'Название издательства';
COMMENT ON COLUMN main.Publishers.country IS 'Страна издательства';

COMMENT ON TABLE main.Authors IS 'Таблица авторов книг';
COMMENT ON COLUMN main.Authors.author_id IS 'Уникальный идентификатор автора';
COMMENT ON COLUMN main.Authors.first_name IS 'Имя автора';
COMMENT ON COLUMN main.Authors.last_name IS 'Фамилия автора';
COMMENT ON COLUMN main.Authors.country IS 'Страна автора';

COMMENT ON TABLE main.Books IS 'Таблица книг';
COMMENT ON COLUMN main.Books.book_id IS 'Уникальный идентификатор книги';
COMMENT ON COLUMN main.Books.title IS 'Название книги';
COMMENT ON COLUMN main.Books.author_id IS 'Идентификатор автора (внешний ключ)';
COMMENT ON COLUMN main.Books.publisher_id IS 'Идентификатор издательства (внешний ключ)';
COMMENT ON COLUMN main.Books.publication_year IS 'Год публикации книги';

COMMENT ON TABLE main.BookGenres IS 'Связующая таблица книг и жанров (многие ко многим)';
COMMENT ON COLUMN main.BookGenres.book_id IS 'Идентификатор книги (внешний ключ)';
COMMENT ON COLUMN main.BookGenres.genre_id IS 'Идентификатор жанра (внешний ключ)';

COMMENT ON TABLE customerinteractions.Customers IS 'Таблица клиентов библиотеки';
COMMENT ON COLUMN customerinteractions.Customers.customer_id IS 'Уникальный идентификатор клиента';
COMMENT ON COLUMN customerinteractions.Customers.first_name IS 'Имя клиента';
COMMENT ON COLUMN customerinteractions.Customers.last_name IS 'Фамилия клиента';
COMMENT ON COLUMN customerinteractions.Customers.age IS 'Возраст клиента';

COMMENT ON TABLE customerinteractions.Library IS 'Таблица библиотек';
COMMENT ON COLUMN customerinteractions.Library.library_id IS 'Уникальный идентификатор библиотеки';
COMMENT ON COLUMN customerinteractions.Library.addres IS 'Адрес библиотеки';

COMMENT ON TABLE customerinteractions.Employees IS 'Таблица сотрудников библиотеки';
COMMENT ON COLUMN customerinteractions.Employees.employee_id IS 'Уникальный идентификатор сотрудника';
COMMENT ON COLUMN customerinteractions.Employees.first_name IS 'Имя сотрудника';
COMMENT ON COLUMN customerinteractions.Employees.last_name IS 'Фамилия сотрудника';
COMMENT ON COLUMN customerinteractions.Employees.age IS 'Возраст сотрудника';
COMMENT ON COLUMN customerinteractions.Employees.library_id IS 'Идентификатор библиотеки (внешний ключ)';

COMMENT ON TABLE customerinteractions.BookAvalibility IS 'Таблица наличия книг в библиотеках';
COMMENT ON COLUMN customerinteractions.BookAvalibility.book_id IS 'Идентификатор книги (внешний ключ)';
COMMENT ON COLUMN customerinteractions.BookAvalibility.library_id IS 'Идентификатор библиотеки (внешний ключ)';
COMMENT ON COLUMN customerinteractions.BookAvalibility.amount IS 'Количество доступных экземпляров';

COMMENT ON TABLE customerinteractions.CustomerBooks IS 'Таблица выданных книг клиентам';
COMMENT ON COLUMN customerinteractions.CustomerBooks.customer_id IS 'Идентификатор клиента (внешний ключ)';
COMMENT ON COLUMN customerinteractions.CustomerBooks.book_id IS 'Идентификатор книги (внешний ключ)';
COMMENT ON COLUMN customerinteractions.CustomerBooks.library_id IS 'Идентификатор библиотеки (внешний ключ)';
COMMENT ON COLUMN customerinteractions.CustomerBooks.expiration_date IS 'Дата возврата книги';

INSERT INTO main.Genres (name) VALUES
('Фантастика'),
('Детектив'),
('Роман'),
('Фэнтези'),
('Научная литература'),
('Исторический роман'),
('Биография'),
('Поэзия');


INSERT INTO main.Publishers (name, country) VALUES
('Эксмо', 'Россия'),
('АСТ', 'Россия'),
('Penguin Random House', 'США'),
('HarperCollins', 'Великобритания'),
('Молодая гвардия', 'Россия'),
('Дрофа', 'Россия');


INSERT INTO main.Authors (first_name, last_name, country) VALUES
('Лев', 'Толстой', 'Россия'),
('Федор', 'Достоевский', 'Россия'),
('Агата', 'Кристи', 'Великобритания'),
('Айзек', 'Азимов', 'США'),
('Джоан', 'Роулинг', 'Великобритания'),
('Александр', 'Пушкин', 'Россия'),
('Михаил', 'Булгаков', 'Россия'),
('Эрих', 'Ремарк', 'Германия');


INSERT INTO main.Books (title, author_id, publisher_id, publication_year) VALUES
('Война и мир', 1, 1, 1869),
('Преступление и наказание', 2, 2, 1866),
('Убийство в Восточном экспрессе', 3, 3, 1934),
('Я, робот', 4, 3, 1950),
('Гарри Поттер и философский камень', 5, 4, 1997),
('Евгений Онегин', 6, 5, 1833),
('Мастер и Маргарита', 7, 1, 1967),
('Три товарища', 8, 2, 1936),
('Анна Каренина', 1, 1, 1877),
('Основание', 4, 3, 1951);


INSERT INTO main.BookGenres (book_id, genre_id) VALUES
(1, 3), (1, 6),  
(2, 3),           
(3, 2),           
(4, 1), (4, 5),   
(5, 4),           
(6, 3), (6, 8),   
(7, 3), (7, 4),   
(8, 3),           
(9, 3),           
(10, 1), (10, 5); 


INSERT INTO customerinteractions.Customers (first_name, last_name, age) VALUES
('Иван', 'Петров', 25),
('Мария', 'Сидорова', 32),
('Алексей', 'Козлов', 19),
('Елена', 'Васильева', 41),
('Дмитрий', 'Николаев', 28),
('Ольга', 'Орлова', 35);


INSERT INTO customerinteractions.Library (addres) VALUES
('ул. Ленина, д. 15, Москва'),
('пр. Победы, д. 42, Санкт-Петербург'),
('ул. Садовая, д. 7, Екатеринбург');


INSERT INTO customerinteractions.Employees (first_name, last_name, age, library_id) VALUES
('Светлана', 'Иванова', 45, 1),
('Андрей', 'Смирнов', 38, 1),
('Татьяна', 'Кузнецова', 29, 2),
('Павел', 'Морозов', 51, 2),
('Надежда', 'Павлова', 33, 3),
('Виктор', 'Федоров', 42, 3);


INSERT INTO customerinteractions.BookAvalibility (book_id, library_id, amount) VALUES
(1, 1, 5), (2, 1, 3), (3, 1, 7),
(4, 2, 4), (5, 2, 6), (6, 2, 2),
(7, 3, 8), (8, 3, 3), (9, 3, 5),
(10, 1, 2), (1, 2, 4), (2, 3, 6);


INSERT INTO customerinteractions.CustomerBooks (customer_id, book_id, library_id, expiration_date) VALUES
(1, 1, 1, '2024-02-15'),
(1, 4, 2, '2024-02-20'),
(2, 5, 2, '2024-02-18'),
(3, 7, 3, '2024-02-22'),
(4, 2, 1, '2024-02-16'),
(5, 8, 3, '2024-02-25'),
(6, 3, 1, '2024-02-19');

CREATE INDEX idx_books_author_id ON main.Books(author_id);
CREATE INDEX idx_books_publisher_id ON main.Books(publisher_id);
CREATE INDEX idx_bookgenres_book_id ON main.BookGenres(book_id);
CREATE INDEX idx_bookgenres_genre_id ON main.BookGenres(genre_id);
CREATE INDEX idx_bookavalibility_book_id ON customerinteractions.BookAvalibility(book_id);
CREATE INDEX idx_customerbooks_customer_id ON customerinteractions.CustomerBooks(customer_id);
CREATE INDEX idx_customerbooks_book_id ON customerinteractions.CustomerBooks(book_id);

CREATE TABLESPACE firstTablespace 
LOCATION '..\DB\TableSpaces\firstTableSpace';

CREATE TABLESPACE secondTablespace 
LOCATION '..\DB\TableSpaces\secondTableSpace';

ALTER TABLE	main.Genres SET TABLESPACE firstTableSpace;
ALTER TABLE main.Publishers SET TABLESPACE firsttablespace;
ALTER TABLE main.Authors SET TABLESPACE firsttablespace;
ALTER TABLE main.Books SET TABLESPACE firsttablespace;
ALTER TABLE main.BookGenres SET TABLESPACE firsttablespace;

ALTER TABLE customerinteractions.Customers SET TABLESPACE firsttablespace;
ALTER TABLE customerinteractions.Library SET TABLESPACE firsttablespace;
ALTER TABLE customerinteractions.Employees SET TABLESPACE firsttablespace;
ALTER TABLE customerinteractions.BookAvalibility SET TABLESPACE firsttablespace;
ALTER TABLE customerinteractions.CustomerBooks SET TABLESPACE firsttablespace;

ALTER INDEX main.idx_books_author_id SET TABLESPACE secondtablespace;
ALTER INDEX main.idx_books_publisher_id SET TABLESPACE secondtablespace;
ALTER INDEX main.idx_bookgenres_book_id SET TABLESPACE secondtablespace;
ALTER INDEX main.idx_bookgenres_genre_id SET TABLESPACE secondtablespace;

ALTER INDEX customerinteractions.idx_bookavalibility_book_id SET TABLESPACE secondtablespace;
ALTER INDEX customerinteractions.idx_customerbooks_customer_id SET TABLESPACE secondtablespace;
ALTER INDEX customerinteractions.idx_customerbooks_book_id SET TABLESPACE secondtablespace;