create table salary_raise (instructor_id varchar(5), raise_date date, raise_amt number(8,2));
set serveroutput on
declare
	temp instructor%ROWTYPE;
	cursor my_cursor is select * from instructor where dept_name='Physics';
	raiset number(8,2);
begin
	open my_cursor;
	
	loop
		fetch my_cursor into temp;
		exit when my_cursor%notfound;
		update instructor
		set salary = salary + (salary * 0.05)
		where dept_name = 'Physics';		
		raiset := temp.salary * 0.05;		
		insert into salary_raise values(temp.id, (select sysdate from dual), raiset);
	end loop;
	close my_cursor;
end;
/