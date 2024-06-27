use practice;

CREATE TABLE Users2(user_id int Primary Key,name varchar(20),mail varchar(1000));

INSERT INTO Users2 Values(1,"Winston","winston@leetcode.com"),
(2,"Jonathan","johnathanisgreat"),
(3,"Annabelle","bella-@leetcode.com"),
(4,"Sally","sally.come@leetcode.com"),
(5,"Marwan","quarz#2020@leetcode.com"),
(6,"David","david69@gmail.com"),
(7,"Shapiro",".shapo@leetcode.com");

SELECT*
from Users2
WHERE mail REGEXP '^[A-Za-z][A-Za-z0-9_\.\-]*@leetcode[.]com$'
