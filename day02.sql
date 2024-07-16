------------DAY'2-----------------
--------repeat-------
CREATE TABLE poets(
id int,
name varchar(50),
email varchar(50)
);

INSERT INTO poets VALUES(1001, 'Cemal Süreya', 'poet@gmail.com');
INSERT INTO poets VALUES(1002, 'Rasim Özdenören', 'poet@gmail.com');
INSERT INTO poets VALUES(1003, '', 'poet@gmail.com');
INSERT INTO poets(name, email) VALUES('Akif Ersoy', '');

SELECT * FROM poets;

-- 9-adding unique constraint
CREATE TABLE developers(
id SERIAL,
name varchar(50),
email varchar(50) UNIQUE,
salary real,
prog_lang varchar(20)
);

INSERT INTO developers(name, email, salary, prog_lang) VALUES('Yavuz Bey', 'dev@email.com', 5000, 'Java');
INSERT INTO developers(name, email, salary, prog_lang) VALUES('Enes Bey', 'dev@email.com', 5000, 'Java'); -- won't accept because email is the same
INSERT INTO developers(email, salary, prog_lang) VALUES('dev2@email.com', 5000, 'JavaScript'); -- name should not be null

SELECT * FROM developers;

-- 10-adding NOT NULL constraint
CREATE TABLE doctors(
id SERIAL,
name varchar(50) NOT NULL,
email varchar(50) UNIQUE,
salary real
);

INSERT INTO doctors(name, email, salary) VALUES('Jack Sparrow', 'dr@gmail.com', 5000);
INSERT INTO doctors(email, salary) VALUES('doctor@gmail.com', 5000);
INSERT INTO doctors(name, email, salary) VALUES('', 'doctor2@gmail.com', 5000); -- name is empty, empty is not null

SELECT * FROM doctors;

-- 11-defining Primary Key: method 1
CREATE TABLE students2(
id int PRIMARY KEY, -- not null, unique, can be referenced in other tables
name varchar(50) NOT NULL, -- not shown as a constraint
grade real,
register_date DATE
);
SELECT * FROM students2;

-- 11-defining Primary Key: method 2
CREATE TABLE students3(
id int,
name varchar(50) NOT NULL,
grade real,
register_date DATE,
CONSTRAINT std_pk PRIMARY KEY(id) 	
);

-- composite key
CREATE TABLE students4(
id int,
name varchar(50) NOT NULL,
grade real,
register_date DATE,
CONSTRAINT student_pk PRIMARY KEY(id, name) -- multiple columns can be set as PK
);

SELECT * FROM students4;

-- 12-defining Foreign Key
CREATE TABLE address3(
address_id int,
street varchar(50),
city varchar(20),
student_id int,	
CONSTRAINT add_fk 
FOREIGN KEY(student_id) REFERENCES students3(id)
);

SELECT * FROM address3;

-- 13-adding CHECK constraint
CREATE TABLE personnel(
id int,
name varchar(50) NOT NULL CHECK(name <> ''), -- <> not equals
salary real,
age int CHECK(age > 0)
);

INSERT INTO personnel VALUES(1, '', 5000, 12);
INSERT INTO personnel VALUES(1, 'Burhanettin Bey', 5000, -2);
INSERT INTO personnel VALUES(1, 'Burhanettin Bey', 5000, 22);
