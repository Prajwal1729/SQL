use practice;

CREATE TABLE Employees3(emp_id int Primary Key,name varchar(20),manager_id int,salary int);

INSERT INTO Employees3 VALUES(3,"Mila",9,60301),
(12,"Antonella",null,31000),
(13,"Emery",null,67084),
(1,"Kalel",11,21241),
(9,"Mikaela",null,50937),
(11,"Joziah",6,28485);


SELECT emp_id
FROM Employees3
WHERE salary < 30000 AND manager_id NOT IN(
      select emp_id FROM Employees3
)
order by emp_id;