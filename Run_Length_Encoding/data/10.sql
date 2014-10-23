
create database 
go
create procedure stytl2

as
begin
create table student
(ssno char(9) primary key,
sname char(20) unique,sage smallint,
ssex char(2),
sdept char(20),
class char(10),
interest char(9),
foreign key (ssno) references student(ssno));

create table teacher
(tsno char(9) primary key,
tname char(20) unique,sage smallint,
tsex char(2),
sdept char(20),
title char (20),area1 char(10),
area2 char(10),area3 char(10));

create table stselect
(ssno char(9) primary key,
sname char(20) unique, 
tsno char(9),
tname char(20) unique,sselect1 char(9),
sselect2 char(9),sselect3 char(9),sselect4 char(9),sselect5 char(9),
sselect6 char(9));

create table tsselect
(tsno char(9) primary key,
tname char(20) unique, 
ssno char(9),
sname char(20) unique,tselect1 char(9),
tselect2 char(9),tselect3 char(9),tselect4 char(9),tselect5 char(9),
tselect6 char(9),tselect7 char(9),tselect8 char(9));

create table result 
( 
   tsno char(9),
   tname char(10),
   Ssno char(10),
   number char(10),ssname1 char(10),ssno1 char(10),
   ssname2 char(10),ssno2 char(10),ssname3 char(10),ssno3 char(10),
   ssname4 char(10),ssno4 char(10),ssname5 char(10),ssno5  char(10),
   ssname6 char(10) ,ssno6 char(10),ssname7 char(10),ssno7 char(10),
   ssname8 char(10) ,ssno8  char(10),
);

create table sy_log    
(newuser char(15) default current_user,
 newdate date default convert(varchar(12),getdate(),111),
 newtime time default convert(char(8),getdate(),108))
end
exec stytl2
create procedure inserted
as
begin
insert into student(ssno,Sname,Sage,Ssex,Sdept,class,interest)
 
  end       
 exec inserted        
create procedure inserted2
as  
begin    
insert into teacher(tsno,tname,sage,tsex,sdept,area1,area2,area3)
    values 
           end
        exec inserted2
  
 create procedure inserted3
 as             
  insert into stselect(ssno,Sname,tsno,tname,sselect1,
  sselect2 ,sselect3 ,sselect4,sselect5 ,sselect6)
  values
 
create procedure inserted4
as                  
  insert into tsselect(tsno,tname,ssno,sname,tselect1 ,
tselect2 ,tselect3 ,tselect4 ,tselect5 ,
tselect6 ,tselect7 ,tselect8 )
 
  values 
   create procedure inserted5
as              
 insert into tsselect(tsno,tname,ssno,sname,tselect1 ,
tselect2 ,tselect3 ,tselect4 ,tselect5 ,
tselect6 ,tselect7 ,tselect8 )

values 
 
     
insert into result(tsno,tname,number)
values
       
use  
go             
create role rstudent
grant insert,update ,select 
on stselect
to rstudent;             
 
create role rteacher
grant insert ,update on teacher to rteacher    
 
create role ssectory
grant update,select,insert,delete on Student  to ssectory
grant update,select,insert,delete on teacher to ssectory  
grant select on Effect to ssectory; 

create login l1 with password='00'
create user s1 for login l1
create login l2 with password='00'
create user s2 for login l2
create login l3 with password='00'
create user s3 for login l3
exec   sp_addrolemember'rstudent','s1'  
exec   sp_addrolemember'rstudent','s2'
exec   sp_addrolemember'rstudent','s3'

create login r1 with password='00'
create user t1 for login r1
create login r2 with password='00'
create user t2 for login r2
create login r3 with password='00'
create user t3 for login r3                  
exec  sp_addrolemember'rteacher','r1'
exec  sp_addrolemember'rteacher','r2'
exec  sp_addrolemember'rteacher','r3'

create login t1 with password='00'
create user a1 for login t1
exec sp_addrolemember'ssectory;','a1' 

create view v1_student 
as
select *
from student
where ssno='2002151012'

grant update,select 
on v1_student
to a1

create view v2_student             
as
select *
from student 
where ssno='2002151013'

grant update,select
on v2_student
to t2

create view v3_student              
as
select *
from student
where ssno='2002151014'
grant update,select
on v3_student
to t3                 
 
   if exists(select name from  sysobjects  where xtype='p' and name='')
   drop procedure 
   go 
   create procedure 
   as
   begin
   insert into sy_log  values(USER_NAME(),GETDATE(),default)
   end
   return 
   go
   
   EXEC 
   
 
     if exists(select name from sysobjects where xtype='p' and name='back')
     drop procedure back
     go
     create procedure back
     as 
     begin
    

  



 