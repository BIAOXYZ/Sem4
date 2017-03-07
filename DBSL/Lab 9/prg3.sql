declare
total_salary numeric;
begin
savepoint up_sal;
update instructor set salary=150000 where name like 'Srinivasan';
update instructor set salary=100000 where name like 'Mozart';
select sum(salary) into total_salary from instructor;
if total_salary > 2000000 then
    rollback to savepoint up_sal;
end if;
end;
/