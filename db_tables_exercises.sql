SHOW DATABASES;

USE albums_db;

SELECT database();

SHOW tables;

USE employees;

SELECT database();

SHOW CREATE DATABASE employees;

SHOW tables;

-- Which tables do you think contain a numeric type column?
-- all as they will all need a primary key
-- Which tables do you think contain a string type column?
-- departments, dept_emp, dept_manager, titles
-- Which table do you think contains a date type column?
-- dept_emp, employees, dept_manager, titles
-- What is the relationship between the employees and the departments tables?
-- departments will be a column within the employees table

show create table dept_manager;

-- 'dept_manager', 'CREATE TABLE `dept_manager` (\n  `emp_no` int NOT NULL,\n  `dept_no` char(4) NOT NULL,\n  `from_date` date NOT NULL,\n  `to_date` date NOT NULL,\n  PRIMARY KEY (`emp_no`,`dept_no`),\n  KEY `dept_no` (`dept_no`),\n  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,\n  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT\n) ENGINE=InnoDB DEFAULT CHARSET=latin1'
