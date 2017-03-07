create table salary_raise_table (Instructor_Id varchar(20),raise_date date,salary_raise numeric(8, 2));
declare
Cursor c1 is 
select * from instructor where dept_name = 'Physics' FOR update;
raise_amt number;
begin
for sal in c1
loop
raise_amt := sal.salary*1.05;
update instructor set salary = salary*1.05;
insert into salary_raise_table values(sal.Id,current_date,raise_amt);
end loop;
end;
/