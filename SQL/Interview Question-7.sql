use practice;

CREATE TABLE Employees(id int PRIMARY KEY,name varchar(20));
CREATE TABLE EmployeeUNI(id int, unique_id int);

INSERT INTO Employees Values(1,"Alice"),
(7,"Bob"),
(11,"Meir"),
(90,"Winston"),
(3,"Jonathan");

INSERT INTO EmployeeUNI VALUES(3,1),
(11,2),
(90,3);

SELECT eu.unique_id as unique_id, e.name as name FROM Employees e LEFT JOIN EmployeeUNI ei on e.id = ei.id;