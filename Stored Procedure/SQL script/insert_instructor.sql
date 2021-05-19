DELIMITER ??
CREATE PROCEDURE insert_instructor (
	IN new_ID VARCHAR(5) ,
    IN new_name VARCHAR(20),
	IN new_deptname VARCHAR(20),
    IN new_salary DECIMAL(8,2)
)
BEGIN
	INSERT INTO instructor (ID, name, dept_name, salary) 
    VALUES (new_id, new_name, new_deptname, new_salary);
END ??
DELIMITER ;

CALL insert_instructor('14000', 'HaiYen', 'Cybernetics', 123456.78);
CALL insert_instructor('14001', 'Thy', 'Marketing', 98752.21);
SELECT * FROM instructor;