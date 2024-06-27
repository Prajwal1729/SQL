use practice;

Create Table MyNumbers(num int);

INSERT INTO MyNumbers Values(8),
(8),
(3),
(3),
(3),
(1),
(4),
(5),
(6);

SELECT MAX(num) as num FROM MyNumbers
WHERE num in(
SELECT num from MyNumbers Group By num Having COUNT(*) = 1);
