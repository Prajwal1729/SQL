USE practice;
CREATE TABLE Tweets(tweet_id int PRIMARY KEY,content varchar(100));

INSERT INTO Tweets VALUES(1,"Vote for Biden"),
(2,"Let us make America great again");

SELECT tweet_id from Tweets WHERE char_length(content) > 15;
