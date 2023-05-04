-- 1. Created

-- 2.
USE employees;

Describe employees;

SELECT count(DISTINCT title)
FROM titles;

-- 7 unique titles

-- 3. 

SELECT last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name;

-- 4. 

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY first_name, last_name;


-- 5. 

SELECT last_name
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

-- Chleq, Lindqvist, Qiwen

-- 6. 

SELECT COUNT(last_name)
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%';

-- count: 547

-- 7.

SELECT Count(*)
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender;

-- Misunderstood question, was asking for count of each name, thought question was asking for count in each gender for all included names


-- result: 441, 268

-- 8. 

SELECT LOWER(CONCAT(
SUBSTR(first_name, 1, 1),
SUBSTR(last_name, 1, 4),'_',
SUBSTR(birth_date, 6, 2),
SUBSTR(birth_date, 3, 2))) AS username,
COUNT(*) count
FROM employees
GROUP BY username;

-- 9. 

SELECT LOWER(CONCAT(
SUBSTR(first_name, 1, 1),
SUBSTR(last_name, 1, 4),'_',
SUBSTR(birth_date, 6, 2),
SUBSTR(birth_date, 3, 2))) AS username,
COUNT(*) count
FROM employees
GROUP BY username
HAVING count > 5;

-- there are duplicates. the max number of duplicates is 6. Thoguht question was asking for maximum number of duplicates of a single username

-- Bonus questions

-- 1. 

describe salaries;

SELECT emp_no, AVG(salary)
FROM salaries
GROUP BY emp_no;

-- 2. 

describe dept_emp;

SELECT
COUNT (emp_no, dept_no) employees
FROM dept_emp
GROUP BY dept_no;







