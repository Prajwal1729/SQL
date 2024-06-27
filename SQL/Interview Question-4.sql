USE Practice;

CREATE TABLE WORLD(name varchar(20) PRIMARY KEY,continent varchar(20),area int,population int,gdp int);
INSERT INTO WORLD VALUES("AFG","Asia",652230,25500100,2034300000),
("ALB","Europe",28748,2831741,12960000000),
("ALG","Africa",2381741,37100000,18868100000),
("AND","Europe",468,78115,3712000000),
("ANG","Africa",1246700,20609294,100990000000);

SELECT name,population,area FROM WORLD where area>=3000000 or population>=25000000;
