------------DAY'2-----------------
--------tekrar-------
CREATE TABLE sairler(
id int,
name varchar(50),
email varchar(50)
);

INSERT INTO sairler VALUES(1001,'Cemal Süreya','sair@gmail.com');
INSERT INTO sairler VALUES(1002,'Rasim Özdenören','sair@gmail.com');
INSERT INTO sairler VALUES(1003,'','sair@gmail.com');
INSERT INTO sairler(name,email) VALUES('Akif Ersoy','');

SELECT * FROM sairler;

--9-tabloya unique constrainti ekleme
CREATE TABLE developers(
id SERIAL,
name varchar(50),
email varchar(50) UNIQUE,
salary real,
prog_lang varchar(20)
);

INSERT INTO developers(name,email,salary,prog_lang) VALUES('Yavuz Bey','dev@email.com',5000,'Java');
INSERT INTO developers(name,email,salary,prog_lang) VALUES('Enes Bey','dev@email.com',5000,'Java');--aynı email old için kabul etmez.
INSERT INTO developers(email,salary,prog_lang) VALUES('dev2@email.com',5000,'JavaScript');--name null olmasın??

SELECT * FROM developers;

--10-NOT NULL constrainti ekleme
CREATE TABLE doctors(
id SERIAL,
name varchar(50) NOT NULL,
email varchar(50) UNIQUE,
salary real
);

INSERT INTO doctors(name,email,salary) VALUES('Jack Sparrow','dr@gmail.com',5000);
INSERT INTO doctors(email,salary) VALUES('doctor@gmail.com',5000);
INSERT INTO doctors(name,email,salary) VALUES('','doctor2@gmail.com',5000);--isim empty, empty null değildir.

SELECT * FROM doctors;

--11-Primary Key tanımlama:1.yöntem
CREATE TABLE students2(
id int PRIMARY KEY,--not null,unique,diğer tablo ile ilişki için bu fieldı referans olark verebiliriz.
name varchar(50) NOT NULL,--not null constraint olarak göstermez.
grade real,
register_date DATE
);
SELECT * FROM students2;
--11-Primary Key tanımlama:2.yöntem

CREATE TABLE students3(
id int,
name varchar(50) NOT NULL,
grade real,
register_date DATE,
CONSTRAINT std_pk PRIMARY KEY(id) 	
);

--composite key
CREATE TABLE students4(
id int,
name varchar(50) NOT NULL,
grade real,
register_date DATE,
CONSTRAINT student_pk PRIMARY KEY(id,name)--birden fazla sütun PK olarak belirlenebilir. 	
);

SELECT * FROM students4;

--12-Foreign Key tanımlama

CREATE TABLE address3(
address_id int,
street varchar(50),
city varchar(20),
student_id int,	
CONSTRAINT add_fk 
FOREIGN KEY(student_id) REFERENCES students3(id)
);

SELECT * FROM address3;

--13-CHECK cons ekleme
CREATE TABLE personel(
id int,
name varchar(50) NOT NULL CHECK(name <> ''),--<> not equals
salary real,
age int CHECK(age>0)
);

INSERT INTO personel VALUES(1,'',5000,12);
INSERT INTO personel VALUES(1,'Burhanettin Bey',5000,-2);
INSERT INTO personel VALUES(1,'Burhanettin Bey',5000,22);









