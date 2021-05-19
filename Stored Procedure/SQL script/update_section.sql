/*Viết hàm thủ tục update cột time_slot_id theo cột course_id và sec_id ở bảng section*/
DELIMITER ??
CREATE PROCEDURE update_section (
	IN courseid VARCHAR(8),
    In secid VARCHAR(8),
    IN new_timeslotid VARCHAR(4)
)
BEGIN
	UPDATE section
    SET time_slot_id = new_timeslotid
    WHERE
		course_id = courseid
	AND
		sec_id = secid;
END ??
DELIMITER ;
CALL update_section ('105', '2', 'A+'); 
SELECT * FROM section;