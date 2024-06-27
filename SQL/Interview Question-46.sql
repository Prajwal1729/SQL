use practice;

CREATE TABLE Patients(patient_id int Primary Key,patient_name varchar(20),conditions varchar(20));

INSERT INTO Patients Values(1,"Daniel","YFEV COUGH"),
(2,"Alice",""),
(3,"Bob","DIAB100 MYOP"),
(4,"George","ACNE DIAB100"),
(5,"Alian","DIAB201");

SELECT *
FROM Patients 
WHERE conditions LIKE ("DIAB1%") or conditions LIKE ("%DIAB1%");