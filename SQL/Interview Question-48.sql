use practice;

CREATE TABLE Employee5(id int Primary Key,salary int);

INSERT INTO Employee5 Values(1,100),
(2,200),
(3,300);

SELECT max(salary) as SECONDHIGHESTSALARY from Employee5
WHERE salary not in(
SELECT max(salary) from Employee5);