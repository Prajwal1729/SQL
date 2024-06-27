use practice;

CREATE TABLE Triangle(x int,y int, z int);

INSERT INTO Traingle Values(13,15,30),
(10,20,15);

SELECT *,
   IF(x+y>z and y+z>x and x+z>y,"yes","no") as traingle
FROM Traingle;