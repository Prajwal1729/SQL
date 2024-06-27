USE practice1;

CREATE TABLE Activity(machine_id int,process_id int,activity_type enum("start","end"),timestamp float);

INSERT INTO Activity Values(0,0,"start",0.712),
(0,0,"end",1.520),
(0,1,"start",3.140),
(0,1,"end",4.120),
(1,0,"start",0.550),
(1,0,"end",1.550),
(1,1,"start",0.430),
(1,1,"end",1.420),
(2,0,"start",4.100),
(2,0,"end",4.512),
(2,1,"start",2.500),
(2,1,"end",5.000);

SELECT a1.machine_id,round(AVG(a2.timestamp - a1.timestamp),3) as processing_time
FROM Activity a1 INNER JOIN Activity a2
on a1.process_id = a2.process_id
AND a1.machine_id = a2.machine_id
AND a1.timestamp < a2.timestamp
GROUP BY a1.machine_id;
