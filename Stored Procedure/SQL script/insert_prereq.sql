DELIMITER ??
CREATE PROCEDURE insert_prereq (
	IN new_courseid VARCHAR (8),
    IN new_pID VARCHAR (8)
)
BEGIN
	INSERT INTO prereq (course_id, prereq_id)
	VALUES (new_courseid, new_pID);
END ??
DELIMITER ;
CALL insert_prereq ('103', '102');
SELECT * FROM prereq;