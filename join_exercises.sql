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
WHERE dept_manager.to_date = '9999-01-01'
ORDER BY dept_name;

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
GROUP BY dept_no
ORDER BY dept_no;

-- 7. 

SELECT dept_name, AVG(salary)
FROM departments
JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no 
JOIN employees
ON employees.emp_no = dept_emp.emp_no
JOIN salaries 
ON salaries.emp_no = dept_emp.emp_no
WHERE salaries.to_date = '9999-01-01' 
GROUP BY dept_name 
ORDER BY AVG(salary) DESC
LIMIT 1;

-- 8. error for code

-- Marketing = d001

SELECT first_name, last_name
FROM salaries
JOIN employees ON salaries.emp_no = employees.emp_no
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name LIKE 'Marketing'
ORDER BY salary DESC
LIMIT 1;

-- 9. error in code, selects too many options

SELECT first_name, last_name, salary, dept_name
FROM salaries
JOIN employees ON salaries.emp_no = employees.emp_no
JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
JOIN departments ON dept_manager.dept_no = departments.dept_no
WHERE dept_manager.to_date > NOW() AND salaries.to_date > NOW()
ORDER BY salary DESC
LIMIT 1;

-- 10. 

SELECT d.dept_name, ROUND(AVG(s.salary),0) AS avg_dept_salary
FROM departments d
    JOIN dept_emp de USING (dept_no)
    JOIN salaries s USING (emp_no)
GROUP BY d.dept_name
ORDER BY avg_dept_salary DESC;
