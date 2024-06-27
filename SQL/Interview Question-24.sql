use practice1;

CREATE TABLE Teacher(teacher_id int,subject_id int,dept_id int);

INSERT INTO Teacher values(1,2,3),
(1,2,4),
(1,3,3),
(2,1,1),
(2,2,1),
(2,3,1),
(2,4,1);

SELECT DISTINCT teacher_id, COUNT(distinct subject_id) from Teacher GROUP BY teacher_id;
