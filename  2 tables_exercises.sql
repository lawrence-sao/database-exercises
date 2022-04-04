USE employees;
SHOW CREATE DATABASE employees;
SHOW TABLES;
DESCRIBE employees; -- int/date/varchar/enumdepartments 
-- Which tables do you think contain a numeric type colum?    I think salaries,employees contains a numeric type column.
-- Which tables do you think contain a string type column?    departments, employees, titles
-- Which tables do you think contain a date type column?      dept_emp, dept_manager, employees, salaries
-- What is the relationship between employees and the departments tables?      employees occupy each department.alter
SHOW CREATE TABLE dept_manager;