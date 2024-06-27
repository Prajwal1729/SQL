-- Window Function

USE student1;
CREATE TABLE Products(product_category varchar(20),brand varchar(20),product_name varchar(20),price int);

INSERT INTO Products Values("Phone","Apple","Iphone 12 Max Pro",1300),
("Phone","Apple","Iphone 12 Pro",1100),
("Phone","Apple","Iphone 12",1000),
("Phone","Samsung","Galaxy Z Fold 3",1800),
("Phone","Samsung","Galaxy Z Flip 3",1000),
("Phone","Samsung","Galaxy Note 20",1200),
("Phone","Samsung","Galaxy S21",1000),
("Phone","OnePlus","OnePlus Nord",300),
("Phone","OnePlus","OnePlus 9",800),
("Phone","Google","Pixel 5",600),
("Laptop","Apple","Macbook Pro13",2000),
("Laptop","Apple","Macbook Air",1200),
("Laptop","Microsoft","Surface Laptop 4",2100),
("Laptop","Dell","XPS 13",2000),
("Laptop","Dell","XPS 15",2300),
("Laptop","Dell","XPS 17",2500),
("Earphone","Apple","Airdops Pro",280),
("Earphone","Samsung","Galaxy Buds Pro",220),
("Earphone","Samsung","Galaxy Buds Live",170),
("EarPhone","Sony","WF-1000XM4",250),
("HeadPhone","Sony","WF-1000XM4",400),
("HeadPhone","Apple","Airdops Max",550),
("HeadPhone","Microsoft","Surface HeadPhones 2",250),
("SmartWatch","Apple","Apple Watch Series 6",1000),
("SmartWatch","Apple","Apple Watch SE",400),
("SmartWatch","Samsung","Galaxy Watch 4",600),
("SmartWatch","OnePlus","OnePlus Watch",220);

SELECT * FROM Products;

-- FIRST_VALUE: To fetched the very first from partition.
-- whenever we use window function we should use over clause
-- write a query to fetched most expensive product under each category.

SELECT *,
FIRST_VALUE(product_name) over(partition by product_category order by price DESC) as most_exp_product
FROM Products;

-- LAST_VALUE: To fetched the last record from particular partition.

SELECT *,
FIRST_VALUE(product_name) over(partition by product_category order by price DESC) as most_exp_product,
LAST_VALUE(product_name) over(partition by product_category order by price) as least_exp_product
FROM Products;

-- FRAME_CLAUSE: It is subset of partition of which the category belongs.

SELECT *,
FIRST_VALUE(product_name) over(partition by product_category order by price DESC) 
as most_exp_product,
LAST_VALUE(product_name) over(partition by product_category order by price DESC
range between 2 preceding and 2 following) 
as least_exp_product
FROM Products
WHERE product_category="Phone";

-- Alternate way:
SELECT *,
FIRST_VALUE(product_name) over w as most_exp_product,
LAST_VALUE(product_name) over w as least_exp_product
FROM Products
-- window clause
window w as (partition by product_category order by price desc 
             range between unbounded preceding and unbounded following);
             
-- NTH_VALUE: fetched the value under each partition.
-- Second most expensive product under each category.
SELECT *,
NTH_VALUE(product_name,2) over(partition by product_category order by price desc)  
as second_most_exp
FROM Products;

-- Alternate way:
SELECT *,
FIRST_VALUE(product_name) over w as most_exp_product,
LAST_VALUE(product_name) over w as least_exp_product,
NTH_VALUE(product_name,2) over w as second_most_exp
FROM Products
window w as(partition by product_category order by price DESC 
range between unbounded preceding and unbounded following);

-- NTILE: To group a data from the certain partition and place under the bucket.
-- write a query to segregate all the expensive phones,mid ranges phines and cheaper phones
SELECT *,
NTILE(3) over(order by price DESC) AS buckets
FROM Products
where product_category = "Phone";

SELECT product_name,
CASE when x.buckets = 1 then "Expensive Phones"
	 WHEN x.buckets = 2 then "Mid Range Phones"
     WHEN x.buckets = 3 then "Cheaper Phones" END phone_category
from(
    select *,
    NTILE(3) over(order by price DESC) as buckets
    FROM Products
    where product_category = "Phone") x;

-- CUME_DIST(Cumlative distribution): To find the the distribution percentage of all rows under the dataset.
-- Write a query to fetched all the products which as constituting the first 30% of the data in the
-- products table based on price.
SELECT product_name, (cume_dist_percentage|| '%') as cume_dist_percentage
FROM(
	SELECT *,
	CUME_DIST() over(order by price desc) as cume_distribution,
	ROUND(CUME_DIST() over(order by price desc) * 100,2) as cume_dist_percentage
	FROM Products) x
where x.cume_dist_percentage <= 30;

-- PERCENT_RANK: Percentage rank, relative rank of each row in the form of percentage.
-- Write a Query to identify how much percentage more expensive 
-- is "Galaxy Z Fold 3" when compared to all products.

SELECT *,
PERCENT_RANK() over(order by price) as percentage_rank,
ROUND(PERCENT_RANK() over(order by price) *100,2) as percentage_rank
FROM Products;

SELECT product_name, per_rank
FROM (
  SELECT *,
  PERCENT_RANK() over(order by price) as percentage_rank,
  ROUND(PERCENT_RANK() over(order by price) * 100,2) as per_rank
  FROM Products) x
WHERE x.product_name = "Galaxy Z Fold 3";















