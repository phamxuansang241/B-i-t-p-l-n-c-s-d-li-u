DELIMITER ??
CREATE PROCEDURE insert_course (
	IN new_courseid INT,
    IN new_title VARCHAR (100),
    IN new_deptname VARCHAR (100),
    IN new_credits INT
)
BEGIN
	INSERT INTO course (course_id, title, dept_name, credits)
	VALUES (new_courseid, new_title, new_deptname, new_credits);
END ??
DELIMITER ;
CALL insert_course (102, 'Probability', 'Math', 3);
CALL insert_course (103, 'Statistical astronomy', 'Astronomy', 4);
SELECT * FROM course;