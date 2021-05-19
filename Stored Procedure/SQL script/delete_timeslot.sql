DELIMITER $$
DROP PROCEDURE IF EXISTS `time_slot_Delete`$$
CREATE PROCEDURE `time_slot_Delete` (IN p_time_slot_id varchar(4),
IN p_day varchar(1),
IN p_start_hr decimal(2,0),
IN p_start_min decimal(2,0))
BEGIN
    DELETE FROM time_slot
    WHERE
        time_slot_id = p_time_slot_id AND 
day = p_day AND 
start_hr = p_start_hr AND 
start_min = p_start_min;
END$$
DELIMITER ;
SELECT * FROM time_slot;