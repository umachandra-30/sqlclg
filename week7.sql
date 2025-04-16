declare
    v_sid    students.student_id%type;
    v_sname  students.student_name%type;
    v_marks  students.marks%type;
    v_grade  char(1);

    cursor cur_students is select student_id, student_name, marks from students;

    null_marks_exception exception;

begin
    open cur_students;

    loop
        fetch cur_students into v_sid, v_sname, v_marks;
        exit when cur_students%NOTFOUND;

        if v_marks is null then
            raise null_marks_exception;
        end if;

        if v_marks >= 90 then
            v_grade := 'A';
        elsif v_marks >= 75 then
            v_grade := 'B';
        elsif v_marks >= 60 then
            v_grade := 'C';
        else
            v_grade := 'F';
        end if;

        dbms_output.put_line('student id: ' || v_sid);
        dbms_output.put_line('name: ' || v_sname);
        dbms_output.put_line('marks: ' || v_marks);
        dbms_output.put_line('grade: ' || v_grade);
        dbms_output.put_line('--------------------------------');
    end loop;

    close cur_students;

exception
    when no_data_found then
        dbms_output.put_line('error: no student records found.');

    when zero_divide then
        dbms_output.put_line('error: division by zero is not allowed.');

    when null_marks_exception then
        dbms_output.put_line('error: one or more students have null marks.');

    when others then
        dbms_output.put_line('unexpected error: ' || sqlerrm);
end;
/
