use practice;

CREATE TABLE Customer2(customer_id int,name varchar(20),visited_on date,amount int);

INSERT INTO Customer2 Values(1,"Jhon","2019-01-01",100),
(2,"Daniel","2019-01-02",110),
(3,"Jade","2019-01-03",120),
(4,"Khaled","2019-01-04",130),
(5,"Winston","2019-01-05",110),
(6,"Elvis","2019-01-06",140),
(7,"Anna","2019-01-07",150),
(8,"Maria","2019-01-08",80),
(9,"Jaze","2019-01-09",110),
(1,"Jhon","2019-01-10",130),
(3,"Jade","2019-01-10",150);


SELECT visited_on,
     (
     select SUM(amount)
     FROM Customer2
     WHERE visited_on BETWEEN DATE_SUB(c.visited_on,INTERVAL 6 day)
     AND c.visited_on
     ) as amount,
     ROUND((
     select SUM(amount)/7
     FROM Customer2 
     WHERE visited_on BETWEEN DATE_SUB(c.visited_on,INTERVAL 6 day)
     AND c.visited_on
     ),2) as average_amount
FROM Customer2 c 
WHERE visited_on >=(
SELECT DATE_ADD(min(visited_on),INTERVAL 6 DAY)
FROM Customer2
)
group by visited_on
ORDER by visited_on;