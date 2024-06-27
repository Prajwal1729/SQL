USE student;
CREATE TABLE EMPLOYEE(emp_id int not null,name varchar(20),salary int);
INSERT INTO EMPLOYEE VALUES(1,"Prajwal",100000),
(2,"Harvey",70000),
(3,"Mike",60000),
(4,"Jessica",50000);

SELECT * FROM EMPLOYEE;

SELECT salary from EMPLOYEE order by salary DESC LIMIT 2,1;





