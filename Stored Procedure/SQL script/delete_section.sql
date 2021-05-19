DELIMITER $$
DROP PROCEDURE IF EXISTS `section_Delete`$$
CREATE PROCEDURE `section_Delete` (
	p_courseid VARCHAR(8),
    p_secid VARCHAR(8)
)
BEGIN
    DELETE FROM section
    WHERE course_id = p_courseid
		AND sec_id = p_secid
        ;
END$$
DELIMITER ;
SELECT * FROM section;