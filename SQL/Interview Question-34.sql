use practice;

CREATE TABLE logs(id int Primary Key,num varchar(20));

INSERT INTO logs Values(1,'1'),
(2,'1'),
(3,'1'),
(4,'2'),
(5,'1'),
(6,'2'),
(7,'2');

select distinct l1.num as consecutive_nums
FROM logs l1, logs l2, logs l3
WHERE l1.id = l2.id - 1 AND l2.id = l3.id - 1
AND l1.num = l2.num AND l2.num = l3.num;