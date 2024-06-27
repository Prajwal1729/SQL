use practice1;

CREATE TABLE Queries(query_name varchar(20),resuit varchar(20),position int,rating int);

INSERT INTO Queries VALUES("Dog","Golden Retriver",1,3),
("Dog","German Shepherd",2,5),
("Dog","Mule",200,1),
("Cat","Shirazi",5,2),
("Cat","Siamese",3,3),
("Cat","Sphynx",7,4);

SELECT query_name,ROUND(AVG(rating/position),2) as quality, 
ROUND(AVG(IF(rating < 3,1,0))*100,2) as poor_query_percentage
FROM Queries GROUP BY query_name;