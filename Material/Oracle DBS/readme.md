# Setting Oracle Dbs  

The version I used was Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production. Theses steps should work for other versions.  
Remember the password you set during installation

### After Installation
On **cmd**
```
sqlplus
username:system
password:<password>
```

### Creation of a new User
```
create user <username> identified by <password> defualt tablespace users temporary tablespace temp;
grant dba to <username>;
exit
```
Log in with your credentials
