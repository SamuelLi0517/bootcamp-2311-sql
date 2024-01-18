show databases;

 create database ORG;

use ORG;

drop table worker;
drop table bonus;

create table worker (
worker_id integer not null primary key auto_increment,
first_name char(25),
last_name char(25),
salary numeric(15),
joining_date datetime,
department char(25)
);

create table bonus (
worker_ref_id integer,
bonus_amount numeric(10),
bonus_date datetime,
foreign key (worker_ref_id) references worker(worker_id)
);

insert into worker
(first_name, last_name, salary, joining_date, department) values
('Monika', 'Arora', 100000, '21-02-20 09:00:00', 'HR'),
('Niharika', 'Verma', 80000, '21-06-11 09:00:00', 'Admin'),
('Vishal', 'Singhal', 300000, '21-02-20 09:00:00', 'HR'),
('Mohan', 'sarah', 300000, '12-03-19 09:00:00', 'Admin'),
('Amitabh', 'Singh', 500000, '21-02-20 09:00:00', 'Admin'),
('Vivek', 'Bhati', 490000, '21-06-11 09:00:00', 'Admin'),
('Vipul', 'Diwan', 200000, '21-06-11 09:00:00', 'Account'),
('Satish', 'Kumar', 75000, '21-01-20 09:00:00', 'Account'),
('Geetika', 'Chauhan', 90000, '21-04-11 09:00:00', 'Admin');

insert into bonus
(worker_ref_id, bonus_amount, bonus_date) values
((SELECT worker_id FROM worker WHERE first_name = 'Vivek'), 32000, '2021-02-11'),
((SELECT worker_id FROM worker WHERE first_name = 'Vivek'), 20000, '2022-02-11'),
((SELECT worker_id FROM worker WHERE first_name = 'Amitabh'), 21000, '2021-02-11'),
((SELECT worker_id FROM worker WHERE first_name ='Geetika'), 30000, '2021-02-11'),
((SELECT worker_id FROM worker WHERE first_name = 'Satish'), 4500, '2022-02-11');

select * from worker;
select * from bonus;
delete from worker;
delete from bonus;

-- Task 2:
-- Write an SQL query to show the second highest salary among all workers.

select MAX(salary) as second_highest_salary
from worker
where salary < (select MAX(salary) from worker);

-- Task 3:
-- Write an soL query to print the name of emptoyees having the hishest salary in ench department

SELECT w.department, w.first_name, w.last_name, w.salary
FROM worker w
WHERE (w.department, w.salary) IN (
    SELECT department, MAX(salary)
    FROM worker
    GROUP BY department
);

-- Task 4:
-- Write an SQL query to fetch the list of employees with the same salary.

SELECT first_name, last_name, salary
FROM worker
WHERE salary IN (
    SELECT salary
    FROM worker
    GROUP BY salary
    HAVING COUNT(*) > 1
);

-- Task 5:
-- Write an SQL query to find the worker names with salaries + bonus in 2021

select w.first_name, w.last_name, (w.salary + COALESCE(b.bonus_amount, 0)) as total_salary
from worker w
left join bonus b on w.worker_id = b.worker_ref_id
where year(b.bonus_date) = 2021;

-- Task 6 (Please complete Task 1-5 first):
-- Try to delete all the records in table WORKER
-- Study the reason why the data cannot be deleted

-- No, because have a foreign key 

delete from worker;


-- Task 7 (Please complete Task 6 first):
-- Try to drop table WORKER
-- Study the reason why the table cannot be deleted

-- No, because have a foreign key 

drop table WORKER;




