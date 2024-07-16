 ------------------DAY'4-------------------
--23-SUBQUERY-NESTED QUERY
--23.a-SUBQUERIES: Usage with WHERE

SELECT * FROM employees3;
SELECT * FROM brands;

--List employees working at the brand with brand_id 100.

SELECT brand_name 
FROM brands 
WHERE brand_id=100; -- Vakko

SELECT * 
FROM employees3 
WHERE workplace='Vakko';

--Alternative approach

SELECT * 
FROM employees3 
WHERE workplace = (SELECT brand_name FROM brands WHERE brand_id=100);

--INTERVIEW QUESTION: List all fields of the employee with the highest salary in the employees3 table.
SELECT * 
FROM employees3
WHERE salary=(SELECT MAX(salary) FROM employees3);

--Interview Question: Show the second highest salary in the employees3 table. Homework
SELECT MAX(salary)
FROM employees3 
WHERE salary<(SELECT MAX(salary) FROM employees3);

--List employees with the second highest salary in the employees3 table.

SELECT * 
FROM employees3
WHERE salary=(SELECT MAX(salary)
              FROM employees3 
              WHERE salary<(SELECT MAX(salary) FROM employees3));


--List employees with either the maximum or minimum salary in the employees3 table.

SELECT * FROM employees3
WHERE salary=(SELECT MAX(salary) FROM employees3) OR salary=(SELECT MIN(salary) FROM employees3);

--Alternative approach
SELECT * FROM employees3
WHERE salary IN ((SELECT MAX(salary) FROM employees3),(SELECT MIN(salary) FROM employees3));

--List brand_ids and employee counts for brands with employees in Ankara.

SELECT brand_id, employee_count 
FROM brands
WHERE brand_name IN ('Vakko','Pierre Cardin','Adidas');

--Alternative approach

SELECT brand_id, employee_count 
FROM brands
WHERE brand_name IN (SELECT workplace FROM employees3 WHERE city='Ankara');

--List names, salaries, and cities of employees working at brands with a brand_id greater than 101.

SELECT name, salary, city
FROM employees3
WHERE workplace IN (SELECT brand_name FROM brands WHERE brand_id>101);


--List names, salaries, and workplaces of employees working at brands with more than 15,000 employees.

SELECT name, salary, workplace 
FROM employees3 
WHERE workplace IN (SELECT brand_name FROM brands WHERE employee_count>15000);


--23.b-SUBQUERIES: Usage after SELECT

-- Write a query that lists each brand's id, name, and total number of cities they are present in.

SELECT brand_id, brand_name, (SELECT COUNT(city) FROM employees3 WHERE workplace=brand_name) AS city_count --correlated subquery

FROM brands;

--DISTINCT command: Shows only distinct values
SELECT COUNT(DISTINCT city) FROM employees3; --4
SELECT COUNT(city) FROM employees3; --7

--Creating a VIEW
CREATE VIEW city_count_view AS
SELECT brand_id, brand_name, (SELECT COUNT(city) FROM employees3 WHERE workplace=brand_name) AS city_count --correlated subquery

FROM brands;

--Write a Query that lists each brand's name, number of employees, and maximum and minimum salaries of employees in that brand.

SELECT brand_name, employee_count, (SELECT MAX(salary) FROM employees3 WHERE workplace=brand_name) AS max_salary,
                                  (SELECT MIN(salary) FROM employees3 WHERE workplace=brand_name) AS min_salary

FROM brands;


--24.EXISTS Condition
/*
How does the WHERE clause work
SELECT * FROM table_name WHERE condition(T/F):field=value
SELECT * FROM brands WHERE brand_name='Adidas';
*/
--EXISTS
--Used to check if the result of a subquery is empty or not in a SQL query.
--If the subquery returns at least one row, the EXISTS condition is true and the rest of the query is executed.
--If the subquery returns no rows, the EXISTS condition is false.

CREATE TABLE march
(	
product_id int,	
customer_name varchar(50),
product_name varchar(50)
);

INSERT INTO march VALUES (10, 'Mark', 'Honda');
INSERT INTO march VALUES (20, 'John', 'Toyota');
INSERT INTO march VALUES (30, 'Amy', 'Ford');
INSERT INTO march VALUES (20, 'Mark', 'Toyota');
INSERT INTO march VALUES (10, 'Adam', 'Honda');
INSERT INTO march VALUES (40, 'John', 'Hyundai');
INSERT INTO march VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE april 
(	
product_id int ,
customer_name varchar(50),
product_name varchar(50)
);

INSERT INTO april VALUES (10, 'Hasan', 'Honda');
INSERT INTO april VALUES (10, 'Kemal', 'Honda');
INSERT INTO april VALUES (20, 'Ayse', 'Toyota');
INSERT INTO april VALUES (50, 'Yasar', 'Volvo');
INSERT INTO april VALUES (20, 'Mine', 'Toyota');

select * from march;
select * from april;

--List all products from April if 'Toyota' was sold in March.

SELECT * 
FROM april
WHERE EXISTS (SELECT product_name FROM march WHERE product_name='Toyota');

--If EXISTS returns False
--List all products from April if 'Volvo' was sold in March.

SELECT * 
FROM april
WHERE EXISTS (SELECT * FROM march WHERE product_name='Volvo');

--List product_id and customer_name from March that were sold in both March and April.

SELECT product_id, customer_name
FROM march
WHERE EXISTS (SELECT product_name FROM april WHERE april.product_name=march.product_name);


---List product names and customer names in both months for products sold in both months. HOMEWORK

SELECT product_name, customer_name
FROM april
WHERE EXISTS (SELECT product_name FROM march WHERE march.product_name=april.product_name);

--List product names and customer names in March that were not sold in April.

SELECT product_name, customer_name
FROM march m 
WHERE NOT EXISTS (SELECT product_name FROM april a WHERE a.product_name=m.product_name);

