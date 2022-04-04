SELECT CONCAT(first_name,last_name) FROM employees Where last_name like 'E%' AND last_name like '%E';
SELECT CONCAT(first_name,last_name) AS full_name FROM employees;
SELECT UPPER(CONCAT(first_name,last_name)) AS full_name FROM employees WHERE last_name like 'E%' AND last_name like '%E';
SELECT first_name, last_name, DATEDIFF(NOW(), hire_date) AS days_with_company FROM employees WHERE hire_date LIKE '199%' AND birth_date LIKE '%-12-25'; SELECT * from salaries;
-- Exercise 4 --
SELECT MIN(salary), MAX(salary) FROM salaries WHERE to_date> CURDATE(); -- min=38623 max= 158220
-- Exercise 5 -- 
select lower(concat(
    substr(first_name, 1, 1), # first initial of first name
    substr(last_name, 1, 4), # first 4 of last name
		 "_",
		 substr(birth_date, 6, 2), # month
		 substr(birth_date, 3, 2) # 2 yr
)) as username,first_name, last_name, birth_date
from employees;