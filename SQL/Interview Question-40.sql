use practice;

CREATE TABLE Movies(movie_id int PRIMARY KEY,title varchar(20));
CREATE TABLE Users(user_id int Primary KEY,name varchar(20));
CREATE TABLE MovieRating(movie_id int,user_id int,rating int,created_at date);

INSERT INTO Movies Values(1,"Avengers"),
(2,"Frozen 2"),
(3,"Joker");

INSERT INTO Users Values(1,"Daniel"),
(2,"Monica"),
(3,"Maria"),
(4,"James");

INSERT INTO MovieRating Values(1,1,3,"2020-01-12"),
(1,2,4,"2020-02-11"),
(1,3,2,"2020-02-12"),
(1,4,1,"2020-01-01"),
(2,1,5,"2020-02-17"),
(2,2,2,"2020-02-01"),
(2,3,2,"2020-03-01"),
(3,1,3,"2020-02-22"),
(3,2,4,"2020-02-25");


(SELECT name as results
FROM Users INNER JOIN MovieRating USING(user_id)
GROUP BY user_id 
ORDER BY count(rating) DESC, name
LIMIT 1)

UNION ALL

(SELECT title as results
FROM Movies 
INNER JOIN MovieRating USING(movie_id)
where MONTH(created_at)="02" AND YEAR(created_at)="2020"
GROUP BY title
ORDER BY AVG(rating) DESC , title 
LIMIT 1)

