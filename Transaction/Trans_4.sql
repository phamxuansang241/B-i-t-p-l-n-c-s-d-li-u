DELIMITER $$

CREATE PROCEDURE Trans_4_Takes_(
IN p_ID VARCHAR(5), 
IN p_course_id VARCHAR(8), 
IN p_sec_id DECIMAL(8),
IN p_semester VARCHAR(6),
IN p_year DECIMAL(4,0))

BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION     
BEGIN
	SHOW ERRORS;  
	ROLLBACK;  
END; 
START TRANSACTION;

SELECT @flag_fi := COUNT(course_id) FROM course WHERE course_id = p_course_id;    

SELECT @flag_se := COUNT(course_id) FROM takes 
WHERE course_id = p_course_id AND ID = p_ID AND semester = p_semester AND year = p_year;

INSERT INTO takes(ID, course_id, sec_id, semester, year, grade) 
    VALUES (p_ID, p_course_id, p_sec_id, p_semester, p_year, 0);

SELECT @flag_th := SUM(credits) FROM takes AS a LEFT JOIN course AS b 
ON a.course_id = b.course_id WHERE ID = p_ID AND semester = p_semester AND year = p_year;

IF (@flag_se != 0 OR @flag_fi = 0 OR @flag_th > 24) THEN 
ROLLBACK;
ELSE COMMIT;
END IF; 

SELECT @flag_fi, @flag_se, @flag_th;
END$$

DELIMITER ;

