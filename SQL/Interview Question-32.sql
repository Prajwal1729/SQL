use practice;

CREATE TABLE Employees2(emp_id int,dept_id int,primary_flag ENUM("Y","N"));

INSERT INTO Employees2 Values(1,1,"N"),
(2,1,"Y"),
(2,2,"N"),
(3,3,"N"),
(4,2,"N"),
(4,3,"Y"),
(4,4,"N");

SELECT DISTINCT emp_id,dept_id
FROM Employees2 WHERE emp_id in(
 SELECT emp_id from Employees2 
 GROUP BY emp_id 
 HAVING COUNT(*)=1
) OR primary_flag="Y" ORDER BY emp_id;
