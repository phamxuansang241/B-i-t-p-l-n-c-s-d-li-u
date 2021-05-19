/*Viết hàm thủ tục update cột salary theo cột name & dept_name bang instructor*/
DELIMITER ??
CREATE PROCEDURE update_instructor (
	IN name VARCHAR(20),
    IN deptname VARCHAR(20),
    IN new_salary DECIMAL(8,2)
)
BEGIN
	UPDATE instructor
    SET salary = new_salary
    WHERE
		name = name
	AND
		dept_name = deptname;
END ??
DELIMITER ;
CALL update_instructor ('HaiYen', 'Cybernetics', 99999.99);
CALL update_instructor ('Thy', 'Marketing', 88888.89); 
SELECT * FROM instructor;