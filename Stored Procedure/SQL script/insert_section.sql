DELIMITER ??
CREATE PROCEDURE insert_section (
	IN new_courseid VARCHAR(8),
    IN new_secid VARCHAR(8),
    IN new_semester VARCHAR(6),
    IN new_year DECIMAL(4,0)
)
BEGIN
	INSERT INTO section (course_id, sec_id, semester, year)
    VALUES (new_courseid, new_secid, new_semester, new_year);
END ??
DELIMITER ;
CALL insert_section('101', '3', 'Summer', 2021);
SELECT * FROM section;