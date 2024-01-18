show databases;

 create database ORG;

use ORG;

drop table product;
drop table customer;
drop table invoice;
drop table invoice_item;
truncate table product;
truncate table customer;
truncate table invoice;
truncate table invoice_item;

create table product(
id integer not null primary key auto_increment,
sku varchar(32),
product_name varchar(128),
product_description text,
current_price decimal(8, 2),
quantity_in_stock integer
);

create table customer(
id integer not null primary key auto_increment,
customer_name varchar(255),
city_id integer,
customer_address varchar(255),
contact_person varchar(255),
email varchar(128),
phone varchar(128)
);

select * from customer;
create table invoice(
id integer not null primary key auto_increment,
invoice_number varchar(255),
customer_id integer,
user_account_id integer,
total_price decimal(8, 2),
time_issued timestamp,
time_due timestamp,
time_paid timestamp,
time_canceled timestamp,
time_refunded timestamp,
foreign key (customer_id) references customer(id)
);

create table invoice_item(
id integer not null primary key auto_increment,
invoice_id integer,
product_id integer,
quantity integer,
price decimal(8, 2),
line_total_price decimal(8, 2),
foreign key (invoice_id) references invoice(id),
foreign key (product_id) references product(id)
);


select * from product;

DELETE FROM PRODUCT;

INSERT INTO PRODUCT (sku, product_name, product_description, current_price, quantity_in_stock) VALUES 
('330120', '9UP PRODUCT', 'COMPLETELY 9UP', 60.00, 122);
 INSERT INTO PRODUCT (sku, product_name, product_description, current_price, quantity_in_stock) VALUES
 ('330121', 'UPPER PRODUCT', 'COMPLETELY 9UPPER', 50.00, 50);
 INSERT INTO PRODUCT (sku, product_name, product_description, current_price, quantity_in_stock)VALUES
('330122', '9UPPER PRODUCTS', 'SUPER 9UPPER', 40, 600);
 INSERT INTO PRODUCT (sku, product_name, product_description, current_price, quantity_in_stock)VALUES
 ('330123', '9UPPER PRODUCTSS', 'SUPER COMPLETELY 9UPPER', 30, 500);
 
 DELETE FROM CUSTOMER;
 INSERT INTO CUSTOMER (customer_name, city_id, customer_address, contact_person, email, phone)VALUES
 ('Drogerie Wien', 1, 'Deckergasse 15A', 'Emil Steinbach', 'abc@gmail.com', 12345678);
 INSERT INTO CUSTOMER (customer_name, city_id, customer_address, contact_person, email, phone)VALUES
 ('John', 4, 'Deckergasse 1A', 'upper', 'abck@gmail.com', 12345567);
 INSERT INTO CUSTOMER (customer_name, city_id, customer_address, contact_person, email, phone)VALUES
 ('Mary', 8, 'Deckergasse 18A', 'upper', 'abcd@gmail.com', 1234556789);

 DELETE FROM INVOICE;
 INSERT INTO INVOICE (invoice_number, customer_id, user_account_id, total_price, time_issued, time_due, time_paid, time_canceled, time_refunded)VALUES
 (123456780, 2, 41, 1423, NULL, NULL, NULL, NULL, NULL);
 INSERT INTO INVOICE (invoice_number, customer_id, user_account_id, total_price, time_issued, time_due, time_paid, time_canceled, time_refunded)VALUES
 (123456780, 3, 42, 1400, NULL, NULL, NULL, NULL, NULL);
 INSERT INTO INVOICE (invoice_number, customer_id, user_account_id, total_price, time_issued, time_due, time_paid, time_canceled, time_refunded)VALUES
(12345678, 2, 43, 17000, NULL, NULL, NULL, NULL, NULL);

