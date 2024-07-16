--------------DAY'6---------------------
--28-GROUP BY clause: is used to group results according to one or more columns.

CREATE TABLE grocery_store
(
    name varchar(50),
    product_name varchar(50),
    product_quantity int
);

INSERT INTO grocery_store VALUES( 'Ali', 'Apple', 5);
INSERT INTO grocery_store VALUES( 'Ayse', 'Pear', 3);
INSERT INTO grocery_store VALUES( 'Veli', 'Apple', 2);  
INSERT INTO grocery_store VALUES( 'Hasan', 'Grape', 4);  
INSERT INTO grocery_store VALUES( 'Ali', 'Pear', 2);  
INSERT INTO grocery_store VALUES( 'Ayse', 'Apple', 3);  
INSERT INTO grocery_store VALUES( 'Veli', 'Grape', 5);  
INSERT INTO grocery_store VALUES( 'Ali', 'Pear', 2);  
INSERT INTO grocery_store VALUES( 'Veli', 'Apple', 3);  
INSERT INTO grocery_store VALUES( 'Ayse', 'Grape', 2);

SELECT * FROM grocery_store;

--Display the total product quantity for each name in the grocery store table.

SELECT name, SUM(product_quantity)
FROM grocery_store
GROUP BY name;

--Display the total product quantity for each name in the grocery store table.
--Order by total product quantity in descending order.

SELECT name, SUM(product_quantity) as total_product_quantity
FROM grocery_store
GROUP BY name
ORDER BY total_product_quantity DESC;

--Display the total quantity of each product purchased by each person, ordered by name.

SELECT name, product_name, SUM(product_quantity) as total_product_quantity
FROM grocery_store
GROUP BY name, product_name
ORDER BY name;

--!!! NOTE: When using the Group By command, after Select, only the field from Group By or aggregate function can be used.

SELECT name, product_name
FROM grocery_store
GROUP BY name, product_name
ORDER BY name;

SELECT name, SUM(product_quantity)
FROM grocery_store
GROUP BY name
ORDER BY name;

--Show the total number of customers who bought each product.

SELECT product_name, COUNT(DISTINCT name) as number_of_customers
FROM grocery_store
GROUP BY product_name;

--Find the total product quantity and the number of different products purchased by each name.

SELECT name, SUM(product_quantity) as total_product_quantity, COUNT(DISTINCT product_name) as number_of_types
FROM grocery_store
GROUP BY name;

--Display the number of customers by the amount of product purchased.
--Sort by number of customers in ascending order.

SELECT product_quantity, COUNT(DISTINCT name) as number_of_customers
FROM grocery_store
GROUP BY product_quantity
ORDER BY COUNT(DISTINCT name);

--29-HAVING clause: Used to specify conditions after Group By.

DROP TABLE personnel;

CREATE TABLE personnel  (
id int,
name varchar(50),
city varchar(50), 
salary int,  
company varchar(20)
);

INSERT INTO personnel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda'); 
INSERT INTO personnel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota'); 
INSERT INTO personnel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
INSERT INTO personnel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford'); 
INSERT INTO personnel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personnel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personnel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

SELECT * FROM personnel;

--Display the MIN salary of each company if it is greater than 4000.

SELECT company, MIN(salary)
FROM personnel
GROUP BY company
HAVING MIN(salary)>4000;

--Display the name and total salary of each person if their total salary is more than 10000.

SELECT name, SUM(salary)
FROM personnel
GROUP BY name
HAVING SUM(salary)>10000;

--If the number of employees (name) in a city is more than 1, display the city name and the number of employees.

SELECT city, COUNT(DISTINCT name) as number_of_personnel
FROM personnel
GROUP BY city
HAVING COUNT(DISTINCT name) >1;

--If the MAX salary in a city is less than 5000, display the city name and the MAX salary.

SELECT city, MAX(salary) as max_salary
FROM personnel
GROUP BY city
HAVING MAX(salary)<5000;

--30-UNION/UNION ALL operator:

--UNION: Combines the results of two different queries into one result set.
--Does not show duplicate data.
--UNION ALL: Shows duplicate data as well.

DROP TABLE developers;

CREATE TABLE developers(
id SERIAL PRIMARY KEY,
name varchar(50),
email varchar(50) UNIQUE,
salary real,
prog_lang varchar(20),
city varchar(50),
age int    
);

INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Yavuz Bey','yavuz@mail.com',4000,'Java','Ankara',28);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Emrah Bey','emrah@mail.com',5000,'JavaScript','Istanbul',35);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Ebru Hanım ','ebru@mail.com',5000,'Java','Izmır',38);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Kübra Hanım','kubra@mail.com',4000,'JavaScript','Istanbul',32);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Fazıl Bey','fazil@mail.com',6000,'Java','Izmır',25);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Musab Bey','musab@mail.com',6000,'Html','Istanbul',28);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Enes Bey','enes@mail.com',5500,'Css','Ankara',28);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Meryem Hanım','meryem@mail.com',5000,'Java','Bursa',32);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('İrfan Bey','irfan@mail.com',4500,'Html','Izmır',33);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Cemal Bey','cemal@mail.com',4500,'Css','Bursa',32);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Hüseyin Bey','huseyin@mail.com',7000,'C++','Konya',38);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Vehbi Bey','vehbi@mail.com',4000,'C#','Istanbul',30);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Belkıs Hanım','developer@mail.com',4000,'C#','Bursa',29);

CREATE TABLE contact_info(
address_id int,
street varchar(30),
number int,    
city varchar(30),
FOREIGN KEY(address_id) REFERENCES developers(id)    
);

INSERT INTO contact_info VALUES(1,'Kaya Sok.',5,'Bursa');
INSERT INTO contact_info VALUES(2,'Kaya Sok.',3,'Ankara');
INSERT INTO contact_info VALUES(3,'Can Sok.',10,'Bursa');
INSERT INTO contact_info VALUES(4,'Gül Sok.',12,'Ankara');
INSERT INTO contact_info VALUES(5,'Can Sok.',4,'Afyon');
INSERT INTO contact_info VALUES(6,'Taş Sok.',6,'Bolu');
INSERT INTO contact_info VALUES(7,'Dev Sok.',6,'Sivas');
INSERT INTO contact_info VALUES(8,'Dev Sok.',8,'Van');

SELECT * FROM developers;
SELECT * FROM contact_info;

/*Show the names of developers older than 25 and 
the programming languages used by developers younger than 30,
showing distinct results*/

SELECT name FROM developers WHERE age>25
UNION
SELECT prog_lang FROM developers WHERE age<30;

--Same query with duplicates.

SELECT name FROM developers WHERE age>25
UNION ALL
SELECT prog_lang FROM developers WHERE age<30;

/*Show the salary and programming language of developers using Java 
and the age and programming language of developers using JavaScript,
showing distinct results*/

SELECT salary as salary_age, prog_lang FROM developers WHERE prog_lang='Java'
UNION
SELECT age as salary_age, prog_lang FROM developers WHERE prog_lang='JavaScript';

--Display the city and salary of Java users and the name and age of those whose salary is more than 5000
--showing distinct results.--ASSIGNMENT

--Display the city and salary of the developer with id 8
--Show the city and door number in the communication address.

SELECT city as workplace_residence ,salary as door_number FROM developers WHERE id=8
UNION
SELECT city as workplace_residence ,number as door_number FROM contact_info WHERE address_id=8 

--List all cities in the developers table and all cities in the employees3 table
--distinctly

SELECT city FROM developers
UNION
SELECT sehir FROM employees3;

--31-INTERSECT OPERATOR: displays common results from two different queries.
--Shows only unique data.

--List common cities in the developers table and the cities in the employees3 table.

SELECT city FROM developers
INTERSECT
SELECT sehir FROM employees3;

--List common cities where developers use Java in the developers table and
--cities where salary in the employees3 table is more than 1000
--using.

SELECT city FROM developers WHERE prog_lang='Java'
INTERSECT
SELECT sehir FROM employees3 WHERE salary>1000;

--32-EXCEPT OPERATOR: Used to exclude the results of one query from the results of another query.

--List those from the developers table who are not in the employees3 table.

SELECT city FROM developers
EXCEPT
SELECT sehir FROM employees3;

--List those from the employees3 table who are not in the developers table.

SELECT sehir FROM employees3
EXCEPT
SELECT city FROM developers;

--List the ids of those whose salary is greater than 4000 in the developers table
--those not in the contact_info table.

SELECT id FROM developers WHERE salary>4000
EXCEPT
SELECT address_id FROM contact_info;

--ASSIGNMENT:list the names of all products in the march and april tables.
--ASSIGNMENT:list the names of common products in the march and april tables.
--ASSIGNMENT:list the names of products sold in march but not sold in april.
