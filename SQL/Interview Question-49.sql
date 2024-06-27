use practice;

CREATE TABLE Activities(sell_date date,product varchar(20));

INSERT INTO Activities Values("2020-05-30","Headphone"),
("2020-06-01","Pencil"),
("2020-06-02","Mask"),
("2020-05-30","BasketBall"),
("2020-06-01","Bible"),
("2020-06-02","Mask"),
("2020-05-30","T-Shirt");

SELECT sell_date,COUNT(distinct product) as num_sold,group_concat( distinct product ORDER BY product
separator ',') AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date,products;