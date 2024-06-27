use practice1;

CREATE TABLE Students(stu_id int,stu_name varchar(20));
CREATE TABLE Subjects(sub_name varchar(20));
CREATE TABLE Examinations(stu_id int,sub_name varchar(20));

INSERT INTO Students VALUES(1,"Alice"),
(2,"Bob"),
(13,"John"),
(6,"Alex");

INSERT INTO Subjects Values("Math"),
("Physics"),
("Programming");

INSERT INTO Examinations VALUES(1,"Math"),
(1,"Physics"),
(1,"Programmimg"),
(2,"Programming"),
(1,"Physics"),
(1,"Math"),
(13,"Math"),
(13,"Programming"),
(13,"Physics"),
(2,"Math"),
(1,"Math");s

SELECT s.stu_id,s.stu_name,su.sub_name, 
count(e.sub_name) as attended_exams
FROM Students s 
CROSS JOIN Subjects su 
LEFT JOIN Examinations e 
on s.stu_id = e.stu_id AND su.sub_name = e.sub_name 
GROUP BY s.stu_id,s.stu_name,su.sub_name 
ORDER BY s.stu_id, su.sub_name;


