/*Viết hàm thủ tục update cột grade theo cột semester & year bang takes*/
DELIMITER ??
CREATE PROCEDURE update_takes1 (
	IN p_semester VARCHAR(20),
    IN p_year DECIMAL (4,0),
    IN new_grade VARCHAR(2)
)
BEGIN
	UPDATE takes
    SET grade = new_grade
    WHERE semester = p_semester
		AND year = p_year;
END ??
DELIMITER ;
CALL update_takes1 ('Spring', 2003, 'C+');

SELECT * FROM takes;