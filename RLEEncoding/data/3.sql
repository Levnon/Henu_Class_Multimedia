create database ST
Go
use ST
go
CREATE PROCEDURE Stu
AS 
   CREATE TABLE STUDENT
( 
Sno CHAR(10) PRIMARY KEY,Sname CHAR(10) NOT NULL,Sage INT,Ssex BIT,Sdept CHAR(15),class char(8),Sinterest char(20)
);
   CREATE TABLE TEACHER
( 
Cno CHAR(10)PRIMARY KEY ,Cname CHAR(10) NOT NULL,Cage INT,Csex BIT,Cdept CHAR(15),profession char(20),
 direction1 char(50),
direction2 char(50),
direction3 char(50)
);
   CREATE TABLE S1
( 
Sno CHAR(10),Sname CHAR(10) NOT NULL,Cno char(10),Cname char(10),primary key(Sno,Cno),
foreign key(Sno) references Student(Sno),
foreign key(Cno) references TEACHER(Cno),
);

   CREATE TABLE T1
( 
Cno CHAR(10) ,Cname CHAR(10) NOT NULL,Sno char(10),Sname char(10),primary key(Cno,Sno),
foreign key(Sno) references Student(Sno),
foreign key(Cno) references TEACHER(Cno)
);
   CREATE TABLE T2
( 
Cno CHAR(10) ,Cname CHAR(10) NOT NULL,Cout char(8), Sno1 char(10),Sname1 char(10),
Sno2 char(10),Sname2 char(10),Sno3 char(10),Sname3 char(10),
Sno4 char(10),Sname4 char(10),Sno5 char(10),Sname5 char(10),
Sno6 char(10),Sname6 char(10),Sno7 char(10),Sname7 char(10),
Sno8 char(10),Sname8 char(10),foreign key(Cno) references TEACHER(Cno) 
);

CREATE TABLE my_sqllogqq( name char(5), 
username char(5), 
data char(30),
times char(30))
 Go
 EXEC Stu 


use ST
go
 create PROCEDURE sui
 as
 begin
     insert into student(Sno ,Sname,Sage ,Ssex ,Sdept,class,Sinterest)values
                            
    insert into TEACHER (Cno ,Cname,Cage ,Csex ,Cdept,profession,direction1 ,direction2 ,direction3)values
                               
    insert into S1(Sno ,Sname,Cno ,Cname)values
                        
                         
      insert into T1(Cno ,Cname,Sno ,Sname)values 
                          
        insert into T2(Cno ,Cname ,Cout , Sno1 ,Sname1,Sno2 ,Sname2 ,Sno3 ,Sname3 ,Sno4 ,Sname4 ,Sno5 ,Sname5 ,Sno6 ,Sname6 ,Sno7 ,Sname7 ,Sno8 ,Sname8)values
                             
 end 
 return
 go 
 EXEC sui   
CREATE ROLE STU; 
CREATE ROLE tea;
CREATE ROLE sta;

grant select on TEACHER to STUDENT;
grant insert,update, delete on Student to st;

create login uu01 with password='gna';create user uu01 for login uu01   ;
create login uu02 with password='gna';create user uu02 for login uu02    ;
create login uu03 with password='gna';create user uu03 for login uu03    ;
create login ee01 with password='gna';create user ee01 for login ee01    ;
create login ee02 with password='gna';create user ee02 for login ee02    ;
create login ee03 with password='gna';create user ee03 for login ee03   ;
create login ee001 with password='gna';create user ee001 for login ee001   ;
exec sp_addrolemember  'STU',uu01;
exec sp_addrolemember  'STU',uu02;
exec sp_addrolemember  'STU',uu03;
exec sp_addrolemember  'tea',ee01;
exec sp_addrolemember  'tea',ee02;
exec sp_addrolemember  'tea',ee03;
exec sp_addrolemember  'sta',ee001
use ST 
go
drop procedure log_login
create procedure log_login
as
begin
insert into my_sqllogqq values
( USER_NAME() ,USER_NAME(),
getdate(),convert(varchar(10),getdate(),108))
end

exec log_login

select *
from my_sqllogqq

USE ST 
go





EXEC cookie                