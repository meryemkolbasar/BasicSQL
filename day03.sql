------------------DAY'3-------------------
------------------repeat------------------

CREATE TABLE employees(
id char(5) PRIMARY KEY,--referenced by another table
name varchar(50) UNIQUE,
salary int NOT NULL,
start_date date
);



CREATE TABLE addresses(
address_id char(5),
street varchar(30),
avenue varchar(30),
city varchar(20),
FOREIGN KEY(address_id) REFERENCES employees(id)	
);



INSERT INTO employees VALUES('10002', 'Donatello' ,12000, '2018-04-14'); -- 
INSERT INTO employees VALUES('10003', null, 5000, '2018-04-14');--name not null değil, unique null kabul eder bir kere
INSERT INTO employees VALUES('10004', 'Donatello', 5000, '2018-04-14'); --name UNIQUE kabul etmez
INSERT INTO employees VALUES('10005', 'Michelangelo', 5000, '2018-04-14');--
INSERT INTO employees VALUES('10006', 'Leonardo', null, '2019-04-12');--salary NOT NULL old. için kabul etmez
INSERT INTO employees VALUES('10007', 'Raphael', '', '2018-04-14');--salary DATA TYPE:int olmalı
INSERT INTO employees VALUES('', 'April', 2000, '2018-04-14');--empty null değildir
INSERT INTO employees VALUES('', 'Ms.April', 2000, '2018-04-14');--PK->UNIQUE olmalı,kabul etmez
INSERT INTO employees VALUES('10002', 'Splinter' ,12000, '2018-04-14');--PK->UNIQUE olmalı,kabul etmez
INSERT INTO employees VALUES( null, 'Fred' ,12000, '2018-04-14');--PK->NOT NULL
INSERT INTO employees VALUES('10008', 'Barnie' ,10000, '2018-04-14');
INSERT INTO employees VALUES('10009', 'Wilma' ,11000, '2018-04-14');
INSERT INTO employees VALUES('10010', 'Betty' ,12000, '2018-04-14');

INSERT INTO addresses VALUES('10003','Ninja St', '40.Ave.','IST');
INSERT INTO addresses VALUES('10003','Kaya St', '50.Ave.','Ankara');
INSERT INTO addresses VALUES('10002','Stone St', '30.Ave.','Konya');

--Cannot add data to child table in referenced table
INSERT INTO addresses VALUES('10012','Stone St', '30.Ave.','Konya');

  
--FK accepts null
INSERT INTO addresses VALUES(NULL,'Stone St', '23.Ave.','Konya');
INSERT INTO addresses VALUES(NULL,'Stone St', '33.Ave.','Bursa');


SELECT * FROM employees;
SELECT * FROM addresses;
SELECT name FROM employees;

--14-WHERE Condition(condition)
--List employees from the employees table whose name is 'Donatello'.
SELECT * FROM employees WHERE name='Donatello';--

--List employees from the employees table whose salary is greater than 5000.
SELECT * FROM employees WHERE salary>5000;
--List only the names and salaries of employees whose salary is greater than 5000 from the employees table.
SELECT name,salary FROM employees WHERE salary>5000;
--Retrieve all data with sehir 'Konya' and adres_id 10002 from the addresses table
SELECT * FROM addresses WHERE city='Konya' AND address_id='10002';

--Retrieve the street and city information of addresses where the city is 'Konya' or 'Bursa'.
SELECT avenue,city FROM addresses WHERE city='Konya' OR city='Bursa';


--15-DELETE Command: delete data from a table that meets a condition-->DML


CREATE TABLE students1
(
id int,
name VARCHAR(50),
parent_name VARCHAR(50),
written_grade int       
);
INSERT INTO students1 VALUES(122, 'Kerem Can', 'Fatma',75);
INSERT INTO students1 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO students1 VALUES(124, 'Veli Han', 'Ayse',85);
INSERT INTO students1 VALUES(125, 'Kemal Tan', 'Hasan',85);
INSERT INTO students1 VALUES(126, 'Ahmet Ran', 'Ayse',95);
INSERT INTO students1 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO students1 VALUES(128, 'Mustafa Bak', 'Ali', 99);
INSERT INTO students1 VALUES(129, 'Mehmet Bak', 'Alihan', 89);

