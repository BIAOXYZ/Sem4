drop table salesman_master;
drop table comission_payable;

create table salesman_master (salesman_no int, salesman_name varchar2(20), rate_of_commission float,target_sales float, total_sales float);
create table comission_payable (commission_amount float, salesman_no int, date_of_payment date);

insert into salesman_master values(1,'Rachit',1,1000,500);
insert into salesman_master values(2,'Yash',2,2000,1000);
insert into salesman_master values(3,'Saket',5,5000,6000);


set serveroutput on

declare
tar_s float;
tot_s float;
sal_no int;
roc float;
exception1 exception;
begin
select salesman_no, target_sales, total_sales, rate_of_commission into sal_no, tar_s, tot_s, roc from salesman_master where salesman_no = 2;
if tar_s > tot_s then
raise exception1;
else
insert into comission_payable values (tot_s*roc, sal_no, (select sysdate from dual));
end if;
exception
	when exception1 then dbms_output.put_line('Target Not Achieved');
end;
/