CREATE database PRACTICE1;

USE PRACTICE1;

CREATE TABLE Weather(id int,recordDate date,temprature int);

INSERT INTO Weather Values(1,"2015-01-01",10),
(2,"2015-01-02",25),
(3,"2015-01-03",20),
(4,"2015-01-04",30);

SELECT w1.id from Weather w1 INNER JOIN Weather w2 WHERE datediff(w1.recordDate,w2.recordDate) = 1 AND
w1.temprature > w2.temprature;