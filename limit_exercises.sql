-- 1. complete

USE employees;

-- 2. 

SELECT DISTINCT title FROM titles;

SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC
LIMIT 10;

-- Names: Zykh, Zyda, Zwicker, Zweizig, Zumaque, Zultner, Zucker, Zuberek, Zschoche, Zongker

-- 3. 

SELECT last_name, first_name, hire_date, birth_date
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND birth_date LIKE '%-12-31'
ORDER BY hire_date ASC
LIMIT 5;

-- Magdalena Guting, Chaosheng Plavsic, Sachin Brodie, Douadi Streit, Ymte Schlegelmilch

-- 4. 

SELECT last_name, first_name, hire_date, birth_date
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND birth_date LIKE '%-12-31'
ORDER BY hire_date ASC
LIMIT 5 OFFSET 46;

-- results start with Willard Itschner. LIMIT sets the page size, OFFSET determines on which page one will start (multiplying by LIMIT), page number depends on LIMIT number
																																											   he number of results or size of page and OFFSET should be geared based upon expected number per each page (multiply by OFFSET number
