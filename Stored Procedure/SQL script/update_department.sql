/*Viết hàm thủ tục update cột buget theo dept_name & building bang department*/
DELIMITER ??
CREATE PROCEDURE update_department (
	IN deptname VARCHAR(20),
    IN building VARCHAR(15),
    IN new_budget DECIMAL(12,2)
)
BEGIN
	UPDATE department
    SET budget = new_budget
    WHERE
		dept_name = deptname
	AND
		building = building;
END ??
DELIMITER ;
CALL update_department ('Accounting', 'Saucon', 10044.55); 
SELECT * FROM department;