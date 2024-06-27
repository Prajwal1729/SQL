use practice1;

CREATE TABLE Employees1(id int PRIMARY KEY,name varchar(20),department varchar(20),manager_id int);

INSERT INTO Employees1 values(101,"John","A",Null),
(102,"Dan","A",101),
(103,"James","A",101),
(104,"Amy","A",101),
(105,"Anne","A",101),
(106,"Ron","B",101);

SELECT e1.name FROM Employees1 e1 Inner Join Employees1 e2 on e1.id = e2.manager_id GROUP BY e2.manager_id
HAVING COUNT(e2.manager_id) >=5;