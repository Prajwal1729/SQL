use practice;

CREATE TABLE Insurance(pid int PRIMARY KEY, tiv_2015 float,tiv_2016 float,lat float,lon float);

INSERT INTO Insurance Values(1,10,5,10,10),
(2,20,20,20,20),
(3,10,30,20,20),
(4,10,40,40,40);


SELECT ROUND(SUM(tiv_2016),2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN(
   SELECT tiv_2015
   FROM Insurance 
   GROUP BY tiv_2015
   HAVING COUNT(*) > 1
)
AND (lat,lon) IN(
  SELECT lat,lon
  FROM Insurance 
  GROUP BY lat,lon
  HAVING COUNT(*) = 1
)
