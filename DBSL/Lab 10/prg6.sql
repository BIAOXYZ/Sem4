create or replace function course_popular(d_name varchar2)
  return varchar2 as
  cid varchar2(8);
begin
  with c_student as (select takes.course_id, count(id) as n_stud
        from takes group by takes.course_id
        having takes.course_id IN (select course_id from course where dept_name = d_name)),
        max_count as (select max(n_stud) as maxs FROM c_student)
    select course_id into cid FROM c_student, max_count where n_stud=maxs;
return cid ;
end;
/
declare
begin
 dbms_output.put_line('The most popular course is '||course_popular('Comp. Sci.')) ;
end;
/
