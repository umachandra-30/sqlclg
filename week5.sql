CREATE TABLE students (
    student_id NUMBER PRIMARY KEY,
    student_name VARCHAR2(50),
    marks NUMBER(3)
);

INSERT INTO students VALUES (1, 'Alice', 85);
INSERT INTO students VALUES (2, 'Bob', 75);
INSERT INTO students VALUES (3, 'Charlie', 55);
INSERT INTO students VALUES (4, 'David', 90);
INSERT INTO students VALUES (5, 'Eve', 45);
COMMIT;

DECLARE
    v_sname students.student_name%TYPE;
    v_marks students.marks%TYPE;
    v_found BOOLEAN := FALSE;
    CURSOR cur_students IS SELECT student_name, marks FROM students WHERE marks >= 99;
    no_data_found_exp EXCEPTION;
BEGIN
    OPEN cur_students;
    LOOP
        FETCH cur_students INTO v_sname, v_marks;
        EXIT WHEN cur_students%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Student::' || v_sname || ' secured First Class with Marks:' || v_marks);
        v_found := TRUE;
    END LOOP;
    CLOSE cur_students;

    IF v_found = FALSE THEN
        RAISE no_data_found_exp;
    END IF;
EXCEPTION
    WHEN no_data_found_exp THEN
        DBMS_OUTPUT.PUT_LINE('No Records were found');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error:' || SQLERRM);
END;
/

DECLARE
    v_id students.student_id%TYPE;
    v_sname students.student_name%TYPE;
    v_marks students.marks%TYPE;
    v_sp1 BOOLEAN := FALSE;
    v_sp2 BOOLEAN := FALSE;
BEGIN
    v_id := &v_id;
    v_sname := &v_sname;
    v_marks := &v_marks;

    SAVEPOINT original;
    INSERT INTO students VALUES (v_id, v_sname, v_marks);
    SAVEPOINT first_insert;
    v_sp1 := TRUE;

    INSERT INTO students VALUES (6, 'Sita', 77);
    SAVEPOINT second_insert;
    v_sp2 := TRUE;

    INSERT INTO students VALUES (1, 'Duplicate Student', 44);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('All Records are Saved');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: Duplicate Record ' || SQLERRM);
        IF v_sp2 = TRUE THEN
            ROLLBACK TO second_insert;
            DBMS_OUTPUT.PUT_LINE('Rolled back to Second save point');
            DBMS_OUTPUT.PUT_LINE('First two transactions are committed');
        ELSIF v_sp1 = TRUE THEN
            ROLLBACK TO first_insert;
            DBMS_OUTPUT.PUT_LINE('Rolled back to First save point');
            DBMS_OUTPUT.PUT_LINE('First transaction is committed');
        ELSE
            ROLLBACK TO original;
            DBMS_OUTPUT.PUT_LINE('Rolled back to Original');
            DBMS_OUTPUT.PUT_LINE('No transactions are committed');
        END IF;
    COMMIT;
END;
/