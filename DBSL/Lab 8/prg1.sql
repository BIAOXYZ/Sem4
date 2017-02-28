create table areas (radius float, area float);

set serveroutput on
declare
r float;
a float;
begin
select radius, area into r, a from areas;
exception
when NO_DATA_FOUND then dbms_output.put_line('No data found');
end;
/