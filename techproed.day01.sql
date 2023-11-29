--YORUM SATIRI
---------------------DAY'1----------------------
--1-database oluşturma-DDL
CREATE DATABASE deneme;

--2-database silme-DDL
DROP DATABASE deneme;

--3-tablo oluşturma-DDL
CREATE TABLE students(
id char(4),
name varchar(50),
grade real,
register_date date	
); 

--4-var olan tablodan yeni tablo oluşturma
CREATE TABLE grades AS SELECT name,grade FROM students;

--5-tabloya tüm fieldlarıyla data ekleme
INSERT INTO students VALUES('1001','Sherlock Holmes',99.9,'2023-04-23');
INSERT INTO students VALUES('1002','Jack Sparrow',98,now());

--6-tabloya bazı fieldlarıyla data ekleme
INSERT INTO students(name,grade) VALUES('Harry Potter',99.9);

--7-tablodan tüm kayıtları tüm fieldlarıyla data okuma/çekme
SELECT * FROM students;
--8-tablodan tüm kayıtları belirli fieldlarıyla data okuma/çekme
SELECT name,grade FROM students;









