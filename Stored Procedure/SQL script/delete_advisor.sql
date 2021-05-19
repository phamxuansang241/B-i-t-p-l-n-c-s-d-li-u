DELIMITER $$
CREATE PROCEDURE delete_advisor (
IN p_s_ID VARCHAR (25),
IN p_i_ID VARCHAR(25)
)
BEGIN
    DELETE FROM advisor
    WHERE s_ID = p_s_ID
		AND i_ID = p_i_ID;
END $$
DELIMITER ;
SELECT * FROM advisor