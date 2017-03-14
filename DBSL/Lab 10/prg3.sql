set serveroutput on

create or replace procedure department_highest(dname instructor.dept_name%type) is
	cursor c(d_name instructor.dept_name%type) is 
	with max_salary as (select max(salary) as max_sal from instructor where dept_name=dname ) 
	select name,dept_name,salary from instructor natural join max_salary where salary=max_sal;
	begin
	for row in c(dname)
	loop
	dbms_output.put_line(row.name||'  '||row.dept_name||'  '||row.salary);
	end loop;

	end;
	/

declare
cursor c1 is select dept_name from department1;
begin
dbms_output.put_line('Highest Paid Instructor');
for row1 in c1
loop
department_highest(row1.dept_name);
end loop;
end;
/