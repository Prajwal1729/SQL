use practice1;

CREATE TABLE Project(project_id int,employee_id int);
CREATE TABLE Employee2(employee_id int,name varchar(20),expirence_years int);

INSERT INTO Project Values(1,1),
(1,2),
(1,3),
(2,1),
(2,4);

INSERT INTO Employee2 Values(1,"Khaled",3),
(2,"Ali",2),
(3,"John",1),
(4,"Doe",2);

SELECT p.project_id, ROUND(AVG(e.expirence_years),2) as average_years FROM Project p LEFT JOIN 
Employee2 e on p.employee_id = e.employee_id GROUP BY p.project_id;