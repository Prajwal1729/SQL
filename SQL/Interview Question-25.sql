use practice;

CREATE TABLE Activity1(user_id int, session_id int,acitivity_date date,acitivity_type ENUM("open_session",
"end_session","scroll_down","send_message"));

INSERT INTO Activity1 values(1,1,"2019-7-20","open_session"),
(1,1,"2019-07-20","scroll_down"),
(1,1,"2019-07-20","end_session"),
(2,4,"2019-07-20","open_session"),
(2,4,"2019-07-21","send_message"),
(2,4,"2019-07-21","end_session"),
(3,2,"2019-07-21","open_session"),
(3,2,"2019-07-21","send_message"),
(3,2,"2019-07-21","end_session"),
(4,3,"2019-06-25","open_session"),
(4,3,"2019-06-25","end_session");

SELECT acitivity_date as day,COUNT(distinct user_id) as activity_users
from Activity1 where acitivity_date>="2019-06-28" AND acitivity_date<="2019-07-27" group by acitivity_date;