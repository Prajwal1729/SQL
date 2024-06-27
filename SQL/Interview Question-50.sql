use practice;

CREATE TABLE Products2(product_id int Primary KEY,product_name varchar(20),product_category varchar(20));
CREATE TABLE Orders(product_id int,order_date date,unit int);

INSERT INTO Products2 Values(1,"Leetcode Solutions","Book"),
(2,"Jewels of Stringoogy","Book"),
(3,"HP","Laptop"),
(4,"Lenevo","Laptop"),
(5,"Leetcode Kit","T-shirt");

INSERT INTO Orders Values(1,"2020-02-05",60),
(1,"2020-02-10",70),
(2,"2020-01-18",30),
(2,"2020-02-11",80),
(3,"2020-02-17",2),
(3,"2020-02-24",3),
(4,"2020-03-01",20),
(4,"2020-03-04",30),
(4,"2020-03-04",60),
(5,"2020-02-25",50),
(5,"2020-02-27",50),
(5,"2020-03-01",50);


SELECT product_name,SUM(unit) as unit
FROM Products2 INNER JOIN Orders USING(product_id)
WHERE MONTH(order_date) = 2  AND YEAR(order_date)=2020
GROUP BY product_name
HAVING unit>=100;