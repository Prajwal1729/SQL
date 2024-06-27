use practice;

CREATE TABLE Employees4(id int PRIMARY KEY,name varchar(20),salary int,dept_id int);
CREATE TABLE Department(id int,name varchar(20));

INSERT INTO Employees4 Values(1,"Joe",85000,1),
(2,"Henry",80000,2),
(3,"Sam",60000,2),
(4,"Max",90000,1),
(5,"Janet",69000,1),
(6,"Randy",85000,1),
(7,"Will",70000,1);

INSERT INTO Department Values(1,"IT"),
(2,"Sales");

SELECT d.name as Department,e.name as Employee,e.salary as Sales
FROM Employees4 e INNER JOIN Department d on e.dept_id = d.id
WHERE 3 > (
  SELECT COUNT(DISTINCT (e1.salary))
  FROM Employees4 e1
  WHERE e1.salary > e.salary AND e.dept_id = e1.dept_id
  )