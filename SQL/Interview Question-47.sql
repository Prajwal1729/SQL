use practice;

CREATE TABLE Person(id int PRIMARY KEY,email varchar(20));

INSERT INTO Person Values(1,"john@example.com"),
(2,"bob@example.com"),
(3,"john@example.com");

DELETE p1
FROM Person p1 INNER JOIN Person p2
where p1.email = p2.email AND p1.id > p2.id;
