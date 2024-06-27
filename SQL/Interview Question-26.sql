use practice;

CREATE TABLE Sales1(sale_id int,product_id int,year int,quantity int,price int);
CREATE TABLE Product1(product_id int,product_name varchar(20));

INSERT INTO Sales1 values(1,100,2008,10,5000),
(2,100,2009,12,5000),
(7,200,2011,15,9000);

INSERT INTO Product1 Values(100,"Nokia"),
(200,"Apple"),
(300,"Samsung");

SELECT distinct product_id, year as first_year, quantity, price
FROM Sales1
WHERE(product_id,year) in (
SELECT product_id, MIN(year) as first_year from Sales1 
Group By product_id);
