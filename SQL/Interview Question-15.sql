use practice1;

CREATE TABLE Signups(user_id int,time_stamp datetime);
CREATE TABLE Confirmations(user_id int,time_stamp datetime,action ENUM("confirmed","timeout"));

INSERT INTO Signups VALUES(3,"2020-03-21 10:16:13"),
(7,"2020-01-04 13:57:59"),
(2,"2020-07-29 23:09:44"),
(6,"2020-12-09 10:39:37");

INSERT INTO Confirmations VALUES(3,"2021-01-06 03:30:46","timeout"),
(3,"2021-07-14 14:00:00","timeout"),
(7,"2021-06-12 11:57:29","confirmed"),
(7,"2021-01-13 12:58:28","confirmed"),
(7,"2021-01-14 13:59:27","confirmed"),
(2,"2021-01-22 00:00:00","confirmed"),
(2,"2021-02-28 23:59:59","timeout");

SELECT s.user_id, IFNULL(ROUND(SUM(action='confirmed')/COUNT(*),2),0.00) as confirmation_rate
FROM Signups s LEFT JOIN Confirmations c on s.user_id = c.user_id GROUP BY s.user_id;