SELECT * FROM students1;

--Delete the record with id=124.
DELETE FROM students1 WHERE id=124;
--Delete the record with name 'Kemal Tan'.
DELETE FROM students1 WHERE name='Kemal Tan';
--Delete records with names 'Ahmet Ran' or 'Ali Can'.
DELETE FROM students1 WHERE name='Ahmet Ran' OR name='Ali Can';

--HOMEWORK--
--Delete the record with name Mustafa Bak and id 128.
--Delete records with ids 122, 125, or 126.
--Delete records with ids greater than 126.

--16-Delete all data in the table
--List all records from the students table.
SELECT * FROM students;

--Delete all records from the students table.
DELETE FROM students; --DELETE FROM deletes all records but does not delete the table.

--16-b--Delete all data in the table
--List all records from the doctors table.
SELECT * FROM doctors;

--Delete all records from the doctors table.
TRUNCATE TABLE doctors;--TRUNCATE TABLE ... WHERE cannot be used.
SELECT * FROM doctors;


--17-Delete data from parent-child relationship tables
SELECt * FROM employees;--referenced table,parent table
SELECt * FROM addresses;--child table

DELETE FROM employees;--does not delete as it is referenced by the addresses table
DELETE FROM employees WHERE id='10002';--does not delete as it is referenced by the addresses table

DELETE FROM addresses WHERE address_id='10002';--child 
DELETE FROM employees WHERE id='10002';--deletes as the relationship is broken.

DELETE FROM addresses;--CHILD
DELETE FROM employees;--allows deletion as the relationship is broken.

--18-on delete cascade: activate the gradual deletion process

CREATE TABLE students
(
id int primary key,  
name VARCHAR(50),
parent_name VARCHAR(50),
written_grade int
);--PARENT

CREATE TABLE grades( 
student_id int,
course_name varchar(30),
written_grade int,
CONSTRAINT grades_fk FOREIGN KEY (student_id) REFERENCES students(id)
on delete cascade--delete from child when parent data is deleted
);--CHILD

INSERT INTO students VALUES(122, 'Kerem Can', 'Fatma',75);
INSERT INTO students VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO students VALUES(124, 'Veli Han', 'Ayse',85);
INSERT INTO students VALUES(125, 'Kemal Tan', 'Hasan',85);
INSERT INTO students VALUES(126, 'Ahmet Ran', 'Ayse',95);
INSERT INTO students VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO students VALUES(128, 'Mustafa Bak', 'Ali', 99);
INSERT INTO students VALUES(129, 'Mehmet Bak', 'Alihan', 89);

INSERT INTO grades VALUES ('123','chemistry',75);
INSERT INTO grades VALUES ('124', 'physics',65);
INSERT INTO grades VALUES ('125', 'history',90);
INSERT INTO grades VALUES ('126', 'Mathematics',90);
INSERT INTO grades VALUES ('127', 'Mathematics',90);
INSERT INTO grades VALUES (null, 'history',90);

--Delete the record with id=123 from the grades table.

DELETE FROM grades WHERE student_id=123;--child
--Delete data from the child table, only the child is deleted

DELETE FROM students WHERE id=126;--parent
--If you delete data from the parent table, the child with the on delete cascade will be deleted.

DELETE FROM students;--deletes records in the parent as well as the referenced records

SELECT * FROM grades;
SELECT * FROM students;

--19-Delete table: Remove table from schema

--Delete the poets table.
DROP TABLE poets;--DDL

--Delete the students table.
DROP TABLE students;
DROP TABLE students CASCADE;--Allow the end and deletion of the relationship

SELECT * FROM students;
SELECT * FROM grades;

--Delete the students1 table.
DROP TABLE IF EXISTS students1;--to avoid errors

--20-IN CONDITION

CREATE TABLE customers (
    product_id int,  
    customer_name varchar(50),
    product_name varchar(50)
);
INSERT INTO customers VALUES (10, 'Mark', 'Orange');
INSERT INTO customers VALUES (10, 'Mark', 'Orange');
INSERT INTO customers VALUES (20, 'John', 'Apple');
INSERT INTO customers VALUES (30, 'Amy', 'Palm');
INSERT INTO customers VALUES (20, 'Mark', 'Apple');
INSERT INTO customers VALUES (10, 'Adem', 'Orange');
INSERT INTO customers VALUES (40, 'John', 'Apricot');
INSERT INTO customers VALUES (20, 'Eddie', 'Apple');

