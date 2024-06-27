CREATE DATABASE Student1;

USE Student1;

CREATE TABLE Employee(emp_id int PRIMARY KEY,emp_name varchar(50),dept_name varchar(20),salary int);

INSERT INTO Employee Values(101,"Mohan","Admin",4000),
(102,"Rajkumar","HR",3000),
(103,"Akbar","IT",4000),
(104,"Darvin","Finance",6500),
(105,"Rohit","HR",3000),
(106,"Rajesh","Finanace",5000),
(107,"Preet","HR",7000),
(108,"Marvam","Admin",4000);

SELECT * from Employee;

# Window Function:
SELECT e.*,
max(salary) over() as max_salary    -- over clause to specify the window of records, 
                                     -- max is treated as a Window function.
FROM Employee e;

SELECT e.*,max(salary) over(partition by dept_name) as max_salary  -- partition by a particular column
from Employee e;

# Row_Number: Unique value to each of the indentifier in the table. It does not care about duplicate values
-- It will add just going  add unique number to every record

SELECT e.*,
row_number() over() as rn
from Employee e;

SELECT e.*,
row_number() over(partition by dept_name order by emp_id) as rn
from Employee e;

-- Fetch first two employees from each department.

SELECT * from(
  select e.*,
  row_number() over(partition by dept_name order by emp_id) as rn
  from Employee e) x
WHERE x.rn < 3;

-- RANK()
-- Top 3 employees in each department earning the max salary.

SELECT * from(
	SELECT e.*,
	rank() over(partition by dept_name order by salary DESC) as rnk
	from Employee e
    ) x
    where rnk < 2;
    

-- DENSE_RANK(): It will not skip any value.
SELECT e.*,
rank() over(partition by dept_name order by salary DESC) as rnk,
dense_rank() over(partition by dept_name order by salary DESC) as dns_rnk,
row_number() over(partition by dept_name order by salary desc) as rn
from Employee e;

-- LEAD() & LAG()
--  fetch a query to display if the salary of an employee is higher,lower or equal to previous employee. 

SELECT e.*,
LAG(salary,2,0) over(partition by dept_name order by emp_id) as prev_emp_salary,  -- 2 records previous from curr
LEAD(salary) over(partition by dept_name ORDER by emp_id) as next_emp_salary
from Employee e;

select e.*,
lag(salary) over(partition by dept_name order by emp_id) as prev_emp_salary,
CASE WHEN e.salary > LAG(salary) over(partition by dept_name order by emp_id) then "Higher than Previous employee"
	 WHEN e.salary < LAG(salary) over(partition by dept_name order by emp_id) then "Lower than Previous employee"
	 WHEN e.salary = LAG(salary) over(partition by dept_name order by emp_id) then "Equal to Previous employee"
     END salary_range
FROM Employee e;







