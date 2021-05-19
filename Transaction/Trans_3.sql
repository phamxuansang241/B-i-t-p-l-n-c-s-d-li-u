DELIMITER $$

CREATE PROCEDURE INSERT_COURSE(
IN p_ID VARCHAR(25), 
IN p_course_id VARCHAR(8), 
IN p_sec_id VARCHAR(8),
IN p_semester VARCHAR(6),
IN p_year DECIMAL(4,0), 
IN p_grade VARCHAR(2))

BEGIN

START TRANSACTION;

SELECT @flag:=COUNT(p_ID) FROM takes WHERE
ID = p_ID AND course_id AND p_course_id AND sec_id = p_sec_id
AND semester = p_semester AND year = p_year;
    
IF (@flag = 0)
THEN ROLLBACK;
END IF;

INSERT INTO ;
SELECT @credit:=
END$$

DELIMITER ;

