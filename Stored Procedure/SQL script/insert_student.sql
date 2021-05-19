DELIMITER ??
CREATE PROCEDURE insert_student (
	IN new_ID VARCHAR(5),
    IN new_name VARCHAR (20),
    IN new_deptname VARCHAR (20),
    IN new_totcred DECIMAL(3,0)
)
BEGIN
	INSERT INTO student (ID, name, dept_name, tot_cred)
	VALUES (new_ID, new_name, new_deptname, new_totcred);
END ??
DELIMITER ;
CALL insert_student ('1001', 'XuanSang', 'Geology', 100);
SELECT * FROM student;