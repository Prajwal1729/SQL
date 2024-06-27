use practice;

CREATE TABLE Employees1(emp_id int, name varchar(20),reports_to int, age int);
INSERT INTO Employees1 VALUES(9,"Hercy",null,43),
(6,"Alice",9,41),
(4,"Bob",9,36),
(2,"Winston",null,37);

SELECT 
e1.emp_id,e1.name,COUNT(e2.emp_id) as reports_count, ROUND(AVG(e2.age)) as average_age
from Employees1 e1 INNER JOIN Employees1 e2 on e1.emp_id = e2.reports_to
GROUP BY e1.emp_id,e1.name
ORDER BY emp_id;