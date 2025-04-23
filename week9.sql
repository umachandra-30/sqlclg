-- Function to get marks of a student
CREATE OR REPLACE FUNCTION get_marks( 
    f_student_id students.student_id%TYPE 
) 
RETURN students.marks%TYPE 
IS  
    v_marks students.marks%TYPE; 
BEGIN 
    SELECT marks INTO v_marks FROM students WHERE student_id = f_student_id; 
    RETURN v_marks; 
EXCEPTION 
    WHEN no_data_found THEN 
        RETURN NULL; 
END get_marks; 
/

-- Function to set grade based on marks
CREATE OR REPLACE FUNCTION set_grade( 
    f_student_id students.student_id%TYPE 
) 
RETURN CHAR 
IS 
    v_marks students.marks%TYPE; 
    v_grade CHAR(2); 
BEGIN 
    SELECT marks INTO v_marks FROM students WHERE student_id = f_student_id; 
    IF v_marks >= 90 THEN 
        v_grade := 'S'; 
    ELSIF v_marks >= 80 THEN 
        v_grade := 'A'; 
    ELSIF v_marks >= 70 THEN 
        v_grade := 'B'; 
    ELSIF v_marks >= 60 THEN 
        v_grade := 'C'; 
    ELSIF v_marks >= 50 THEN 
        v_grade := 'D'; 
    ELSIF v_marks >= 40 THEN 
        v_grade := 'E'; 
    ELSE 
        v_grade := 'F'; 
    END IF; 
    RETURN v_grade; 
EXCEPTION 
    WHEN no_data_found THEN 
        RETURN 'NA'; 
END set_grade; 
/

-- Function to set rank based on marks
CREATE OR REPLACE FUNCTION set_rank( 
    f_student_id students.student_id%TYPE 
) 
RETURN NUMBER 
IS 
    v_rank NUMBER(3); 
BEGIN 
    SELECT stu_rank INTO v_rank 
    FROM (
        SELECT student_id, RANK() OVER (ORDER BY marks DESC) AS stu_rank 
        FROM students
    ) 
    WHERE student_id = f_student_id; 

    RETURN v_rank; 
EXCEPTION 
    WHEN no_data_found THEN 
        RETURN NULL; 
END set_rank; 
/

-- Example queries to use the functions
-- Get marks for student ID 1
SELECT get_marks(1) FROM dual;

-- Get grade for all students
SELECT student_id, marks, set_grade(student_id) AS grade FROM students;

-- Get rank for all students
SELECT student_id, set_rank(student_id) AS rank, marks FROM students ORDER BY rank;

-- Anonymous block to input and display full result
DECLARE 
    v_student_id students.student_id%TYPE := &v_student_id; 
    v_marks students.marks%TYPE; 
    v_grade CHAR(2); 
    v_rank NUMBER(3); 
BEGIN 
    v_marks := get_marks(v_student_id); 
    v_grade := set_grade(v_student_id); 
    v_rank := set_rank(v_student_id); 

    DBMS_OUTPUT.PUT_LINE('Marks: ' || v_marks); 
    DBMS_OUTPUT.PUT_LINE('Grade: ' || v_grade); 
    DBMS_OUTPUT.PUT_LINE('Rank: ' || v_rank); 
END; 
/
