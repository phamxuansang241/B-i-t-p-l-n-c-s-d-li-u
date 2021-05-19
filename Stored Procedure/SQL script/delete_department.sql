DELIMITER $$
CREATE PROCEDURE delete_department (IN p_dept_name varchar(20))
BEGIN
    DELETE FROM department
    WHERE
        dept_name = p_dept_name;
END $$
DELIMITER ;
SELECT * FROM department;