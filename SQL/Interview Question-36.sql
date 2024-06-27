use practice;

CREATE TABLE Queue(person_id int PRIMARY KEY,person_name varchar(20),weight int,turn int);

INSERT INTO Queue Values(5,"Alice",250,1),
(4,"Bob",175,5),
(3,"Alex",350,2),
(6,"John Cena",400,3),
(1,"Winston",500,6),
(2,"Marie",200,4);

SELECT q1.person_name
FROM Queue q1 INNER JOIN Queue q2 
on q1.turn >= q2.turn
GROUP BY q1.turn
HAVING SUM(q2.weight) <= 1000
ORDER BY SUM(q2.weight) DESC
LIMIT 1;