/*Viết hàm thủ tục update cột prereqNumber theo sourse_id & prereq_id trong prereq*/
ALTER TABLE prereq
ADD COLUMN prereqNumber VARCHAR(10);
DELIMITER ??
CREATE PROCEDURE update_prereq (
	IN new_pNumber VARCHAR(5),
	IN cID VARCHAR(5),
    IN pID VARCHAR(5)
)
BEGIN
	UPDATE prereq
    SET prereqNumber = new_pNumber
    WHERE course_id = cID
		AND prereq_id = pID;
END ??
DELIMITER ;
CALL update_prereq ('2000', '103', '102');
SELECT * FROM prereq;