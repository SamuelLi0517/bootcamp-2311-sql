show databases;

 create database BOOTCAMP_EXERCISE1;

use BOOTCAMP_EXERCISE1;

create table regions(
id integer primary key,
region_name varchar(25)
);

DESCRIBE regions;
SHOW COLUMNS FROM regions;
delete from regions;


create table countries(
id char(2) primary key,
country_name varchar(40),
regions_id integer,
 CONSTRAINT fk_regions_id foreign key (regions_id) references regions(id)
);

select *  FROM countries;

create table locations(
 id integer primary key,
street_address varchar(25),
postal_code varchar(12),
city varchar(30),
state_province varchar(12),
country_id char(2),
foreign key (country_id) references countries (id)
);

DESCRIBE locations;
SHOW COLUMNS FROM locations;
delete from locations;

create table departments(
id integer primary key,
departments_name varchar(30),
manager_id integer,
locations_id integer,
foreign key (locations_id) references locations (id)
);

create table employees(
id integer primary key,
First_name varchar(20),
Last_name varchar(25),
email varchar(25),
phone_number varchar(20),
hire_date TIMESTAMP,
job_id varchar(10),
salary integer,
commission_pct integer,
manager_id integer,
departments_id integer,
foreign key (departments_id) references departments (id)
);

create table jobs(
id varchar(10) primary key,
jobs_title varchar(35),
min_salary integer,
max_salary integer
);


create table job_history(
employees_id integer,
start_date date ,
primary key (employees_id,start_date),
end_date date,
jobs_id varchar(10),
departments_id integer,
foreign key (jobs_id) references jobs (id),
foreign key (departments_id) references departments (id)
);

drop table job_history;
drop table jobs;
drop table employees;
drop table departments;
drop table locations;
drop table countries;
drop table regions;

delete from regions;
delete from countries;
delete from locations;
delete from departments;
delete from employees;
delete from jobs;
delete from job_history;

insert into regions values(1, 'MK');
insert into regions values(2, 'HK');
insert into regions values(3, 'CS');

insert into countries values ('DE', 'Germany', 1);
insert into countries values ('IT', 'Italy', 1);
insert into countries values ('JP', 'Japan', 3);
insert into countries values ('US', 'United State', 2);

insert into locations(id, street_address, postal_code, city, country_id) 
values (1000, '1297 Via Cola di Rie', '989', 'Roma', 'IT');
insert into locations(id, street_address, postal_code, city, country_id)
values (1100, '93091 Calle della Te', '10934', 'Venice', 'IT');
insert into locations(id, street_address, postal_code, city, state_province) 
values (1200, '2017 Shinjuku-ku', '1689', 'Tokyo', 'Tokyo JP');
insert into locations(id, street_address, postal_code, city, state_province,country_id)
values (1400, 'Jabberwocky RD', '26192', 'Southlake', 'Texas', 'US');

insert into departments values (10, 'Administration', 200, 1100);
insert into departments values (20, 'Marketing', 201, 1200);
insert into departments values (30, 'Purchasing', 202, 1400);

insert into employees values (100, 'Steven', 'King', 'SKING', '515-1234567', str_to_date('1987-06-17', '%Y-%m-%d'), 
'ST_CLERK', 24000.00, 0.00, 109, 10);
insert into employees values (101, 'Neena', 'Kochhar', 'NKOCHHAR', '515-1234568', str_to_date('1987-06-18', '%Y-%m-%d'), 
'MK_REP', 17000.00, 0.00, 103, 20);
insert into employees values (102, 'Lex', 'De Haan', 'LDEHAAN', '515-1234569', str_to_date('1987-06-19', '%Y-%m-%d'), 
'IT_PROG', 17000.00, 0.00, 108, 30);
insert into employees values (103, 'Alexander', 'Hunold', 'AHUNOLD', '590-4234567', str_to_date('1987-06-20', '%Y-%m-%d'), 
'MK_REP', 9000.00, 0.00, 105, 20);

insert into jobs(id, jobs_title, min_salary, max_salary)values('1', 'PM', 18000.00, 24000.00);
insert into jobs(id, jobs_title, min_salary, max_salary)values('2', 'SALE', 15000.00, 20000.00);
insert into jobs(id, jobs_title, min_salary, max_salary)values('3', 'CFO', 25000.00, 30000.00);

insert into job_history values (102, str_to_date('1993-01-13', '%Y-%m-%d'), str_to_date('1998-07-24', '%Y-%m-%d'), '1', 20);
insert into job_history values (101, str_to_date('1989-09-21', '%Y-%m-%d'), str_to_date('1993-10-27', '%Y-%m-%d'), '2', 10);
insert into job_history values (101, str_to_date('1993-10-28', '%Y-%m-%d'), str_to_date('1997-03-15', '%Y-%m-%d'), '2', 30);
insert into job_history values (100, str_to_date('1996-02-17', '%Y-%m-%d'), str_to_date('1999-12-19', '%Y-%m-%d'), '3', 30);
insert into job_history values (103, str_to_date('1998-03-24', '%Y-%m-%d'), str_to_date('1999-12-31', '%Y-%m-%d'), '1', 20);

select * from regions;
select * from countries;
select * from locations;
select * from departments;
select * from employees;
select * from jobs;
select * from job_history;
























