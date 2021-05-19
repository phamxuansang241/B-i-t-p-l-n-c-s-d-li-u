DELIMITER ??
CREATE PROCEDURE insert_advisor (
	IN sID VARCHAR(5),
    IN iID VARCHAR(5)
)
BEGIN
	INSERT INTO advisor (s_ID, i_ID)
    VALUES (sID, iID);
END ??
DELIMITER ;
CALL insert_advisor('1001', '14000');
SELECT * FROM advisor;