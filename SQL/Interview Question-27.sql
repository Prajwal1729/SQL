use practice;


CREATE TABLE Courses(student varchar(20),class varchar(20));

INSERT INTO Courses Values("A","Math"),
("B","English"),
("C","Math"),
("D","Biology"),
("E","Math"),
("F","Computer"),
("G","Math"),
("H","Math"),
("I","Math");

SELECT class
FROM Courses GROUP BY class having COUNT(student)>5;