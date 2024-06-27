use practice;

CREATE TABLE Products1(product_id int,new_price int,change_date date);

INSERT INTO Products1 Values(1,20,"2019-08-14"),
(2,50,"2019-08-14"),
(1,30,"2019-08-15"),
(1,35,"2019-08-16"),
(2,65,"2019-08-17"),
(3,20,"2019-08-18");

SELECT product_id, new_price as price
FROM Products1 where (product_id,change_date) in(
SELECT product_id,MAX(change_date)
FROM Products1 WHERE change_date <= "2019-08-16"
GROUP BY product_id
)
UNION
SELECT product_id, 10 as price FROM Products1
WHERE product_id NOT IN(
select product_id from Products1
WHERE change_date<="2019-08-16"
);

