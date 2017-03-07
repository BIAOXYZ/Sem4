drop table item_master;
drop table item_transaction;
create table item_master(itemid int primary key, description varchar(50), bal_stock int);
create table item_transaction(itemid int primary key, description varchar(50), quantity int);
insert into item_master values (1, 'abc', 10);
insert into item_master values (2, 'xyz', 20);
insert into item_master values (3, 'bat', 30);
insert into item_master values (4, 'man', 40);
set serveroutput on
DECLARE 
CURSOR c1(item int) is select * from item_master where ItemID = item FOR UPDATE;
temp item_master%rowtype;
ID int;
des varchar(20);
Qty int;
BEGIN
ID := &ID;
des := '&des';
Qty := &Qty;
open c1(ID);
FETCH c1 into temp;
if c1%notfound then
insert into item_master values (ID, des, 0);	
else if qty<=temp.bal_stock then
update item_master set bal_stock = bal_stock-Qty where current of c1;
insert into item_transaction values(temp.itemid,temp.description,qty);
else
dbms_output.put_line('Insufficient Qty');
end if;
end if;

close c1;

END;
/