SELECT * FROM customers;

--Retrieve records from the customers table where product_name is 'Orange', 'Apple', or 'Apricot'.

SELECT * 
FROM customers 
WHERE product_name='Orange' OR product_name='Apple' OR product_name='Apricot' ;

--Alternative approach
SELECT * 
FROM customers 
WHERE product_name IN ('Orange','Apple','Apricot');


--Retrieve records from the customers table where product_name is not 'Orange', 'Apple', or 'Apricot'.

SELECT * 
FROM customers 
WHERE product_name NOT IN ('Orange','Apple','Apricot');


--21-BETWEEN ... AND ... COMMAND
--Retrieve all information from the customers table where product_id is between 20 and 40 (inclusive).
SELECT * 
FROM customers 
WHERE product_id BETWEEN 20 AND 40;

--Alternative approach
SELECT * 
FROM customers 
WHERE product_id >= 20 AND product_id <= 40;

--Retrieve all information from the customers table where product_id is less than 20 or greater than 40.
SELECT * 
FROM customers 
WHERE product_id < 20  OR product_id > 40;

--Alternative approach: NOT BETWEEN .. AND
SELECT * 
FROM customers 
WHERE product_id NOT BETWEEN 20 AND 40;

--22-AGGREGATE Functions

CREATE TABLE employees3 (
    id int, 
    name VARCHAR(50), 
    city VARCHAR(50), 
    salary int, 
    workplace VARCHAR(20)
);

INSERT INTO employees3 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO employees3 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO employees3 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO employees3 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO employees3 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO employees3 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO employees3 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE brands
(
    brand_id int, 
    brand_name VARCHAR(20), 
    employee_count int
);

INSERT INTO brands VALUES(100, 'Vakko', 12000);
INSERT INTO brands VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO brands VALUES(102, 'Adidas', 10000);
INSERT INTO brands VALUES(103, 'LCWaikiki', 21000);

SELECT * FROM brands;
SELECT * FROM employees3;

--Retrieve the maximum salary from the employees3 table.
SELECT MAX(salary) FROM employees3;

--Retrieve the minimum salary from the employees3 table.
SELECT MIN(salary) FROM employees3;

--Retrieve the total salary of all employees in the employees3 table.
SELECT SUM(salary) FROM employees3;

--Retrieve the average salary of all employees in the employees3 table.
SELECT AVG(salary) FROM employees3;
SELECT ROUND(AVG(salary),2) FROM employees3; --Show the result rounding the decimal part to 2

--Retrieve the count of all employees in the employees3 table.
SELECT COUNT(*) FROM employees3;

--Retrieve the count of employees whose salary is 2500 in the employees3 table.
SELECT COUNT(salary) FROM employees3 WHERE salary=2500;

--*ALIASES*: TEMPORARY LABELS FOR TABLES AND FIELDS

CREATE TABLE workers(
    employee_id char(9),
    employee_name varchar(50),
    birth_city varchar(50)
);

INSERT INTO workers VALUES(123456789, 'Ali Can', 'Istanbul'); 
INSERT INTO workers VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO workers VALUES(345678901, 'Mine Bulut', 'Izmir');

SELECT * FROM workers;

SELECT employee_id AS id ,employee_name AS name FROM workers;

SELECT employee_id AS id ,employee_name ||' '|| birth_city AS name_city FROM workers;

SELECT employee_id AS id ,employee_name AS name FROM workers AS workers;

--HOMEWORK
-----------------------
CREATE table staff
(
    id char(4),
    name varchar(50),
    salary int
);
insert into staff values('1001', 'Ali Can', 70000);
insert into staff values('1002', 'Veli Mert', 85000);
insert into staff values('1003', 'Ayşe Tan', 65000);
insert into staff values('1004', 'Derya Soylu', 95000);
insert into staff values('1005', 'Yavuz Bal', 80000);
insert into staff values('1006', 'Sena Beyaz', 100000);

--List employee information with id between 1003 and 1005
--List employee information between D and Y
--List employee information not between D and Y
--List the employee whose salary is 70000 and name is Sena
-----------------------
