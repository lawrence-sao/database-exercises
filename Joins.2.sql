USE employees;
SELECT * FROM employees LIMIT 5; -- emp_no birth_date, first_name, last_name, gender, hire_date 

SELECT * FROM dept_manager; -- emp_no dept_no from_date to date

SELECT * FROM departments;

SELECT
	d.dept_name,
	CONCAT(e.first_name, ' ', e.last_name) AS current_department_manager
FROM employees AS e

JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
	AND to_date > CURDATE()
JOIN departments AS d USING(dept_no)
ORDER BY dept_name;

-- 3

SELECT
	d.dept_name,
	CONCAT(e.first_name, ' ', e.last_name) AS current_department_manager,
	gender
FROM employees AS e
-- I can add logic into my JOIN to now also filter for females only.
JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
	AND to_date > CURDATE()
	AND gender = 'F'
JOIN departments AS d USING(dept_no)
ORDER BY dept_name;

-- 4
SELECT
	*
FROM dept_emp;

-- emp_no, title, from_date, to_date (Use to find current titles.)
SELECT
	*
FROM titles;

-- dept_no, dept_name (Use to get department name.)
SELECT
	*
FROM departments;

-- JOIN tables and query.

SELECT 
	t.title,
    -- My metric.
	COUNT(de.emp_no) AS Count
FROM dept_emp AS de
-- I can have multiple conditions in my JOIN logic. Only current employees and current titles.
JOIN titles AS t ON de.emp_no = t.emp_no
	AND t.to_date > CURDATE()
	AND de.to_date > CURDATE()
-- I can have multiple conditions in my JOIN logic. Only the Customer Service department.
JOIN departments AS d ON d.dept_no = de.dept_no
	AND dept_name = 'Customer Service'
-- My dimension. (rows)
GROUP BY t.title;
-- 5. Find the current salary of all current managers.

-- Inspect columns for each table first.
USE employees;
-- emp_no, birth_date, first_name, last_name, gender, hire_date
SELECT
	*
FROM employees
LIMIT 5;

-- emp_no, salary, from_date, to_date (Use to find current salaries)
SELECT
	*
FROM salaries;

-- emp_no, dept_no, from_date, to_date (Use to_date to find current managers)
SELECT
	*
FROM dept_manager;

-- dept_no, dept_name (Use to get department name.)
SELECT
	*
FROM departments;

-- JOIN tables and query.

SELECT
	d.dept_name,
	CONCAT(e.first_name, ' ', e.last_name) AS current_department_manager,
	s.salary
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no
	AND s.to_date > CURDATE()
JOIN dept_manager AS dm ON dm.emp_no = e.emp_no
	AND dm.to_date > CURDATE()
JOIN departments AS d USING(dept_no)
ORDER BY dept_name;

-- 6. Find the number of current employees in each department.

-- Inspect columns for each table first.

-- emp_no, dept_no, from_date, to_date (Use to get current employees.)
SELECT
	*
FROM dept_emp;


-- dept_no, dept_name (Use to get department number and name.)
SELECT
	*
FROM departments;

-- JOIN tables and query.

SELECT
	d.dept_no,
	d.dept_name,
	COUNT(emp_no) AS num_employees
FROM dept_emp AS de
JOIN departments AS d ON de.dept_no = d.dept_no
	AND de.to_date > CURDATE()
GROUP BY dept_no, dept_name;

-- 7. Which department has the highest average salary? Hint: Use current not historic information.

-- Inspect columns for each table first.

-- emp_no, dept_no, from_date, to_date (Use to get current employees.)
SELECT
	*
FROM dept_emp;

-- emp_no, salary, from_date, to_date (Use to find current salaries)
SELECT
	*
FROM salaries;

-- dept_no, dept_name (Use to get department name.)
SELECT
	*
FROM departments;

-- JOIN tables and query.

SELECT
	d.dept_name,
	ROUND(AVG(salary), 2) AS average_salary
FROM dept_emp AS de
JOIN salaries AS s ON de.emp_no = s.emp_no
	AND de.to_date > CURDATE()
	AND s.to_date > CURDATE()
JOIN departments AS d ON de.dept_no = d.dept_no
GROUP BY d.dept_name
ORDER BY average_salary DESC
LIMIT 1;

-- 8. Who is the highest paid employee in the Marketing department?

-- Inspect columns for each table first.

-- emp_no, dept_no, from_date, to_date (Use to get current employees.)
SELECT
	*
FROM dept_emp;

-- emp_no, salary, from_date, to_date (Use to find current salaries)
SELECT
	*
FROM salaries;

-- dept_no, dept_name (Use to get department name.)
SELECT
	*
FROM departments;

-- JOIN tables and query.

SELECT
	e.first_name,
	e.last_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
	AND de.to_date > CURDATE()
JOIN salaries AS s ON e.emp_no = s.emp_no
	AND s.to_date > CURDATE()
JOIN departments AS d ON de.dept_no = d.dept_no
	AND d.dept_name = 'Marketing'
ORDER BY s.salary DESC
LIMIT 1;

-- 9. Which current department manager has the highest salary?

-- Inspect columns for each table first.

-- emp_no, birth_date, first_name, last_name, gender, hire_date
SELECT
	*
FROM employees
LIMIT 5;

-- emp_no, dept_no, from_date, to_date (Use to_date to find current managers)
SELECT
	*
FROM dept_manager;

-- emp_no, salary, from_date, to_date (Use to find current salaries)
SELECT
	*
FROM salaries;

-- dept_no, dept_name (Use to get department name.)
SELECT
	*
FROM departments;

-- JOIN tables and query.

SELECT
	e.first_name,
	e.last_name,
	s.salary,
	d.dept_name
FROM employees AS e
JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
	AND to_date > CURDATE()
JOIN salaries AS s ON e.emp_no = s.emp_no
	AND s.to_date > CURDATE()
JOIN departments AS d USING(dept_no)
ORDER BY s.salary DESC
LIMIT 1;
