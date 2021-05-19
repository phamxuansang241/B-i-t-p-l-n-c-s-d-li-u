DELIMITER ??
CREATE PROCEDURE insert_teaches (
	IN new_id VARCHAR(5),
    IN new_courseid VARCHAR (8),
    IN new_secid VARCHAR (8),
    IN new_semester VARCHAR(6),
    IN new_year DECIMAL(4,0)
)
BEGIN
	INSERT INTO teaches (ID, course_id, sec_id, semester, year)
	VALUES (new_id, new_courseid, new_secid, new_semester, new_year);
END ??
DELIMITER ;
CALL insert_teaches ('14001', '101' , '3', 'Summer', 2021);
SELECT * FROM teaches;