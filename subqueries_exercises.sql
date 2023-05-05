-- 1. 

USE employees;

SELECT * 
FROM employees;

SELECT hire_date
FROM employees
WHERE emp_no = '101010';

SELECT *
FROM employees
WHERE hire_date = (SELECT hire_date
FROM employees
WHERE emp_no = '101010');

-- 2. 

SELECT emp_no 
FROM employees
WHERE first_name = 'Aamod';

SELECT title
FROM titles
WHERE emp_no IN (SELECT emp_no 
FROM employees
WHERE first_name = 'Aamod' AND to_date > NOW())
GROUP BY title;

-- 3. 



SELECT * 
FROM dept_emp
WHERE to_date NOT LIKE '999%';

SELECT count(*) 
FROM employees 
WHERE emp_no NOT IN (
SELECT emp_no
FROM salaries
WHERE to_date LIKE '999%'
);

-- 59900

-- 4. 

SELECT first_name, last_name
FROM employees
WHERE emp_no IN (SELECT emp_no FROM dept_manager WHERE to_date > NOW())
AND gender = 'F';

-- Isamu Legleitner, Karsten Sigstam, Leon DasSarma, Hilary Kambil

-- 5. 

SELECT AVG(salary)
FROM salaries;

SELECT emp_no
FROM salaries
WHERE salary > (SELECT AVG(salary)
FROM salaries)
GROUP BY emp_no;

SELECT CONCAT(first_name, ' ', last_name)
FROM employees
WHERE emp_no IN (SELECT emp_no
FROM salaries
WHERE salary > (SELECT AVG(salary)
FROM salaries))
GROUP BY emp_no;

-- 6. 

SELECT STDDEV(salary)
FROM salaries
WHERE to_date > NOW();

SELECT count(salary) AS number_of_salaries
FROM salaries 
WHERE to_date > NOW()
AND salary >= (SELECT max(salary) - STDDEV(salary)
FROM salaries
where to_date > NOW());
    
SELECT 
(SELECT count(salary) 
FROM salaries 
WHERE to_date > NOW()
AND salary >= 
    (SELECT max(salary) - STDDEV(salary)
    FROM salaries
    WHERE to_date > NOW()))
    /
(SELECT count(salary)
    FROM salaries 
    WHERE to_date > NOW()
    ) * 100;
    
-- 83 current salaries w/in 1 SD of max, .0346 % of employees are within 1 SD





