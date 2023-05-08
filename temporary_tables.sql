-- 1. 



-- CREATE TEMPORARY TABLE employees_with_departments 
-- (first_name STRING NOT NULL, last_name STRING NOT NULL, dept_name STRING NOT NULL);

-- SELECT SUBSTR("Data Scienterrific", 10, LENGTH("Data Scienterrific"));

USE quintela_2237;

select first_name, last_name, dept_name
from employees.employees
join employees.dept_emp using(emp_no)
join employees.departments using(dept_no)
where to_date > curdate();

drop table if exists employees_with_departments;

create temporary table employees_with_departments as (
    select first_name, last_name, dept_name
    from employees.employees
    join employees.dept_emp using(emp_no)
    join employees.departments using(dept_no)
    where to_date > curdate()
);

select * from employees_with_departments;

alter table employees_with_departments add full_name VARCHAR(30);

update employees_with_departments set full_name = concat(first_name, ' ', last_name);

ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;

select * from employees_with_departments;

-- 2. 

drop table if exists payments;
select * from sakila.payment;

create temporary table payments as (
    select payment_id, customer_id, staff_id, rental_id, amount * 100 as amount_in_pennies, payment_date, last_update
    from sakila.payment
);

select * from payments;

describe payments;

ALTER TABLE payments MODIFY amount_in_pennies int NOT NULL;

-- 3. 

select avg(salary), std(salary) from employees.salaries where to_date > now();

create temporary table overall_aggregates as (
    select avg(salary) as avg_salary, std(salary) as std_salary
    from employees.salaries  where to_date > now()
);

create temporary table current_info as (
    select dept_name, avg(salary) as department_current_average
    from employees.salaries
    join employees.dept_emp using(emp_no)
    join employees.departments using(dept_no)
    where employees.dept_emp.to_date > curdate()
    and employees.salaries.to_date > curdate()
    group by dept_name
);

alter table current_info add overall_avg float(10,2);
alter table current_info add overall_std float(10,2);
alter table current_info add zscore float(10,2);

update current_info set overall_avg = (select avg_salary from overall_aggregates);
update current_info set overall_std = (select std_salary from overall_aggregates);

update current_info 
set zscore = (department_current_average - overall_avg) / overall_std;

SELECT AVG(salary), STDDEV(salary)
FROM employees.salaries;
