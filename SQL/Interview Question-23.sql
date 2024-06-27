USE practice;

Create table Activity(player_id int,device_id int,event_date date,games_played int);

INSERT INTO Activity Values(1,2,"2016-03-01",5),
(1,2,"2016-03-02",6),
(2,3,"2017-06-25",1),
(3,1,"2016-03-02",0),
(3,4,"2018-07-03",5);

SELECT ROUND(COUNT(DISTINCT player_id)/(select COUNT(DISTINCT player_id)
FROM Activity),2) AS fraction
FROM Activity
where (player_id,DATE_SUB(event_date,INTERVAL 1 DAY)) in (
SELECT player_id, min(event_date) as first_login 
FROM Activity 
GROUP BY player_id
);
