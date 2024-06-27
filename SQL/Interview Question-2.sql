CREATE DATABASE Practice;
USE Practice;

CREATE TABLE Products(product_id int primary key,low_fats ENUM("Y","N"), recyclabel ENUM("Y","N"));
INSERT INTO Products VALUES(0,"Y","N"),
(1,"Y","Y"),
(2,"Y","N"),
(3,"Y","Y"),
(4,"Y","N");
SELECT product_id from Products where low_fats = 'Y' AND recyclabel = 'Y';