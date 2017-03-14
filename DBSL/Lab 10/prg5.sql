set serveroutput on
create or replace function sqr(no number)
	return number as sqr number;
	begin 
		sqr:= no*no;
		return sqr;
	end;
	/

declare
x number;
begin 
x:=&x;
dbms_output.put_line('Square of '|| x || ' is '||sqr(x));
end;
/