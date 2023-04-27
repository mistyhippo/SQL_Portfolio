/*
Retrieve data from the employees database

Retrieve data from the employees database using the COUNT function

Select distinct data from fields of a table and use the GROUP BY statement

Use the HAVING clause to set conditions on aggregate functions

Retrieve data from the employees database using the SUM function

Retrieve data from the employees database using the MIN & MAX functions

Retrieve data from the employees database using the AVG function

Use ROUND to tidy up the result set of aggregate functions

*/


-- Retrieve all records in the employees table
SELECT * FROM employees;

-- Retrieve all records in the departments table
SELECT * FROM departments;

-- Retrieve all records in the dept_emp table
SELECT * FROM dept_emp;

-- Retrieve all records in the salaries table
SELECT * FROM salaries;

-- COUNT()

-- How many employees are in the company?
SELECT count(emp_no) AS num_of_employees
FROM employees;


-- Are there any employee without a first name?  

SELECT * 
FROM employees
WHERE first_name IS NULL;

-- Alternative Solution
SELECT count(first_name) AS first_name_count
FROM employees;

-- How many records are in the salaries table
SELECT count(*)
FROM salaries;

-- How many annual contracts with a value higher than or equal to
-- $100,000 have been registered in the salaries table?

SELECT count(*)
FROM salaries
WHERE salary >= 100000;


-- How many times have we paid salaries to employees?
SELECT count(salary) AS salary_count
FROM salaries;
 

-- This should give the same result as above

SELECT COUNT(from_date)
FROM salaries;
	

-- SELECT DISTINCT & GROUP BY

-- Select first name from the employees table
SELECT first_name
FROM employees;

-- Select distinct names from the employees table
SELECT DISTINCT first_name
FROM employees;

-- Select first name from the employees table and group by first name

SELECT first_name
FROM employees
GROUP BY first_name;

--How many different names can be found in the employees table?
SELECT count(DISTINCT first_name)
FROM employees;


--How many different first names are in the employees table?
SELECT first_name, count(first_name)
FROM employees
GROUP BY first_name;

-- How many different first name are in the employees table
-- and order by first name in descending order?
SELECT first_name, count(first_name)
from employees
GROUP BY first_name 
ORDER BY first_name DESC;
  
--How many different departments are there in the "employees" database?
SELECT first_name, count(first_name)
FROM employees
GROUP BY first_name 
ORDER BY first_name desc;


-- Retrieve a list of how many employees earn over $80,000 and
-- how much they earn. Rename the 2nd column as emps_with_same_salary?

SELECT salary, COUNT(emp_no) AS emps_with_same_salary
FROM salaries
WHERE salary > 80000
GROUP BY salary
ORDER BY salary ASC;


-- HAVING

-- Retrieve a list of all employees who were employed on and after 1st of January, 2000

SELECT * 
FROM employees
where hire_date >= '2000-01-01'

SELECT *
FROM employees
HAVING hire_date >= '2000-01-01';

-- Extract a list of names of employees, where the number of employees is more than 15
-- Order by first name.

SELECT first_name, COUNT(first_name) as names_count
FROM employees
GROUP BY first_name
HAVING COUNT(first_name) > 15
ORDER BY first_name;

-- Retrieve a list of employee numbers and the average salary.
-- Make sure the you return where the average salary is more than $120,000

select emp_no, AVG(salary) AS average_salary
from salaries
group by emp_no
having avg(salary) > 120000

-- Select all records from the salaries table
SELECT * FROM salaries;


-- Extract a list of all names that have encountered less than 200
-- times. Let the data refer to people hired after 1st of January, 1999
select emp_no, first_name, hire_date, count(first_name) AS names_count
from employees
where hire_date > '1999-01-01'
group by emp_no
having count(first_name) < 200
order by first_name;

-- Select the employees numbers of all individuals who have signed 
-- more than 1 contract after the 1st of January, 2000

select emp_no, count(from_date)
from dept_emp
where from_date > '2000-01-01'
group by emp_no
having count(from_date) > 1
order by emp_no;

-- Retrieve all records from dept_emp
SELECT * FROM dept_emp;

-- SUM()

-- Retrieve the total amount the company has paid in salary?
SELECT sum (salary) as total_salary
FROM salaries;
    
-- What is the total amount of money spent on salaries for all 
-- contracts starting after the 1st of January, 1997?
select sum(salary) as total_salary
from salaries
where from_date > '1997-01-01';


-- MIN() and MAX()

-- 6.1: What is the highest salary paid by the company?



-- 6.2: What is the lowest salary paid by the company?


    
-- 6.3 (Ex.): What is the lowest employee number in the database?


-- 6.4 (Ex.): What is the highest employee number in the database?



#############################
-- Task Seven: AVG()
-- In this task, you will learn how to retrieve data from the employees
-- database using the AVG() function
#############################

###########
-- AVG()

-- 7.1: How much has the company paid on average to employees?


-- 7.2: What is the average annual salary paid to employees who started
-- after the 1st of January, 1997


#############################
-- Task Eight: ROUND()
-- In this task, you will learn how to tidy up the result set from an 
-- aggregate function using ROUND(). In addition, you will perform some arithmetic
-- operations by combining different aggregate function
#############################

###########
-- ROUND()

-- 8.1: Round the average salary to the nearest whole number
   

-- 8.2: Round the average salary to a precision of cents.


-- 8.3: Round the average amount of money spent on salaries for all
-- contracts that started after the 1st of January, 1997 to a precision of cents


-- 8.4: Arithmetic operations can also be performed in PostgreSQL

-- Finding the range for salary


