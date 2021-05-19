DELIMITER $$
DROP PROCEDURE IF EXISTS `instructor_Delete`$$
CREATE PROCEDURE `instructor_Delete` (IN p_ID varchar(25))
BEGIN
    DELETE FROM instructor
    WHERE
        ID = p_ID;
END$$
DELIMITER ;
SELECT * FROM instructor
