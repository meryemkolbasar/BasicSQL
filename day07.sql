--------------DAY'7---------------------
--JOINS--JOINS
--JOIN: allows the combination of columns from one or more tables based on a common column (typically PK and FK) in related tables.

--NOTE: With UNION, we combine the results of queries.
   --  With JOIN, we combine columns from one or more tables.

CREATE TABLE companies (
company_id int,  
company_name varchar(20)
);
INSERT INTO companies VALUES(100, 'IBM');
INSERT INTO companies VALUES(101, 'GOOGLE');
INSERT INTO companies VALUES(102, 'MICROSOFT');
INSERT INTO companies VALUES(103, 'APPLE');

CREATE TABLE orders (
order_id int,
company_id int,
order_date date
);
INSERT INTO orders VALUES(11, 101, '2023-02-17');  
INSERT INTO orders VALUES(22, 102, '2023-02-18');  
INSERT INTO orders VALUES(33, 103, '2023-01-19');  
INSERT INTO orders VALUES(44, 104, '2023-01-20');  
INSERT INTO orders VALUES(55, 105, '2022-12-21');

--32-INNER JOIN: shows the common values in the column we base it on.

--List the company id, company name, order date, and order id of those whose company id is the same in both tables.

SELECT companies.company_id, company_name, order_date, order_id
FROM companies
INNER JOIN orders
ON companies.company_id=orders.company_id

SELECT companies.company_id, company_name, order_date, order_id
FROM orders
INNER JOIN companies
ON companies.company_id=orders.company_id

--NOTE: The order of the tables does not matter in INNER JOIN.

--33-LEFT JOIN: retrieves all records from the left (first) table.
   -RIGHT JOIN: retrieves all records from the right (second) table.
   
--List the company id, company name, order date, and order id of all records in the companies table. 
   
SELECT companies.company_id, company_name, order_id, order_date
FROM companies LEFT JOIN orders   
ON companies.company_id=orders.company_id;
   
--List the company id, company name, order date, and order id of all records in the orders table.     
   
SELECT orders.company_id, company_name, order_id, order_date
FROM companies RIGHT JOIN orders   
ON companies.company_id=orders.company_id; 

SELECT orders.company_id, company_name, order_id, order_date
FROM orders LEFT JOIN companies  
ON companies.company_id=orders.company_id;

--NOTE: By changing the order of the tables, LEFT JOIN can be used instead of RIGHT JOIN.

--34-FULL JOIN: shows all records in the joined tables without duplication.

--List the company id, company name, order date, and order id of all records in both tables. 

SELECT orders.company_id AS orders_tbl_id, companies.company_id AS companies_tbl_id, company_name, order_id, order_date
FROM orders FULL JOIN companies  
ON companies.company_id=orders.company_id;

--35-SELF JOIN: INNER JOIN within the same table based on a column.

CREATE TABLE employees (
id int,
name varchar(20),  
title varchar(60), 
manager_id int
);
INSERT INTO employees VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO employees VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO employees VALUES(3, 'Ayse Gul', 'QA Lead', 4);  
INSERT INTO employees VALUES(4, 'Fatma Can', 'CEO', 5);

--Create a query that displays the name of each employee alongside their manager's name.

SELECT e.name employee_name, m.name manager_name
FROM employees e
INNER JOIN employees m
ON e.manager_id=m.id;

--36-LIKE Condition: Used after the WHERE command
--Allows us to use a specific character pattern (pattern) in queries.

--ILIKE: Works the same as LIKE, case-INSENSITIVE  

SELECT * FROM developers;
SELECT * FROM developers WHERE name='Emrah Bey';

--wildcard % --> Represents 0 or more characters.

--List all information of developers whose name starts with the letter E.

SELECT *
FROM developers
WHERE name LIKE 'E%';

--Write a QUERY that lists the names and cities of developers working in cities ending with the letter 'a'.

SELECT name, city
FROM developers
WHERE city LIKE '%a';--Does not show ANKARA.

