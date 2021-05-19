DELIMITER $$

DROP PROCEDURE IF EXISTS `student_Delete`$$
CREATE PROCEDURE `student_Delete` (IN p_ID varchar(25))
BEGIN
    DELETE FROM student
    WHERE
        ID = p_ID;
END$$

DELIMITER ;
SELECT * FROM student;