/*Viết hàm thủ tục update cột grade theo cột semester & year bang takes*/
DELIMITER ??
CREATE PROCEDURE update_takes (
	IN semester VARCHAR(20),
    IN year DECIMAL (4,0),
    IN new_grade VARCHAR(2)
)
BEGIN
	UPDATE takes
    SET grade = new_grade
    WHERE semester = semester
		AND year = year;
END ??
DELIMITER ;
CALL update_takes ('Spring', 2003, 'A+');
SELECT * FROM takes;