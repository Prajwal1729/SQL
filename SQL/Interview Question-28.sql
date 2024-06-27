use practice;

CREATE TABLE Followers(user_id int, follower_id int);

INSERT INTO Followers Values(0,1),
(1,0),
(2,0),
(2,1);

SELECT user_id, COUNT(DISTINCT follower_id) as followers_count from Followers GROUP BY user_id;