-- 1. Cursor with Parameters
DECLARE
    v_min_marks students.marks%TYPE := 80;
    CURSOR cur_students(p_min_marks students.marks%TYPE) IS
        SELECT student_id, student_name, marks FROM students WHERE marks >= p_min_marks;
    v_id students.student_id%TYPE;
    v_name students.student_name%TYPE;
    v_marks students.marks%TYPE;
BEGIN
    OPEN cur_students(v_min_marks);
    LOOP
        FETCH cur_students INTO v_id, v_name, v_marks;
        EXIT WHEN cur_students%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ', Name: ' || v_name || ', Marks: ' || v_marks);
    END LOOP;
    CLOSE cur_students;
END;
/

-- 2. FOR UPDATE Cursor
DECLARE
    CURSOR cur_lock IS
        SELECT student_id, marks FROM students WHERE marks < 50 FOR UPDATE;
    v_id students.student_id%TYPE;
    v_marks students.marks%TYPE;
BEGIN
    OPEN cur_lock;
    LOOP
        FETCH cur_lock INTO v_id, v_marks;
        EXIT WHEN cur_lock%NOTFOUND;
        UPDATE students SET marks = marks + 10 WHERE student_id = v_id;
        DBMS_OUTPUT.PUT_LINE('Updated student ' || v_id);
    END LOOP;
    CLOSE cur_lock;
    COMMIT;
END;
/

-- 3. WHERE CURRENT OF Clause
DECLARE
    CURSOR cur_update IS
        SELECT student_id, marks FROM students WHERE marks < 90 FOR UPDATE;
    v_id students.student_id%TYPE;
    v_marks students.marks%TYPE;
BEGIN
    OPEN cur_update;
    LOOP
        FETCH cur_update INTO v_id, v_marks;
        EXIT WHEN cur_update%NOTFOUND;
        UPDATE students SET marks = marks + 5 WHERE CURRENT OF cur_update;
        DBMS_OUTPUT.PUT_LINE('Boosted marks for student ID: ' || v_id);
    END LOOP;
    CLOSE cur_update;
    COMMIT;
END;
/

-- 4. Cursor Variable (REF CURSOR)
DECLARE
    TYPE ref_cursor_type IS REF CURSOR;
    cur_students ref_cursor_type;
    v_id students.student_id%TYPE;
    v_name students.student_name%TYPE;
    v_marks students.marks%TYPE;
BEGIN
    OPEN cur_students FOR
        SELECT student_id, student_name, marks FROM students WHERE marks BETWEEN 70 AND 100;
    LOOP
        FETCH cur_students INTO v_id, v_name, v_marks;
        EXIT WHEN cur_students%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ', Name: ' || v_name || ', Marks: ' || v_marks);
    END LOOP;
    CLOSE cur_students;
END;
/
