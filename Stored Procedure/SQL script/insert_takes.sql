DELIMITER ??
CREATE PROCEDURE insert_takes (
	IN new_ID VARCHAR(5),
    IN new_courseid VARCHAR(8),
    IN new_secid VARCHAR(8),
    IN new_semester VARCHAR (6),
    IN new_year DECIMAL (4,0),
    IN new_grade VARCHAR(2)
)
BEGIN
	INSERT INTO takes (ID, course_id, sec_id, semester, year, grade)
	VALUES (new_ID, new_courseid, new_secid, new_semester, new_year, new_grade);
END ??
DELIMITER ;
CALL insert_takes ('1001', '101', '3', 'Summer', 2021, 'A+');
SELECT * FROM takes;