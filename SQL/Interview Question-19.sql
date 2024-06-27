USE practice1;

CREATE TABLE Users(user_id int PRIMARY KEY,user_name varchar(20));
CREATE TABLE Register(contest_id int,user_id int);

INSERT INTO Users Values(6,"Alice"),
(2,"Bob"),
(7,"Alex");

INSERT INTO Register Values(215,6),
(209,2),
(208,2),
(210,6),
(208,6),
(209,7),
(209,6),
(215,7),
(208,7),
(210,2),
(207,2),
(210,7);


SELECT contest_id, ROUND((COUNT(distinct user_id))*100/(SELECT COUNT(user_id) from Users),2)
as Percentage
FROM Register GROUP BY contest_id
ORDER BY Percentage DESC,contest_id;