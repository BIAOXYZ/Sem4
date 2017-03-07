drop table salary_raise_table;
create table salary_raise_table (Instructor_Id varchar(20),raise_date date,salary_raise numeric(8, 2));
declare
Id_inst varchar(5);
sal numeric(8,2);
dept varchar(20);
ins_salary numeric(8,2);
cursor c1 is 
select ID,salary,dept_name from instructor
for UPDATE;
begin
open c1;
loop fetch c1 into id_inst,sal,dept;
if dept = 'Physics' then 
update instructor
set salary = salary *1.05
where current of c1;
ins_salary := sal*1.05;
insert into salary_raise_table values(id_inst,current_date,ins_salary);
end if;
exit when c1%notfound;
end loop;
end; 
/