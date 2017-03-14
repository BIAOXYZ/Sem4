set serveroutput on
create or replace procedure msg
	is
	begin
	dbms_output.put_line('Good Day to You');
	end;
	/

begin
msg;
end;
/