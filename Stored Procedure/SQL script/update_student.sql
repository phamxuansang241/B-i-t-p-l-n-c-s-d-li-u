/*Viết hàm thủ tục update cột tot_cred theo cột name và cột dept_name bảng student */
DELIMITER ??
CREATE PROCEDURE update_student(
	IN name_col VARCHAR(20),
    IN deptname_col VARCHAR(20),
    IN new_totcred DECIMAL (3,0)
)
BEGIN
	UPDATE student
    SET tot_cred = new_totcred
    WHERE
		name = name_col
	AND 
		dept_name = deptname_col;
END ??
DELIMITER ;
CALL update_student ('Duan', 'Civil Eng.', 444);
SELECT * FROM student