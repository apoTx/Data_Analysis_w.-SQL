

CREATE TABLE DEMO4
(User_id INT NOT NULL , 
Action NVARCHAR(50) NOT NULL,
date date
);

INSERT INTO DEMO4 (User_id, Action,date)
VALUES  (1, 'Start','1-1-20'),
		(1, 'Cancel','1-2-20'),
		(2, 'Start','1-3-20'),
		(2, 'Publish','1-4-20'),
		(3, 'Start','1-5-20'),
		(3, 'Cancel','1-6-20'),
		(1, 'Start','1-7-20'),
		(1, 'Publish','1-8-20');
select * from DEMO4

-- retrieve count of starts, cancels, and publishes for each user
SELECT User_id,
sum(CASE WHEN Action like 'start' THEN 1 ELSE 0 END) as starts,
sum(CASE WHEN Action like 'cancel' THEN 1 ELSE 0 END) as cancels, 
sum(CASE WHEN Action like 'publish' THEN 1 ELSE 0 END) as publishes
INTO rates
FROM DEMO4
GROUP BY User_id

--- Calculate publication, 
--- cancelation rate for each user by dividing by number of starts,
--- casting as float by multiplying by 1.0

SELECT  User_id,
		CAST(publishes AS FLOAT)/CAST(starts AS FLOAT) AS Publish_rate,
		CAST(cancels AS FLOAT)/CAST(starts AS FLOAT) AS Cancel_rate 
FROM DEMO4
ORDER BY User_id ASC

