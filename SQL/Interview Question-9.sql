use practice;

CREATE TABLE Visits(visit_id int,customer_id int);
CREATE TABLE Transactions(transaction_id int,visit_id int,amount int);

INSERT INTO Visits Values(1,23),
(2,9),
(4,30),
(5,54),
(6,96),
(7,54),
(8,54);

INSERT INTO Transactions Values(2,5,310),
(3,5,300),
(9,5,200),
(12,1,910),
(13,2,970);

SELECT v.customer_id, COUNT(customer_id) as count_no_trans
FROM Visits v LEFT JOIN 
Transaction t on v.visit_id = t.visit_id
WHERE t.transaction_id is NULL GROUP BY v.customer_id;
