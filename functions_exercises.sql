-- 1. Copied former exercise

- 1. Previous lesson

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

-- end of previous lesson

-- 2. 

USE employees;

DESCRIBE employees;

SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;

-- First row name: Irena Reutenauer Last row name: Vidya Simmen

-- 3. 

SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;

-- first row name: Irena Acton, Last row name: Vidya Zweizig

-- 4. 

SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

-- First row name: Irena Acton, Last row name: Maya Zyda

-- 5. 

SELECT last_name, first_name, emp_no
FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY emp_no;

-- 899 employees returned, first employee : 10021 Ramzi Erde,last employee: 499648 Tadahiro Erde

-- 6. 

SELECT last_name, first_name, hire_date
FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY hire_date DESC;

-- 899 returns, newest: Teiji Eldridge, oldest: Sergi Erde

-- 7. 

SELECT last_name, first_name, hire_date, birth_date
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND birth_date LIKE '%-12-25'
ORDER BY birth_date ASC, hire_date DESC;

-- Corrective note1: can use LIKE '199%' instead of BETWEEN function for simplicity

-- corrective note 2: used 12-31 instead of 12-25 Douadi Pettis, 

-- 358 returns, oldest and hired last: Yannik Chiodo, youngest and hired first: Przemyslawa Heydon

-- -------------end of previous exercise-------------

-- 2. 

SELECT CONCAT(first_name, SPACE(1), last_name) AS full_name
FROM employees
WHERE last_name LIKE 'e%e';

-- 3. 

SELECT UPPER (CONCAT(first_name, SPACE(1), last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'e%e';

-- 4. 

SELECT COUNT(*)
FROM employees
WHERE last_name LIKE 'e%e';

-- 5. 

SELECT DATEDIFF (CURDATE(), hire_date)
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%-12-25';

-- suggestive note: use AS to make results more clear, add ID columns

-- 6. 

SELECT CONCAT(MIN(salary), SPACE(1), MAX(salary))
FROM salaries;

-- note, can just add ' ' instead of SPACE()

-- min: 38623, Max: 158220

-- 7.

SELECT LOWER(CONCAT(
SUBSTR(first_name, 1, 1),SUBSTR(last_name, 1, 4),'_',SUBSTR(birth_date, 6, 2),SUBSTR(birth_date, 3, 2))) 
AS username, first_name,last_name,birth_date
FROM employees;
