DELIMITER $$
DROP PROCEDURE IF EXISTS `takes_Delete`$$
CREATE PROCEDURE `takes_Delete` (
	IN p_ID varchar(25),
	IN p_course_id varchar(8),
	IN p_sec_id varchar(8),
	IN p_semester varchar(6),
	IN p_year decimal(4,0))
BEGIN
    DELETE FROM takes
    WHERE
        ID = p_ID AND 
		course_id = p_course_id AND 
		sec_id = p_sec_id AND 
		semester = p_semester AND 
		year = p_year;
END$$
DELIMITER ;
select * from takes;