DELETE FROM INVOICE_ITEM;
INSERT INTO INVOICE_ITEM (invoice_id, product_id, quantity, price, line_total_price)VALUES
(1, 1, 40, 23, 920);
INSERT INTO INVOICE_ITEM (invoice_id, product_id, quantity, price, line_total_price)VALUES
(1, 2, 4, 20, 80);
INSERT INTO INVOICE_ITEM (invoice_id, product_id, quantity, price, line_total_price)VALUES
(1, 3, 4, 10, 40);
INSERT INTO INVOICE_ITEM (invoice_id, product_id, quantity, price, line_total_price)VALUES
(1, 2, 4, 30, 120);

select * from INVOICE;
select * from INVOICE_ITEM;
select * from CUSTOMER;
select * from PRODUCT;

-- Question 1C
-- Query for customers without invoices
SELECT 'customer' AS type, id AS customer_id, customer_name
FROM customer
WHERE id NOT IN (SELECT DISTINCT customer_id FROM invoice)
UNION
-- Query for products without invoices
SELECT 'product' AS type, id AS product_id, product_name
FROM product
WHERE id NOT IN (SELECT DISTINCT product_id FROM invoice_item);

-- Question 2
truncate table EMPLOYEE;
drop table EMPLOYEE;
CREATE TABLE EMPLOYEE (
ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
EMPLOYEE_NAME VARCHAR (30) NOT NULL, 
SALARY NUMERIC (8,2),
PHONE NUMERIC (15),
EMAIL VARCHAR (50),
DEPT_ID INTEGER NOT NULL
);

truncate table DEPARTMENT;
  DROP TABLE DEPARTMENT;
 CREATE TABLE DEPARTMENT (
ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
DEPT_CODE VARCHAR (3) NOT NULL,
DEPT_NAME VARCHAR(200) NOT NULL
);

-- Question 2a
DELETE FROM EMPLOYEE;
 INSERT INTO EMPLOYEE(EMPLOYEE_NAME, SALARY, PHONE, EMAIL, DEPT_ID) VALUES ('JOHN', 20000, 90234567, 'JOHN@GMAIL.COM', 1);
 INSERT INTO EMPLOYEE (EMPLOYEE_NAME, SALARY, PHONE, EMAIL, DEPT_ID) VALUES ('MARY', 10000, 90234561, 'MARY@GMAIL.COM', 1);
 INSERT INTO EMPLOYEE (EMPLOYEE_NAME, SALARY, PHONE, EMAIL, DEPT_ID) VALUES ('STEVE', 30000, 90234562, 'STEVE@GMAIL.COM', 3);
 INSERT INTO EMPLOYEE (EMPLOYEE_NAME, SALARY, PHONE, EMAIL, DEPT_ID) VALUES ('SUNNY', 40000, 9234563, 'SUNNY@GMAIL.COM', 4);

 DELETE FROM DEPARTMENT;
 INSERT INTO DEPARTMENT(DEPT_CODE, DEPT_NAME) VALUES ('HR', 'HUMAN RESOURCES');
 INSERT INTO DEPARTMENT(DEPT_CODE, DEPT_NAME) VALUES ('9UP', '9UP DEPARTMENT');
 INSERT INTO DEPARTMENT(DEPT_CODE, DEPT_NAME) VALUES ('SA', 'SALES DEPARTMENT');
 INSERT INTO DEPARTMENT(DEPT_CODE, DEPT_NAME) VALUES ('IT', 'INFORMATION TECHANOLOGY DEPARTMENT');
 
 select * from EMPLOYEE;
  select * from DEPARTMENT;
 -- Question 2a
SELECT d.DEPT_CODE, COUNT(e.ID) AS num_employees
FROM DEPARTMENT d
LEFT JOIN EMPLOYEE e ON d.ID = e.DEPT_ID
GROUP BY d.DEPT_CODE
ORDER BY num_employees DESC, d.DEPT_CODE ASC;

-- Question 2B
INSERT INTO DEPARTMENT (DEPT_CODE, DEPT_NAME) VALUES('IT', 'INFORMATION TECHNOLOGY DEPARTMENT');
DELETE FROM DEPARTMENT WHERE ID = 5;

-- Yes, because have not a foreign key 












