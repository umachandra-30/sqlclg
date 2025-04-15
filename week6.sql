SET SERVEROUTPUT ON;

DECLARE
    v_sid        students.student_id%TYPE;
    v_sname      students.student_name%TYPE;
    v_marks      students.marks%TYPE;
    v_grade      CHAR(1);
    v_result     VARCHAR2(10);
    v_remarks    VARCHAR2(20);
    v_adj_marks  NUMBER(3);

    CURSOR cur_students IS
        SELECT student_id, student_name, marks FROM students;

BEGIN
    OPEN cur_students;
    
    LOOP
        FETCH cur_students INTO v_sid, v_sname, v_marks;
        EXIT WHEN cur_students%NOTFOUND;

        v_adj_marks := COALESCE(v_marks, 35);

        IF v_adj_marks >= 90 THEN
            v_grade := 'S';
        ELSIF v_adj_marks >= 80 THEN
            v_grade := 'A';
        ELSIF v_adj_marks >= 70 THEN
            v_grade := 'B';
        ELSIF v_adj_marks >= 60 THEN
            v_grade := 'C';
        ELSIF v_adj_marks >= 50 THEN
            v_grade := 'D';
        ELSIF v_adj_marks >= 40 THEN
            v_grade := 'E';
        ELSE
            v_grade := 'F';
        END IF;

        CASE 
            WHEN v_grade IN ('S', 'A', 'B', 'C', 'D', 'E') THEN
                v_result := 'PASS';
            ELSE
                v_result := 'FAIL';
        END CASE;

        v_remarks := CASE
            WHEN v_grade = 'S' THEN 'Extraordinary'
            WHEN v_grade = 'A' THEN 'Excellent'
            WHEN v_grade = 'B' THEN 'Very Good'
            WHEN v_grade = 'C' THEN 'Good'
            WHEN v_grade = 'D' THEN 'Satisfactory'
            WHEN v_grade = 'E' THEN 'Sufficient'
            ELSE 'Poor'
        END;

        v_marks := NULLIF(v_adj_marks, 35);

        DBMS_OUTPUT.PUT_LINE('Student ID   : ' || v_sid);
        DBMS_OUTPUT.PUT_LINE('Name         : ' || v_sname);
        DBMS_OUTPUT.PUT_LINE('Marks        : ' || v_marks);
        DBMS_OUTPUT.PUT_LINE('Grade        : ' || v_grade);
        DBMS_OUTPUT.PUT_LINE('Result       : ' || v_result);
        DBMS_OUTPUT.PUT_LINE('Remarks      : ' || v_remarks);
        DBMS_OUTPUT.PUT_LINE('Final Marks  : ' || COALESCE(TO_CHAR(v_marks), 'No Marks Adjusted'));
        DBMS_OUTPUT.PUT_LINE('-------------------------------');
    END LOOP;

    CLOSE cur_students;
END;
/
