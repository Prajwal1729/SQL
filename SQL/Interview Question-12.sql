use practice1;

CREATE TABLE Employee(empId int PRIMARY KEY,name varchar(20),supervisor int,salary int);
CREATE TABLE Bonus(empId int,bonus int);

INSERT INTO Employee VALUES(3,"Brad",null,4000),
(1,"John",3,1000),
(2,"Dan",3,2000),
(4,"Thomas",3,4000);

INSERT INTO Bonus VALUES(2,500),
(4,2000);

SELECT distinct e.name,b.bonus FROM Employee e LEFT JOIN Bonus b on e.empId = b.empId WHERE b.Bonus < 1000
OR b.bonus is Null;