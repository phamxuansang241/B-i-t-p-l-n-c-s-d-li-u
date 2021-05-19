/*Viết hàm thủ tục update cột credits theo title & deptname bang course*/
DELIMITER ??
CREATE PROCEDURE update_course (
    IN title VARCHAR(50),
    IN deptname VARCHAR(20),
    IN credits DECIMAL(2,0)
)
BEGIN
	UPDATE course
    SET credits = credits
    WHERE title = title 
        AND dept_name = deptname;
END ??
DELIMITER ;
CALL update_course ('Image Processing', 'Astronomy', 3);
SELECT * FROM course;