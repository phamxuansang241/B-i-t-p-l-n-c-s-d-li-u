DELIMITER ??
CREATE PROCEDURE insert_timeslot (
	IN new_timeslotid VARCHAR(4),
    IN new_day VARCHAR(1),
    IN new_starthr DECIMAL (2,0),
    IN new_startmin DECIMAL (2,0),
    IN new_endhr DECIMAL (2,0),
    IN new_endmin DECIMAL (2,0)
)
BEGIN
	INSERT INTO time_slot (time_slot_id, day, start_hr, start_min, end_hr, end_min)
	VALUES (new_timeslotid, new_day, new_starthr, new_startmin, new_endhr, new_endmin);
END ??
DELIMITER ;
CALL insert_timeslot ('A', 'H', 7, 45, 8, 30);
SELECT * FROM time_slot;