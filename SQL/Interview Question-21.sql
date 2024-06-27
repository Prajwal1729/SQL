use practice1;

CREATE TABLE Transactions(id int,country varchar(20),state ENUM("approved","declined"),amount int,tran_date date);
INSERT INTO Transactions Values(121,"US","approved",1000,"2018-12-18"),
(122,"US","declined",2000,"2018-12-19"),
(123,"US","approved",2000,"2019-01-01"),
(124,"DE","approved",2000,"2019-01-07");

SELECT date_format(tran_date,"%Y-%m") as month,
country,
COUNT(id) as trans_count,
SUM(state="approved") as approved_count,
SUM(amount) as trans_total_amount,
SUM(IF(state="approved",amount,0)) as approved_total_amount
FROM Transactions GROUP BY month,country;