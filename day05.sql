------------DAY'5-----------------
--25-UPDATE COMMAND: Updating Data

SELECT * FROM employees3;

SELECT * FROM brands;

--SYNTAX: UPDATE table_name SET column_name=new_value, column2=new_value2 WHERE condition

--Update the workplace of the employee with id 123456789 to 'Trendyol'.
UPDATE employees3
SET workplace='Trendyol'
WHERE id=123456789;

--Update the name to 'Veli Yıldırım' and city to 'Bursa' for the employee with id 567890123.
UPDATE employees3
SET name='Veli Yıldırım', city='Bursa'
WHERE id=567890123;

--Multiply the brand_id of brands table by 2 for those with a marka_id value greater than or equal to 102.
UPDATE brands
SET brand_id=brand_id*2
WHERE brand_id>=102;

--Update the employee_count of all brands in the brands table by adding the marka_id value.
UPDATE brands 
SET employee_count=employee_count+brand_id;

--Update the workplace of 'Ali Seker' in the employees3 table to the workplace name of 'Veli Yıldırım'.
UPDATE employees3
SET workplace=(SELECT workplace FROM employees3 WHERE name='Veli Yıldırım')
WHERE name='Ali Seker';

--Update the workplace of employees in the employees3 table with a salary of 1500 to the name of the brand in the brands table with more than 20000 employee_count.
UPDATE employees3
SET workplace=(SELECT brand_name FROM brands WHERE employee_count>20000 )
WHERE salary=1500;

--Append ' Branch' to the city information of employees whose workplace is 'Vakko' in the employees3 table.
UPDATE employees3
SET city=city || ' Branch'
WHERE workplace='Vakko';

SELECT * FROM employees3;

SELECT * FROM brands;

--26-IS NULL Condition

CREATE TABLE people
(
ssn char(9),
name varchar(50),
address varchar(50)
);
INSERT INTO people VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO people VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO people VALUES(345678901, 'Mine Bulut', 'Izmir');
INSERT INTO people (ssn, address) VALUES(456789012, 'Bursa');
INSERT INTO people (ssn, address) VALUES(567890123, 'Denizli');
INSERT INTO people (ssn, name) VALUES(567890123, 'Veli Han');

SELECT * FROM people;

--List values where the name column is NULL in the people table.
SELECT * 
FROM people
WHERE name IS NULL;

--List values where the name column is not NULL in the people table.
SELECT * 
FROM people
WHERE name IS NOT NULL;

--Update the name column to 'MISSING...' where it is NULL in the people table.
UPDATE people
SET name='MISSING...'
WHERE name IS NULL;

--Update the address column to 'MISSING...' where it is NULL in the people table.
UPDATE people
SET address='MISSING...'
WHERE address IS NULL;

SELECT * FROM people;


--27-ORDER BY Command: Orders records by a specified field, defaults to NATURAL (ascending order).

CREATE TABLE person
(
ssn char(9),
first_name varchar(50),
last_name varchar(50),  
address varchar(50)
);

INSERT INTO person VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO person VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO person VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO person VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO person VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO person VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

SELECT * FROM person;

--List records from the person table ordered by address.
SELECT * 
FROM person
ORDER BY address ASC;

--List people with the name 'Mine' ordered by last_name in descending order.
SELECT * 
FROM person
WHERE first_name='Mine'
ORDER BY last_name DESC;

--List people with the last_name 'Bulut' ordered by first_name in ascending order.
SELECT * 
FROM person
WHERE last_name='Bulut'
ORDER BY first_name;

--List all records where last_name is 'Bulut' ordered by first column.
SELECT * 
FROM person
WHERE last_name='Bulut'
ORDER BY 2; --not recommended

--List all records from person table ordered by SSN number in descending order.
SELECT * 
FROM person
ORDER BY ssn DESC;

--List all records from person table ordered by first_name in ascending order and last_name in descending order.

SELECT * 
FROM person
ORDER BY first_name ASC, last_name DESC;

--List first_name and last_name ordered by the length of last_name.

SELECT first_name, last_name, LENGTH(last_name) AS last_name_length
FROM person
ORDER BY LENGTH(last_name);

--List first_name and last_name, with total length of both names sorted by total length.

SELECT CONCAT(first_name,' ',last_name) AS full_name, LENGTH(first_name)+LENGTH(last_name) AS total_length
FROM person
ORDER BY total_length;




