--------------DAY'8---------------------
--------Review------------

--LIKE/ILIKE:%,_
--regexp_like:~/~*
--[],[-],^,$
-- .* => 0 or more characters
--  . => single character
-36-continue:regexp_like

--Query to select all information of words starting with 'y' and ending with 'f':

SELECT *
FROM words
WHERE word ~* '^y.*f$';

SELECT *
FROM words
WHERE word ~* '^y(.*)f$';

--NOT LIKE: Retrieve records that do not match the given pattern.
-- !~ :Retrieve records that do not match the given regex pattern.

-- Query to select all information of words where the first letter is not 'h' or 'H':

SELECT *
FROM words
WHERE word NOT ILIKE 'h%';


SELECT *
FROM words
WHERE word !~* '^h';

--Homework: Write a query to select all information of words where the second letter is not 'e', 'i', or 'o'.

-37-String functions

--Add 'Developer ' prefix to all names in the developers table:

UPDATE developers
SET name = concat('Developer ', name);

--Display all names in uppercase from the developers table:
SELECT UPPER(name)
FROM developers;

--Display all names in lowercase from the developers table:
SELECT LOWER(name)
FROM developers;

--Display all words in the words table with the first letter in uppercase and the rest in lowercase:

SELECT INITCAP(word)
FROM words;

--List the first 3 characters of each name in the developers table:

SELECT name, SUBSTRING(name, 1, 3)
FROM developers;

--List the names and their lengths from the developers table:

SELECT name, LENGTH(name)
FROM developers;

/*
-38.FETCH NEXT n ROW ONLY: displays only the first n rows
    LIMIT n: displays only the first n rows
    OFFSET n: skips the first n rows and displays the rest 
*/

--Retrieve the first 3 records from the developers table in the order they were inserted:
SELECT * 
FROM developers
FETCH NEXT 3 ROW ONLY;

SELECT * 
FROM developers
LIMIT 3;

--Retrieve the first 3 records after skipping the first 2 records from the developers table:

SELECT * 
FROM developers
OFFSET 2 ROW
FETCH NEXT 3 ROW ONLY;

SELECT * 
FROM developers
OFFSET 2 ROW
LIMIT 3;

--Retrieve the first 3 records with the lowest salary from the developers table:

SELECT * 
FROM developers
ORDER BY salary ASC
LIMIT 3;

--Homework: Retrieve all information of the developer with the second highest salary from the developers table:

SELECT * 
FROM developers
ORDER BY salary DESC
OFFSET 1 
LIMIT 1;
		
-39-ALTER TABLE: used to update the table -> DDL
add column ==> adds a new column
drop column ==> deletes an existing column
rename column.. to.. ==> renames a column
rename.. to.. ==> renames a table

SYNTAX: ALTER TABLE table_name ADD COLUMN column_name data_type

--Add a new column named 'age' (int) to the 'employees' table:
ALTER TABLE employees
ADD COLUMN age int;

--Add a new column named 'remote' (boolean) to the 'employees' table:

ALTER TABLE employees
ADD COLUMN remote boolean;

--Add a new column named 'prog_lang' (varchar) with a default value of 'java' to the 'employees' table:

ALTER TABLE employees
ADD COLUMN prog_lang varchar(20) DEFAULT 'java';

--Delete the 'age' column from the 'employees' table:

ALTER TABLE employees
DROP COLUMN age;

--Rename the 'salary' column to 'income' in the 'employees' table:

ALTER TABLE employees
RENAME COLUMN salary TO income;

--Rename the 'employees' table to 'employees':

ALTER TABLE employees RENAME TO employees; 

--Update the data type of the 'income' column to real in the 'employees' table:

ALTER TABLE employees
ALTER COLUMN income TYPE real; 

--Update the data type of the 'id' column to varchar in the 'employees' table:

ALTER TABLE employees
ALTER COLUMN id TYPE VARCHAR(20);

--Update the data type of the 'id' column to int in the 'employees' table:

ALTER TABLE employees
ALTER COLUMN id TYPE int USING id::integer; --forcing conversion due to lack of automatic casting

--Add a NOT NULL constraint to the 'name' column in the 'employees' table:

ALTER TABLE employees
ALTER COLUMN name SET NOT NULL;

INSERT INTO employees(city) VALUES('Bursa'); --name cannot be null
INSERT INTO employees(name, city) VALUES('Jack Sparrow', 'Bursa');

--NOTE: To add constraints such as NOT NULL, PK, or UNIQUE, the existing records in that column must satisfy the constraint first.  

--Add a PRIMARY KEY constraint to the 'id' column in the 'employees' table:

UPDATE employees
SET id = 1
WHERE id = 456789012 and name = 'Veli Yilmaz';

UPDATE employees
SET id = 2
WHERE id IS NULL;

ALTER TABLE employees
ADD PRIMARY KEY(id);

/*
ALTER TABLE employees
ADD UNIQUE(name);

ALTER TABLE employees
ADD FOREIGN KEY(id) REFERENCES other_table(PK_column);
*/

--SYNTAX: ALTER TABLE table_name ADD constraint_name(column_name)

SELECT * FROM employees;

-40-TRANSACTION-ROLLBACK
--TRANSACTION: The smallest unit of work in a database
--BEGIN: starts a transaction
--COMMIT: commits the transaction, making changes permanent

BEGIN;
CREATE TABLE accounts
(
account_no int UNIQUE,
name VARCHAR(50),
balance real       
);
COMMIT;

BEGIN;
INSERT INTO accounts VALUES(1234, 'Harry Potter', 5500.3);
INSERT INTO accounts VALUES(5678, 'Jack Sparrow', 8500.5);

savepoint x; --sets a savepoint to revert back to in case of an error

UPDATE accounts SET balance = balance - 1000 WHERE account_no = 1234;
--AN ERROR OCCURRED, the operation was incomplete
ROLLBACK TO x;
UPDATE accounts SET balance = balance + 1000 WHERE account_no = 5678;

UPDATE accounts SET balance = balance - 1000 WHERE account_no = 1234;
UPDATE accounts SET balance = balance + 1000 WHERE account_no = 5678;
--the transfer operation was successful
COMMIT;

SELECT * FROM accounts;
