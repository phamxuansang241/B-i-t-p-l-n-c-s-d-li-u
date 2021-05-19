START TRANSACTION;

SELECT ID_new_student = MAX(ID) + 1 FROM student;

INSERT INTO student(ID, name, dept_name, tot_cred)
VALUES(ID_new_student, "A", "B", 0);

COMMIT;

 