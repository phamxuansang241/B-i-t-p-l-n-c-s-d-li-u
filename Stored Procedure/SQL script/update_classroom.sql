/*Viết hàm thủ tục update cột capacity bảng classroom */
DELIMITER ??
CREATE PROCEDURE update_capacity (
	IN old_capacity DECIMAL (4,0),
    IN new_capacity DECIMAL (4,0)
)
BEGIN
	UPDATE classroom
    SET capacity = new_capacity
    WHERE capacity = old_capacity;
END ??
DELIMITER ;

CALL update_capacity(26, 62);
SELECT * FROM classroom;