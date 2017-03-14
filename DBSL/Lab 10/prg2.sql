set serveroutput on

create or replace procedure list_stud_courses(dname department1.dept_name%TYPE)
	is
	cursor c1(d_name student1.dept_name%TYPE) is select name from student1 where dept_name=d_name;
	cursor c2(d_name course.dept_name%TYPE) is select title from course where dept_name=d_name;
	begin
	dbms_output.put_line('Courses');
	for row1 in c2(dname)
	loop
	dbms_output.put_line(row1.title);
	end loop;
	dbms_output.put_line(chr(10));
	dbms_output.put_line('Student name');
	for row2 in c1(dname)
	loop
	dbms_output.put_line(row2.name);
	end loop;

	end;
	/

declare
dname varchar(20);
begin
dname:='&dname';
list_stud_courses(dname);
end;
/