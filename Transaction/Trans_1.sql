DELIMITER $$

CREATE PROCEDURE INSERT_COURSE(
IN p_title VARCHAR(50), 
IN p_dept_name VARCHAR(20), 
IN p_credits DECIMAL(2,0),
IN p_course_id1 VARCHAR(8),
IN p_course_id2 VARCHAR(8))

BEGIN

START TRANSACTION;

SELECT @course_id:=MAX(course_id) + 1 FROM course;
    
INSERT INTO course(course_id, title, dept_name, credits)
VALUES(@course_id, p_title, p_dept_name, p_credits);

INSERT INTO prereq(course_id, prereq_id) 
VALUES (@course_id, p_course_id1);

INSERT INTO prereq(course_id, prereq_id) 
VALUES (p_course_id2, @course_id);

COMMIT;

END$$

DELIMITER ;

