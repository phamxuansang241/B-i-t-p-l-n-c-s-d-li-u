/*Viết hàm thủ tục update cột teacher theo course_id & secid trong teaches*/
DELIMITER ??
CREATE PROCEDURE update_teaches (
	IN new_teacher VARCHAR(20),
    IN p_courseid VARCHAR(8),
    IN p_secid VARCHAR(8)
)
BEGIN
	UPDATE teaches
    SET teacher = new_teacher
    WHERE course_id = p_courseid
	AND sec_id = p_secid;
END ??
DELIMITER ;
CALL update_teaches ('Mari', '200', 1);
SELECT * FROM teaches;