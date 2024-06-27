USE practice1;

CREATE TABLE Prices(product_id int,start_date date,end_date date,price int);
CREATE TABLE UnitsSold(product_id int,purchase_date date, units int);

INSERT INTO Prices values(1,"2019-02-17","2019-02-28",5),
(1,"2019-03-01","2019-03-22",5),
(2,"2019-02-01","2019-02-20",15),
(2,"2019-02-21","2019-03-31",30);

INSERT INTO UnitsSold Values(1,"2019-02-25",100),
(1,"2019-03-01",15),
(2,"2019-02-10",200),
(2,"2019-03-22",30);

SELECT p.product_id, IFNULL(ROUND(SUM(p.price*us.units)/SUM(us.units),2),0) as average_price 
FROM Prices p LEFT JOIN UnitsSold us on p.product_id = us.product_id 
AND us.purchase_date >= p.start_date
AND us.purchase_date <= p.end_date
GROUP BY p.product_id;

