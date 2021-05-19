DELIMITER $$
CREATE PROCEDURE delete_classroom (
	IN p_building varchar(15),
	IN p_room_number varchar(7))
BEGIN
    DELETE FROM classroom
    WHERE
        building = p_building AND 
		room_number = p_room_number;
END$$
DELIMITER ;
SELECT * FROM classroom
