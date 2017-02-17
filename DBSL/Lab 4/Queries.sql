1. create table employee 
(empno varchar(5) primary key,
empname varchar(10) not null,
sex varchar(1) not null check (sex in('M','F')),
 salary numeric(6,2) default 1000 not null ,
 address varchar(20) not null,
dno varchar(10));

2.create table department
(deptno varchar(8) primary key,
deptname varchar(15) not null unique);

3.alter table employee add
 foreign key(dno) references department (deptno);

4.insert into employee values(10101,'Akashraj','M',1000,'xyz',null);

5.insert into employee values(10110,null,null,null,null,null);

6.alter table employee drop 

7.alter table employee modify foreign key (dno) references department (deptno) on delete cascade;

10.select name,length(name) from student1;

11.select lower(name) from instructor;

12.select dept_name,substr(dept_name,3,3) from department;

13.select upper(name) from instructor;

14.select id,nvl(grade,0) from takes;

15.select salary,salary/3,round(salary/3/100)*100 as rounded_salary from instructor;

16.select empName,to_char(dob,'DD-MON-YYYY') from employee;
   select empName,to_char(dob,'DD-MON-YY') from employee;
   select empName,to_char(dob,'DD-MM-YY') from employee;

17.select empname,to_char(dob,'YEAR') from employee;
   select empname,to_char(dob,'Year') from employee;
   select empname,to_char(dob,'year') from employee;

18.select empname,to_char(dob,'DAY') from employee;
   select empname,to_char(dob,'Day') from employee;

19.select empname,to_char(dob,'MONTH') from employee;
   select empname,to_char(dob,'Month') from employee;


20.select empname,last_day(dob),to_char(last_day(dob),'day')from employee where empno=10101;

21. select empname,(sysdate-dob)/365 as age from employee;

22.select empname,next_day(add_months(dob,60*12),'Saturday') from employee;

23.select empname from employee where extract(year from dob)=1997;

24.select empname from employee where extract(year from dob) between 1996 and 1998;

25.select empname from employee where extract(year from dob)+60=2057;