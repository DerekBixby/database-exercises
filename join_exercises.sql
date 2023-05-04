USE employees
;
DESCRIBE departments;
DESCRIBE dept_emp;
DESCRIBE dept_manager;
DESCRIBE employees;
DESCRIBE salaries;
DESCRIBE titles;

-- Join Example Database
-- 1. 

USE join_example_db;

DESCRIBE roles;

DESCRIBE users;

-- 2. 

-- Join

SELECT users.name as user_name, roles.name as role_name
FROM users
JOIN roles ON users.role_id = roles.id;

-- Left Join

SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

-- Right Join

SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

-- 3. 

SELECT Count(users.name) as user_name, roles.name as role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id
GROUP BY roles.name;

-- Employees Database

-- 1. 

USE employees;

-- 2. 

SELECT * 
FROM dept_manager;


SELECT dept_name, CONCAT (employees.first_name, ' ', employees.last_name)
FROM dept_manager
JOIN departments
ON dept_manager.dept_no = departments.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no
WHERE dept_manager.to_date = '9999-01-01';

-- 3. 

SELECT dept_name AS department, CONCAT (employees.first_name, ' ', employees.last_name) AS name
FROM dept_manager
JOIN departments
ON dept_manager.dept_no = departments.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no
WHERE employees.gender = 'F' AND dept_manager.to_date = '9999-01-01';

-- 4. 

SELECT *
FROM departments;

-- d009 = Customer Service

SELECT title, COUNT(*)
FROM titles
JOIN dept_emp ON dept_emp.emp_no = titles.emp_no
WHERE dept_emp.to_date = '9999-01-01' AND titles.to_date = '9999-01-01' AND dept_emp.dept_no = 'd009'
GROUP BY title;

-- 5. 

SELECT dept_name, CONCAT (employees.first_name, ' ', employees.last_name),
salary
FROM dept_manager
JOIN departments
ON dept_manager.dept_no = departments.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no
JOIN salaries 
ON dept_manager.emp_no = salaries.emp_no
WHERE dept_manager.to_date = '9999-01-01' AND salaries.to_date = '9999-01-01';

-- 6. 

SELECT departments.dept_no, dept_name,
COUNT(emp_no)
FROM departments
JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
WHERE dept_emp.to_date = '9999-01-01'
GROUP BY dept_no;

-- 7. error for network

SELECT dept_name, AVG(salary)
FROM dept_emp
JOIN departments
ON departments.dept_no = dept_emp.dept_no 
JOIN salaries 
ON salaries.emp_no = dept_emp.emp_no
WHERE salary IN(SELECT max(salary) FROM employees
GROUP BY dept_name;

-- 8. error for network

-- Marketing = d001

SELECT CONCAT (employees.first_name, ' ', employees.last_name)
FROM employees
JOIN salaries
ON salaries.emp_no = employees.emp_no
JOIN dept_emp
ON dept_emp.emp_no = employees.emp_no
WHERE dept_no = 'd001' 
AND salary IN (SELECT max(salary) FROM employees);

-- 9. error from network

SELECT first_name, last_name, salary, dept_name
FROM dept_manager
JOIN departments
ON dept_manager.dept_no = departments.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no
JOIN salaries
ON salaries.emp_no = dept_manager.emp_no
WHERE dept_manager.to_date = '9999-01-01'
AND salary IN (SELECT max(salary) FROM employees);

-- 10. 

