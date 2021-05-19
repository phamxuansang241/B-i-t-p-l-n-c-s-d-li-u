DELIMITER $$
DROP PROCEDURE IF EXISTS delete_prereq $$
CREATE PROCEDURE delete_prereq (
	IN p_course_id varchar(8),
	IN p_prereq_id varchar(8))
BEGIN
    DELETE FROM prereq
    WHERE
        course_id = p_course_id 
	AND 
		prereq_id = p_prereq_id;
END$$
DELIMITER ;
SELECT * FROM prereq;