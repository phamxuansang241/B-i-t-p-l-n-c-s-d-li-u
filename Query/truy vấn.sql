-- 1. Sắp xếp danh sách người hướng dẫn có lương từ 80000 đến 120000 theo thứ tự lương tăng dần
SELECT 
    *
FROM
    instructor
WHERE
    salary BETWEEN 80000 AND 120000
ORDER BY salary ASC;
/* 2. Lấy ra thông tin những phòng ban có số tiêu đề >= 10 sắp xếp theo thứ tự tăng dần 
của tiêu đề */
SELECT dept_name, COUNT(title)
FROM course
GROUP BY dept_name
HAVING COUNT(title) >= 10
ORDER BY COUNT(title) ASC;

-- 3. Thống kê ngân sách các tòa nhà của phòng ban 
SELECT 
    building,
    SUM(budget) TongNgansach,
    AVG(budget) TrungbinhNgansach,
    MAX(budget) NgansachLonnhat,
    MIN(budget) NgansachNhonhat
FROM
    department
GROUP BY building;

/* 4. Tìm tên của tất cả những người hướng dẫn có mức lương lớn hơn ít nhất một giáo viên hướng dẫn 
trong bộ môn Sinh học */
SELECT DISTINCT
    T.name
FROM
    instructor AS T,
    instructor AS S
WHERE
    T.salary > S.salary
        AND S.dept_name = 'Biology';

/* 5. Hiển thị thông tin gồm: ID, tên người hướng dẫn, tiền lương, học kỳ, tên tòa nhà với tên phòng ban 
là Vật lý */
SELECT 
    instructor.ID,
    instructor.name,
    instructor.dept_name,
    salary,
    teaches.semester,
    section.building
FROM
    instructor
        INNER JOIN
    teaches ON instructor.ID = teaches.ID
        INNER JOIN
    section ON teaches.semester = section.semester
WHERE
    instructor.dept_name = 'Physics';


-- 6. Tìm phòng ban có mức lương trung bình cao nhất
SELECT 
    dept_name
FROM
    instructor
GROUP BY dept_name
HAVING AVG(salary) >= ALL (SELECT 
        AVG(salary)
    FROM
        instructor
    GROUP BY dept_name);
    
    
-- 7. Tìm tổng số sinh viên (riêng biệt) đã tham gia các phần khóa học do giảng viên có ID 3335 giảng dạy	
SELECT 
    COUNT(DISTINCT ID)
FROM
    takes
WHERE
    EXISTS( SELECT 
            course_id, sec_id, semester, year
        FROM
            teaches
        WHERE
            teaches.ID = '3335'
                AND takes.course_id = teaches.course_id
                AND takes.sec_id = teaches.sec_id
                AND takes.semester = teaches.semester
                AND takes.year = teaches.year);

-- 8. Sắp xếp số lượng giảng viên trong mỗi bộ môn giảng dạy một khóa học vào học kỳ mùa xuân năm 2008 theo thứ tự giảm dần

SELECT 
    instructor.dept_name, COUNT(instructor.ID) AS instr_count
FROM
    instructor,
    teaches
WHERE
    instructor.ID = teaches.ID
        AND year = 2008
        AND semester = 'Spring'
GROUP BY instructor.dept_name
ORDER BY instr_count DESC;

/* 9. Đối với mỗi phần khóa học được cung cấp trong năm 2001, tìm tổng số tín chỉ trung bình (tính theo tín chỉ) 
của tất cả sinh viên đăng ký trong phần đó, nếu phần đó có ít nhất 2 sinh viên */
SELECT 
    takes.course_id, takes.semester, year, sec_id, AVG(tot_cred)
FROM
    student,
    takes
WHERE
    student.ID = takes.ID AND year = 2001
GROUP BY course_id , semester , year , sec_id
HAVING COUNT(student.ID) >= 2;

/* 10. Tìm tất cả các phòng ban có tổng mức lương là lớn hơn mức trung bình của tổng tiền lương ở tất cả các bộ phận. */
WITH dept_total (dept_name, VALUE) AS
	(SELECT 
           dept_name, sum(salary)
	 FROM 
          instructor
     GROUP BY dept_name),
dept_total_AVG(VALUE) AS
	(SELECT 
           AVG(VALUE)
     FROM dept_total)
SELECT 
      dept_name
FROM 
      dept_total, dept_total_avg
WHERE dept_total.VALUE > dept_total_avg.VALUE;

