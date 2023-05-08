-- 1. 
USE employees;

SELECT first_name, last_name, dept_no, hire_date, to_date,
	 CASE 
     WHEN to_date LIKE '999%' THEN '1'
     ELSE '0'
     END AS 'is_current_employee'
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no;

-- 2. 

SELECT first_name, last_name,
	CASE 
    WHEN SUBSTR(last_name, 1, 1) IN ('a','b','c','d','e','f','g','h') THEN 'A-H'
	WHEN SUBSTR(last_name, 1, 1) IN ('i','j','k','l','m','n','o','p','q') THEN 'I-Q'
	WHEN SUBSTR(last_name, 1, 1) IN ('r','s','t','u','v','w','x','y','z') THEN 'R-Z'
    END AS 'alpha_group'
    FROM employees;

-- alternates:
SELECT
    first_name,
    last_name,
    LEFT(last_name, 1) AS first_letter_of_last_name,
    CASE
        WHEN LEFT(last_name, 1) <= 'H' THEN 'A-H'
        WHEN SUBSTR(last_name, 1, 1) <= 'Q' THEN 'I-Q'
        WHEN LEFT(last_name, 1) <= 'Z' THEN 'R-Z'
        ELSE 'other'
    END AS alpha_group
FROM employees;

SELECT last_name,
    CASE
        WHEN substr(last_name, 1,1) BETWEEN 'a' AND 'h' THEN 'A_H_last_name'
        WHEN substr(last_name, 1,1) BETWEEN 'i'AND 'q' THEN 'I_Q_last_name'
        WHEN substr(last_name, 1,1) BETWEEN 'r' AND 'z' THEN 'R-Z_last_name'
        ELSE 'other'
    END AS alpha_group
FROM employees;


-- 3. 

SELECT birth_date
FROM employees;

SELECT DISTINCT COUNT(*),
CASE 
WHEN birth_date LIKE '190%' THEN '1900s'
WHEN birth_date LIKE '191%' THEN '1910s'
WHEN birth_date LIKE '192%' THEN '1920s'
WHEN birth_date LIKE '193%' THEN '1930s'
WHEN birth_date LIKE '194%' THEN '1940s'
WHEN birth_date LIKE '195%' THEN '1950s'
WHEN birth_date LIKE '196%' THEN '1960s'
WHEN birth_date LIKE '197%' THEN '1970s'
WHEN birth_date LIKE '198%' THEN '1980s'
END AS birth_decade
FROM employees
GROUP BY birth_decade;

-- alternates: 

SELECT
    COUNT(CASE WHEN birth_date LIKE '195%' THEN birth_date ELSE NULL END) AS '50s',
    COUNT(CASE WHEN birth_date LIKE '196%' THEN birth_date ELSE NULL END) AS '60s'
FROM employees;


-- 4. 

SELECT * 
FROM departments;

SELECT ROUND(AVG(salary),2) AS average_salary,
CASE 
WHEN dept_name IN ('research', 'development') THEN 'R&D'
WHEN dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing' 
WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
WHEN dept_name IN ('Customer Service') THEN 'Customer Service' 
WHEN dept_name IN ('Finance', 'Human Resources') THEN 'Finance & HR'
ELSE dept_name
END AS dept_group
FROM departments
JOIN dept_emp USING (dept_no)
JOIN employees USING (emp_no)
JOIN salaries USING (emp_no)
GROUP BY dept_name
ORDER BY average_salary;