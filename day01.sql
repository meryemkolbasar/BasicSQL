-- COMMENT LINE
---------------------DAY'1----------------------
-- 1-creating a database-DDL
CREATE DATABASE deneme;

-- 2-deleting a database-DDL
DROP DATABASE deneme;

-- 3-creating a table-DDL
CREATE TABLE students(
id char(4),
name varchar(50),
grade real,
register_date date	
); 

-- 4-creating a new table from an existing table
CREATE TABLE grades AS SELECT name, grade FROM students;

-- 5-inserting data into the table with all fields
INSERT INTO students VALUES('1001', 'Sherlock Holmes', 99.9, '2023-04-23');
INSERT INTO students VALUES('1002', 'Jack Sparrow', 98, now());

-- 6-inserting data into the table with some fields
INSERT INTO students(name, grade) VALUES('Harry Potter', 99.9);

-- 7-reading/fetching all records from the table with all fields
SELECT * FROM students;

-- 8-reading/fetching all records from the table with specific fields
SELECT name, grade FROM students;
