use practice;

CREATE TABLE RequestAccepted(requester_id int,accepted_id int,accept_date date);
INSERT INTO RequestAccepted VALUES(1,2,"2016-06-03"),
(1,3,"2016-06-08"),
(2,3,"2016-06-08"),
(3,4,"2016-06-09");

SELECT id,COUNT(*) as num
FROM(
	SELECT requester_id as id FROM RequestAccepted

	UNION ALL
    
	SELECT accepted_id as id FROM RequestAccepted
) as friends_count
GROUP BY id
ORDER BY num DESC 
LIMIT 1;