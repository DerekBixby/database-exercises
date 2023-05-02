use employees;

show tables;

describe employees;

select emp_no
FROM employees
WHERE first_name IN ('Irena' , 'Vidya' , 'Maya');

-- 1. What is the employee number of the tope 3 results (using IN)?
-- 10200, 10397, 10610

select emp_no
FROM employees
WHERE first_name = 'Irena' OR 'Vidya' OR 'Maya';

-- 2. Emp # of top 3 using OR:
-- 10397, 10610, 10821. Does not match previous question

Select emp_no 
FROM employees
WHERE first_name = 'Irena' OR 'Vidya' OR 'Maya' 
AND gender = 'm';

-- 3. first names + gender
-- 10397, 10610, 10821

-- 4.
SELECT DISTINCT last_name
FROM employees 
WHERE last_name LIKE 'e%';

-- 5. 

SELECT DISTINCT last_name
FROM employees 
WHERE last_name LIKE '%e'
OR 'e%';

-- 6. 

SELECT DISTINCT last_name
FROM employees 
WHERE last_name LIKE '%e'
AND last_name NOT LIKE 'e%';

-- 7. 

SELECT DISTINCT last_name
FROM employees 
WHERE last_name LIKE 'e%e';

-- 8.


select emp_no
FROM employees 
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';

-- 10008, 10011, 10012

-- 9. 

select emp_no, birth_date
FROM employees 
WHERE birth_date LIKE '%12-25';

-- 10078, 10115, 10261

-- 10.

select emp_no, birth_date, hire_date
FROM employees 
WHERE birth_date LIKE '%12-25'
AND hire_date between '1990-01-01' and '1999-12-31';

-- 10261, 10438, 10681

-- 11. 

SELECT DISTINCT last_name
FROM employees 
WHERE last_name LIKE '%q%';

-- Zumaque, Rouquie, Quittner, Quaggetto, Quadeer, Qiwen, Marquardt, Maquelin, Lindqvist, Chleq

-- 12. 

SELECT DISTINCT last_name
FROM employees 
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%';

-- Chleq, Linqvist, Qiwen





