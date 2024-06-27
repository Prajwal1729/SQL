USE practice;

CREATE TABLE Views(article_id int,author_id int,viewer_id int,view_date date);

INSERT INTO Views Values(1,3,5,"2019-08-01"),
(1,3,6,"2019-08-02"),
(2,7,7,"2019-08-01"),
(2,7,6,"2019-08-02"),
(4,7,1,"2019-07-22"),
(3,4,4,"2019-07-21"),
(3,4,4,"2019-07-21");

SELECT DISTINCT author_id as id from Views where author_id = viewer_id ORDER by id;
