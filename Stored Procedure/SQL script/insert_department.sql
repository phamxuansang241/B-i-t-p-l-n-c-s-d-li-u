DELIMITER ??
CREATE PROCEDURE insert_department (
	IN new_deptname VARCHAR(20),
    IN new_building VARCHAR(15),
    IN new_budget DECIMAL(12,2)
)
BEGIN
	INSERT INTO department (dept_name, building, budget)
    VALUES (new_deptname, new_building, new_budget);
END ??
DELIMITER ;
CALL insert_department('Informatic', 'ABCDEF', 900000.99);
SELECT * FROM department;