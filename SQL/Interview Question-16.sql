USE practice1;

CREATE TABLE Cinema(id int primary KEY,movie varchar(20),description varchar(20),rating float);

INSERT INTO Cinema Values(1,"War","great3D",8.9),
(2,"Science","fiction",8.5),
(3,"irish","boring",6.2),
(4,"Ice song","Fantacy",8.6),
(5,"House Card","Interesting",9.1);

SELECT * FROM Cinema where id%2!=0 and description!="boring";