set serveroutput on
declare
name varchar(20);
deptName varchar(20);
inputDept varchar(20) := 'Biology';
countD int;
exceptionMulti exception;
begin
select name, dept_name into name, deptName from instructor where dept_name = inputDept;
select name, count(*) into name, countD from instructor group by name having count(*)>1;
if countD > 1 then raise exceptionMulti;
end if;
dbms_output.put_line('Name: '|| to_char(name));
exception
when NO_DATA_FOUND then dbms_output.put_line('No associated instructor');
when TOO_MANY_ROWS then dbms_output.put_line('Multiple rows returned');
when exceptionMulti then dbms_output.put_line('1 instructor, multiple depts');	
end;
/
