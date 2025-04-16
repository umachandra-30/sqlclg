-- =======================================
-- STUDENT GET INFO PROCEDURE
-- =======================================
CREATE OR REPLACE PROCEDURE get_student_info( 
    p_sid IN students.student_id%TYPE 
) 
IS 
    v_sname students.student_name%TYPE; 
    v_marks students.marks%TYPE; 
BEGIN 
    SELECT student_name, marks 
    INTO v_sname, v_marks 
    FROM students 
    WHERE student_id = p_sid; 

    DBMS_OUTPUT.PUT_LINE('Name: ' || v_sname); 
    DBMS_OUTPUT.PUT_LINE('Marks: ' || v_marks); 

EXCEPTION 
    WHEN no_data_found THEN 
        DBMS_OUTPUT.PUT_LINE('Error: No Student with ID: ' || p_sid); 
END; 
/

-- =======================================
-- ANONYMOUS BLOCK TO CALL GET INFO
-- =======================================
DECLARE 
    v_sid students.student_id%TYPE; 
BEGIN 
    v_sid := &v_sid; 
    get_student_info(v_sid); 
END; 
/

-- =======================================
-- STUDENT GRADE CALCULATION PROCEDURE
-- =======================================
CREATE OR REPLACE PROCEDURE get_student_grade ( 
    p_sid IN students.student_id%TYPE, 
    p_grade OUT VARCHAR2 
) 
IS 
    v_marks students.marks%TYPE; 
BEGIN 
    SELECT marks 
    INTO v_marks 
    FROM students 
    WHERE student_id = p_sid; 

    IF v_marks >= 90 THEN 
        p_grade := 'S'; 
    ELSIF v_marks >= 80 THEN 
        p_grade := 'A'; 
    ELSIF v_marks >= 70 THEN 
        p_grade := 'B'; 
    ELSIF v_marks >= 60 THEN 
        p_grade := 'C'; 
    ELSIF v_marks >= 50 THEN 
        p_grade := 'D'; 
    ELSIF v_marks >= 40 THEN 
        p_grade := 'E'; 
    ELSE 
        p_grade := 'F'; 
    END IF; 

EXCEPTION 
    WHEN no_data_found THEN 
        p_grade := 'Error: No Data Found'; 
END; 
/

-- =======================================
-- ANONYMOUS BLOCK TO CALL GET GRADE
-- =======================================
DECLARE 
    v_sid students.student_id%TYPE; 
    v_result VARCHAR2(20); 
BEGIN 
    v_sid := &v_sid; 
    get_student_grade(v_sid, v_result); 
    DBMS_OUTPUT.PUT_LINE('Grade: ' || v_result); 
END; 
/

-- =======================================
-- ALTER TABLE TO ADD GRADE COLUMN
-- =======================================
ALTER TABLE students ADD grade CHAR(2);
/

-- =======================================
-- PROCEDURE TO UPDATE GRADE COLUMN
-- =======================================
CREATE OR REPLACE PROCEDURE update_student_grade ( 
    p_sid IN students.student_id%TYPE, 
    p_grade IN OUT students.grade%TYPE 
) 
AS 
    v_marks students.marks%TYPE; 
BEGIN 
    SELECT marks 
    INTO v_marks 
    FROM students 
    WHERE student_id = p_sid; 

    IF v_marks >= 90 THEN 
        p_grade := 'S'; 
    ELSIF v_marks >= 80 THEN 
        p_grade := 'A'; 
    ELSIF v_marks >= 70 THEN 
        p_grade := 'B'; 
    ELSIF v_marks >= 60 THEN 
        p_grade := 'C'; 
    ELSIF v_marks >= 50 THEN 
        p_grade := 'D'; 
    ELSIF v_marks >= 40 THEN 
        p_grade := 'E'; 
    ELSE 
        p_grade := 'F'; 
    END IF; 

    UPDATE students 
    SET grade = p_grade 
    WHERE student_id = p_sid; 

EXCEPTION 
    WHEN no_data_found THEN 
        p_grade := 'NA'; 
END; 
/

-- =======================================
-- ANONYMOUS BLOCK TO CALL UPDATE GRADE
-- =======================================
DECLARE 
    v_grade students.grade%TYPE; 
    v_id students.student_id%TYPE; 
BEGIN 
    v_grade := 'NA';  
    v_id := &v_id; 
    update_student_grade(v_id, v_grade); 
    DBMS_OUTPUT.PUT_LINE('Grade: ' || v_grade); 
END; 
/
