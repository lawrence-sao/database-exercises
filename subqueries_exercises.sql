USE employees; 
SELECT hire_date FROM employees WHERE emp_no = ( SELECT emp_no FROM employees WHERE emp_no = 101010); -- hire_date is 19901022
SELECT * FROM employees LIMIT 5; -- emp_no, hire_date
-- Q1 
SELECT * FROM employees WHERE hire_date = '1990-10-22'; -- 69 employees returned same hire date at 101010 
-- Q2
SELECT * FROM  employees, titles where first_name = 'Aamod';
-- Q3 
select count(*) # count all the records
from employees # from the employees table
where emp_no not in 
	(select emp_no
	from dept_emp
	where to_date > now()
);
-- Same solution using 'salaries' table:
select *
from employees
where emp_no NOT IN
	(
	select emp_no
	from salaries
	where to_date > now()
	);


# 4
-- # Find all the current department managers that are female. List their names in a comment in your code.
select *
from employees
where emp_no in (
    select emp_no
       from dept_manager
          where to_date > now()
)
and gender = "F";


-- # 5 Find all the employees who currently have a higher salary than the 
-- #companies overall, historical average salary (154,726 records )

-- # (154,543 records). 
select emp_no
from salaries s
join employees e using(emp_no)
where to_date > now() 
and  salary > (select avg(salary) from salaries) ;



# 6
# How many current salaries are within 1 standard deviation of the current highest salary? 
#(Hint: you can use a built in function to calculate the standard deviation.) 
# What percentage of all salaries is this?





-- # what is the max current salary:
select max(salary) from salaries where to_date > now();

-- # what is the 1 std for current salary;
select stddev(salary) from salaries where to_date > now();

-- Count of current salaries > (Max-1 std). (count = 83)
select count(*)
from salaries
where to_date > now()
and salary > (
(select max(salary) from salaries where to_date > now()) - 
(select std(salary) from salaries where to_date > now())
);

-- Denominator, count of all current salaries (240,124)
select count(*)
from salaries 
where to_date > now();


-- What percentage of all salaries is this?
-- SELECT (Numerator)/ (Denominator)
select((select count(*)
from salaries
where to_date > now()
and salary > (
(select max(salary) from salaries where to_date > now()) - 
(select std(salary) from salaries where to_date > now())
))/(select count(*)
from salaries 
where to_date > now())) * 100 as "percentage of salaries within 1 Stdev of Max";
