declare
	cursor c1 is select * from student order by tot_cred;
	v_row student%rowtype;
begin
	open c1;
	loop 
		fetch c1 into v_row;
		dbms_output.put_line(v_row.name||'   '||v_row.ID||'   '||v_row.tot_cred);
		exit when c1%rowcount > 9;
	end loop;
	close c1;	

end;
/
