use practice;

CREATE TABLE Accounts(account_id int PRIMARY KEY,income int);

INSERT INTO Accounts Values(3,108939),
(2,12747),
(8,87709),
(6,91796);

SELECT "Low Salary" as Category, COUNT(income) as account_count
FROM Accounts
WHERE income<20000
UNION
SELECT "Average Salary" as Category, COUNT(income) as account_count
FROM Accounts 
WHERE income>=20000 and income<=50000
UNION
SELECT "High Salary" as Category, COUNT(income) as account_count
FROM Accounts 
WHERE income>50000;