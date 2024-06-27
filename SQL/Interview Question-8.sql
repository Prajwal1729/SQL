use practice;

CREATE TABLE Sales(sale_id int PRIMARY KEY,product_id int,year int,quantity int,price int);
CREATE TABLE Product(product_id int PRIMARY KEY,product_name varchar(20));

INSERT INTO Sales Values(1,100,2008,10,5000),
(2,100,2009,12,5000),
(7,200,2011,15,9000);

INSERT INTO Product Values(100,"Nokia"),
(200,"Apple"),
(300,"Samsung");

SELECT p.product_name,s.year,s.price FROM Sales s LEFT JOIN Product p on s.product_id = p.product_id;

