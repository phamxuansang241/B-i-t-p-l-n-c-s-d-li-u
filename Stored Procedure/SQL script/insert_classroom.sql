DELIMITER ??
CREATE PROCEDURE insert_classroom (
	IN new_building VARCHAR(15),
    IN new_roomnumber VARCHAR(7),
    IN new_capacity DECIMAL(4,0)
)
BEGIN
	INSERT INTO classroom (building, room_number, capacity)
    VALUES (new_building, new_roomnumber, new_capacity);
END ??
DELIMITER ;
CALL insert_classroom('ABCDE', '123', 45);
SELECT * FROM classroom;