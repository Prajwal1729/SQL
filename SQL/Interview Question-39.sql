use practice;

CREATE TABLE Seat(id int PRIMARY KEY,student varchar(20));

INSERT INTO Seat Values(1,"Abbot"),
(2,"Doris"),
(3,"Emerson"),
(4,"Green"),
(5,"Jeames");

SELECT 
  CASE 
    WHEN
      id = (SELECT MAX(id) from Seat) AND MOD(id,2)=1
      THEN id
    WHEN 
	  MOD(id,2)=1
      THEN id+1
	ELSE
	  id-1
  END as id, student
FROM Seat 
ORDER BY id;
