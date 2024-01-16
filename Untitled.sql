show databases;

create database db_bc2311;

use db_bc2311;

CREATE USER 'SamuelLi'@'localhost' IDENTIFIED BY 'admin1234';

ALTER USER 'SamuelLi'@'localhost' IDENTIFIED BY 'admin1234';

GRANT CREATE,ALTER,DROP, INSERT ,UPDATE, DELETE , SELECT , REFERENCES, RELOAD on *.* TO 'SamuelLi'@'localhost' WITH GRANT OPTION;

SHOW VARIABLES LIKE 'validate_password%';

SET GLOBAL validate_password.policy = LOW;

create table Order(
id integer not null,
order_cust_name varchar(50) not null,
order_cust_phone varchar(50),
order_cust_phone varchar(50)
);


























