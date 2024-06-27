use practice;

CREATE TABLE Users1(user_id int,name varchar(20));

INSERT INTO Users1 Values(1,"aLice"),
(2,"bOB");

SELECT user_id,
   CONCAT(UPPER(LEFT(name,1)),LOWER(RIGHT(name,LENGTH(name)-1)))
FROM Users1 
order by user_id;