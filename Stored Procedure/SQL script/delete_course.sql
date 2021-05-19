DELIMITER $$
CREATE PROCEDURE delete_course (IN p_deptname varchar(20))
BEGIN
    DELETE FROM course
    WHERE
        dept_name = p_deptname;
END$$
DELIMITER ;
SELECT * FROM course