/*Viết hàm thủ tục update cột i_ID*/
DELIMITER ??
CREATE PROCEDURE update_advisor (
	IN new_iID VARCHAR(8),
    IN sID VARCHAR(8)
)
BEGIN
	UPDATE advisor
    SET i_ID = new_iID
    WHERE s_ID = sID;
END ??
DELIMITER ;
CALL update_advisor('14001', '1001'); 
SELECT * FROM advisor;