SELECT name, city
FROM developers
WHERE city ILIKE '%a';--Shows ANKARA.

--Write a QUERY that lists the names and salaries of developers whose name starts with E and ends with y.
SELECT name, salary
FROM developers
WHERE name ILIKE 'E%y';--Shows ey

--Write a QUERY that lists the names and salaries of developers whose name contains 'an'.

SELECT name, salary
FROM developers
WHERE name ILIKE '%an%';

SELECT name, salary
FROM developers
WHERE name ~~* '%an%';

--LIKE: ~~
--ILIKE: ~~*

--Write a QUERY that lists all the information of developers whose name contains both 'e' and 'a'.

SELECT *
FROM developers
WHERE name ILIKE '%e%a%' OR name ILIKE '%a%e%';--hande, kemal, hANDe

--LIKE does not show hAnde data.

SELECT *
FROM developers
WHERE name ILIKE '%e%' AND name ILIKE '%a%';--hande, kemal

-- underscore _: Represents only a single character.

--Write a QUERY that lists all information of developers whose second letter in their name is 'ü'.

SELECT *
FROM developers
WHERE name ILIKE '_ü%';

--Write a QUERY that lists all information of developers whose programming language is 4 letters long and whose third letter is 'v'.

SELECT *
FROM developers
WHERE prog_lang ILIKE '__v_';

--Write a QUERY that lists all information of developers whose programming language is at least 5 letters long and whose first letter is J. (ASSIGNMENT: Only JavaScript will be in the results)
--Write a QUERY that lists all information of developers whose second letter is 'e' and fourth letter is 'y'. (ASSIGNMENT)
--Write a QUERY that lists all information of developers whose name contains a space. (ASSIGNMENT)

--REGEXP_LIKE (~): Allows us to use regex to view data containing a specific pattern (regex).

CREATE TABLE words
( 
  word_id int UNIQUE,
  word varchar(50) NOT NULL,
  number_of_letters int
);

INSERT INTO words VALUES (1001, 'hot', 3);
INSERT INTO words VALUES (1002, 'hat', 3);
INSERT INTO words VALUES (1003, 'Hit', 3);
INSERT INTO words VALUES (1004, 'hbt', 3);
INSERT INTO words VALUES (1008, 'hct', 3);
INSERT INTO words VALUES (1005, 'adem', 4);
INSERT INTO words VALUES (1006, 'selim', 6);
INSERT INTO words VALUES (1007, 'yusuf', 5);
INSERT INTO words VALUES (1009, 'hAt', 3);
INSERT INTO words VALUES (1010, 'yaf', 5);
INSERT INTO words VALUES (1011, 'ahata', 3);

SELECT * FROM words;

--[]: Contains at least one of the letters inside.

--Write a QUERY that lists all information of words containing 'a' or 'i' after the letter 'h' and then the letter 't'.

SELECT * 
FROM words
WHERE word ~ 'h[ai]t';--Shows hat, hit. Does not show hbt, hait, haat, ht.

--No case sensitivity.

SELECT * 
FROM words
WHERE word ~* 'h[ai]t';

--[-]: Contains at least one of the letters between two letters.

--Write a QUERY that lists all information of words containing a letter between 'a' and 'k' after the letter 'h' and then the letter 't'.
--Example: hkt, ahbt

SELECT * 
FROM words
WHERE word ~* 'h[a-k]t';--Does not show habt.

--Write a QUERY that lists all information of words containing 'm' or 'i'.
--Example: absdsamasdas, asdiasd

SELECT * 
FROM words
WHERE word ~* '[mi]';

-^: Indicates the beginning, $: Indicates the end.

--Write a QUERY that lists all information of words starting with 'a' or 's'.

SELECT * 
FROM words
WHERE word ~* '^[as]';

--Write a QUERY that lists all information of words ending with 'm' or 'f'.

SELECT * 
FROM words
WHERE word ~* '[mf]$';
