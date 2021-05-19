/*Viết hàm thủ tục update cột end_hr & end_min theo cột start_hr & start_min trong time_slot*/
DELIMITER ??
CREATE PROCEDURE update_timeslot (
IN starthr DECIMAL (2,0),
IN startmin DECIMAL (2,0)
)
BEGIN
UPDATE time_slot
SET end_hr = starthr + 1, end_min = startmin + 30
WHERE startmin < 30
	AND start_hr = starthr
		AND start_min = startmin;
 
UPDATE time_slot
SET end_hr = starthr + 2, end_min = startmin - 30
WHERE startmin >= 30
	AND start_hr = starthr
		AND start_min = startmin;
END ??
DELIMITER ;
CALL update_timeslot(7, 15);
CALL update_timeslot(7, 45);
select * from time_slot;