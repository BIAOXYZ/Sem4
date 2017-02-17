21.select title from course c,takes t where t.course_id=c.course_id and semester='Fall' and year='2009' union select title from course c,takes t where t.course_id=c.course_id and semester='Spring' and year='2010';

22.select title from course c,takes t where t.course_id=c.course_id and semester='Fall' and year='2009' intersect select title from course c,takes t where t.course_id=c.course_id and semester='Spring' and year='2010';

23.select title from course c,takes t where t.course_id=c.course_id and semester='Fall' and year='2009' minus select title from course c,takes t where t.course_id=c.course_id and semester='Spring' and year='2010';

24.select avg(salary) from instructor where dept_name='Comp. Sci.';

25.select count(distinct id) from teaches where semester='Spring' and year='2010';

26.select course_id,count(id) from takes group by course_id;

27.select dept_name,count(distinct id) from student1 group by dept_name having count(distinct id)>2;

28.select dept_name,count(course_id) from course group by dept_name;

29.select dept_name,avg(salary) from instructor group by dept_name having avg(salary)>42000;

30.select course_id from course minus select course_id from takes;

30.select title from course natural left outer join takes where ID is null;

31.select course_ID from section where semester='Fall' and year=2009 and course_ID in (select course_ID from section where semester ='Spring' and year=2010);


32.select count(distinct id) from takes where (course_id,sect_id,semester,year) in select ( course_id,sec_id,semester,year) where teaches.id='101';

33.select course_ID from section where semester='Fall' and year=2009 and course_ID not in (select course_ID from section where semester='Spring' and year=2010);

34.select name,salary from instructor where salary>some(select salary from instructor where dept_name='Biology');

35.select name,salry from instructor where salary> all(select salary from instructor where dept_name='Biology');

36.select course_ID from section S where semester='Fall' and year=2009 and exsists (select course_Id from section T where semester ='Spring' and year=2010 and S.course_ID=T.course_ID);

37.select distinct S.ID,S.name from student1 S where not exsists ((select course_ID from course where dept_name='Physics') minus (select T.course_ID from takes T where S.ID=T.ID));

38. select title from course E where 1>=(select count(R.course_ID) from section R where E.course_ID=R.course_ID and year=2009);

39.select ID from course E where 1>(select count(R.course_ID) from section R where E.course_ID=R.course_ID and E.dept_name='Comp. Sci.'); 

40.select max(tot_salary) from (select dept_name,sum(salary)as tot_salary from instructor group by dept_name);

41.select avg(avg_salary) from (select dept_name,avg(salary) as avg_salary from instructor group by dept_name) where avy_salary>42000;

42.with max_budget(value) as (select max(budget) from department) select dept_name,budget from department,max_budget where department.budget=max_budget.value;

43.with dept_tot(dept_name,value) as (select dept_name,sum(salary) from instructor group by dept_name),dept_totav(value1) as (select avg(value) from dept_tot) select dept_name from dept_tot,dept_totav where dept_tot.value>=dept_totav.value1;

44.create view all_courses as select course.course_ID,title,sec_ID,building,room_number from course,section where course.course_ID=section.course_ID and course.dept_name ='Physics' and section.semester='Fall' and section.year=2009;

45.select * from all_courses;

46.create view department_total_salary as select dept_name,sum(salary)as total_salary from instructor group by dept_name;

47. delete from instructor where dept_name='Finance';

48. delete from course where dept_name='Comp. Sci.';

49. update student1 set dept_name='Physics' where dept_name='Comp. Sci.';

50.update instructor set salary=case when salary<=100000 then salary*1.05 else salary*1.03 end;

51. insert into student1 (select id,name,dept_name,'0' from instructor);

52.delete from instructor where salary<(select avg(salary) from instructor);