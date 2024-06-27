USE practice;

CREATE TABLE CUSTOMER(id int PRIMARY KEY,name varchar(20),referee_id int);

INSERT into CUSTOMER VALUES(1,"WILL",null),
(2,"Jane",null),
(3,"Alex",2),
(4,"Bill",null),
(5,"Zack",1),
(6,"Mark",2);

SELECT name FROM CUSTOMER WHERE referee_id is NULL OR referee_id!=2;

