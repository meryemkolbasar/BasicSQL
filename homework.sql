-- 1. Step --
CREATE TABLE customer(
	  customer_no int,
      name varchar(50) NOT NULL CHECK(name <> ''),
      age int CHECK(age > 18),
      gender char(1),
      income real,
      occupation varchar(20),
      city varchar(20),
	  constraint customer_pk PRIMARY KEY(customer_no)
);

SELECT * FROM customer;

-- 2/3. Step --

INSERT INTO customer VALUES (100, 'ALİ', 35, 'M', 2500, 'ENGINEER', 'ISTANBUL');
INSERT INTO customer VALUES (101, 'BURAK', 25, 'M', 3500, 'ARCHITECT', 'IZMIR');
INSERT INTO customer VALUES (102, 'CEYHUN', 45, 'M', 2000, 'ENGINEER', 'ANKARA');
INSERT INTO customer VALUES (103, 'DEMET', 30, 'F', 3000, 'TEACHER', 'ANKARA');
INSERT INTO customer VALUES (104, 'FERHAT', 40, 'M', 2500, 'ARCHITECT', 'IZMIR');
INSERT INTO customer VALUES (105, 'GALİP', 55, 'M', 4000, 'TEACHER', 'ISTANBUL');
INSERT INTO customer VALUES (106, 'KÖKSAL', 25, 'M', 2000, 'LAWYER', 'IZMIR');
INSERT INTO customer VALUES (107, 'LEYLA', 60, 'F', 2500, 'ARCHITECT', 'ISTANBUL');
INSERT INTO customer VALUES (108, 'MELEK', 30, 'F', 2500, 'TEACHER', 'ISTANBUL');
INSERT INTO customer VALUES (109, 'JALE', 40, 'F', 6000, 'BUSINESSMAN', 'ANKARA');
INSERT INTO customer VALUES (110, 'TEKİN', 45, 'M', 2000, 'LAWYER', 'ANKARA');
INSERT INTO customer VALUES (111, 'SAMET', 20, 'M', 3000, 'ARCHITECT', 'ISTANBUL');
INSERT INTO customer VALUES (112, 'ŞULE', 20, 'F', 4500, 'TEACHER', 'ISTANBUL');
INSERT INTO customer VALUES (113, 'VELİ', 40, 'M', 2500, 'TEACHER', 'IZMIR');
INSERT INTO customer VALUES (114, 'ZEYNEP', 50, 'F', 3500, 'PLUMBER', 'IZMIR');
INSERT INTO customer VALUES (115, 'ARDA', 55, 'M', 2000, 'HAIRDRESSER', 'IZMIR');
INSERT INTO customer VALUES (116, 'MELİS', 30, 'F', 3000, 'HAIRDRESSER', 'ANKARA');

-- 4. Step --

SELECT * FROM customer;

-- 5. Step --

SELECT name, occupation FROM customer;

-- 6. Step --

CREATE TABLE cities(
	area_code int PRIMARY KEY,
	name varchar(30) NOT NULL,
	population real
);

-- 7. Step --

CREATE TABLE suppliers3 (
	supplier_id int PRIMARY KEY,
	supplier_name varchar(20),
	contact_name varchar(20) UNIQUE
);

CREATE TABLE products (
	supplier_id int,
	product_id int,
	CONSTRAINT id_pk FOREIGN KEY (supplier_id) REFERENCES suppliers3(supplier_id)
);

SELECT * FROM products;
