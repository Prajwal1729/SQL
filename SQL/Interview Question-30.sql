use practice;

Create Table Customer1(customer_id int,product_key int);
CREATE TABLE Product2(product_key int);

INSERT INTO Customer1 Values(1,5),
(2,6),
(3,5),
(3,6),
(1,6);

INSERT INTO Product2 Values(5),
(6);

-- SELECT DISTINCT c.customer_id
-- FROM Customer1 c LEFT JOIN Product2 p on c.product_key = p.product_key;

SELECT customer_id
FROM Customer1 Group By customer_id HAVING COUNT(DISTINCT product_key) = (
SELECT COUNT(product_key) from Product2);