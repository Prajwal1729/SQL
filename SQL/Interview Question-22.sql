use practice1;

CREATE TABLE Delivery(delivery_id int,customer_id int,order_date date,customer_pre_delivery_date date);

INSERT INTO Delivery Values(1,1,"2019-08-01","2019-08-02"),
(2,2,"2019-08-02","2019-08-02"),
(3,1,"2019-08-11","2019-08-12"),
(4,3,"2019-08-24","2019-08-24"),
(5,3,"2019-08-21","2019-08-22"),
(6,2,"2019-08-11","2019-08-13"),
(7,4,"2019-08-09","2019-08-09");

SELECT ROUND(SUM(IF(order_date = customer_pre_delivery_date,1,0))*100/count(distinct customer_id))
AS immdiate_percentage
FROM Delivery
WHERE(customer_id,order_date) IN(
SELECT customer_id, MIN(order_date) as first_order_date
FROM Delivery GROUP BY customer_id
);