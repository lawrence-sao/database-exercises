-- Exercise #1 
USE jemison_1744;
CREATE TEMPORARY TABLE employees_with_departments(
Select emp_no, first_name, last_name from employees.employees

);
ALTER TABLE employees_with_departments add full_name varchar(30);
update employees_with_departments set full_name = concat(first_name, ' ', last_name);
# how do I add and remove columns from the table?? How do i USE my jemison ID 
SELECT * FROM employees_with_departments;
-- Exercise #2 

USE jemison_1744;
CREATE TEMPORARY TABLE  sakila_temp(
SELECT * FROM sakila.payment
);
SELECT* FROM sakila_temp;
ALTER TABLE  sakila_temp add pay_int integer(30); 
update sakila_temp set pay_int = amount * 100;
SELECT * FROM sakila_temp;
DESCRIBE sakila_temp;

--  Exercise #3  

select avg(salary), std(salary) from employees.salaries;

 select avg(salary) as avg_salary, std(salary) as std_salary
    from employees.salaries 
    
    select * from historic_aggregates;


-- Let's check out our current average salaries for each department
-- If you see "for each" in the English for a query to build..
-- Then, you're probably going to use a group by..
select dept_name, avg(salary) as department_current_average
from employees.salaries
join employees.dept_emp using(emp_no)
join employees.departments using(dept_no)
where employees.dept_emp.to_date > curdate()
and employees.salaries.to_date > curdate()
group by dept_name;


create temporary table current_info as (
    select dept_name, avg(salary) as department_current_average
    from employees.salaries
    join employees.dept_emp using(emp_no)
    join employees.departments using(dept_no)
    where employees.dept_emp.to_date > curdate()
    and employees.salaries.to_date > curdate()
    group by dept_name

