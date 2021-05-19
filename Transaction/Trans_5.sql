DELIMITER $$

CREATE PROCEDURE Trans_5_Takes_(
IN p_ID VARCHAR(5), 
IN p_course_id VARCHAR(8), 
IN p_sec_id DECIMAL(8),
IN p_semester VARCHAR(6),
IN p_year DECIMAL(4,0),
IN p_grade VARCHAR(2))

BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION     
BEGIN
	SHOW ERRORS;  
	ROLLBACK;  
END; 
START TRANSACTION;

SELECT @flag_fi := COUNT(course_id) FROM course WHERE course_id = p_course_id;    

INSERT INTO takes(ID, course_id, sec_id, semester, year, grade) 
    VALUES (p_ID, p_course_id, p_sec_id, p_semester, p_year, grade);

SELECT @flag_se := grade FROM takes 
WHERE ID = p_ID AND course_id = p_course_id 
AND sec_id = p_sec_id AND semester = p_semester AND year = p_year;

SELECT @cred := credits FROM course WHERE course_id = p_course_id;

IF (@flag_fi = 0) THEN 
ROLLBACK;
ELSEIF (@flag_se != 'F') THEN
UPDATE student SET tot_cred = tot_cred + @cred WHERE ID = p_ID;
COMMIT;
ELSE COMMIT;
END IF; 

SELECT @flag_fi, @flag_se;
END$$

DELIMITER ;
