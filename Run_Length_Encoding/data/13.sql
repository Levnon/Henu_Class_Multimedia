create database ST    
go
                                  
use ST
go

IF EXISTS(SELECT name FROM sysobjects 
              WHERE name='create_table' AND type='P')
    DROP PROCEDURE create_table
GO

create procedure create_table
as 
CREATE TABLE STUDENT	
(
	Sno CHAR(10) PRIMARY KEY,
	Sname CHAR(10) NOT NULL,
	Sage INT,
	Ssex char(2),
	Sdept CHAR(15),
	class INT,
	research_interest char(10)
)
go
create table teacher
(
    Tno CHAR(10) PRIMARY KEY,
	Tname CHAR(10) NOT NULL,
	Tage INT,
	Tsex char(2),
	Tdept CHAR(15),
	Position char(10),
	research_direction1 char(10),
	research_direction2 char(10),
	research_direction3 char(10)
)
create table Sselect
(
  Sno CHAR(10) PRIMARY KEY,
  Sname CHAR(10) NOT NULL,
 
  select1 char(3),
  select2 char(3),
  select3 char(3),
  select4 char(3),
  select5 char(3),
  select6 char(3)
 )
create table Tselect
(
   Tno CHAR(10) PRIMARY KEY,
   Tname CHAR(10) NOT NULL,
   
   select1 char(3),
   select2 char(3),
   select3 char(3),
   select4 char(3),
   select5 char(3),
   select6 char(3),
   
 )
create table select_result
(
   Tno CHAR(10) PRIMARY KEY,
   Tname CHAR(10) NOT NULL,
   sums   int  NOT NULL,
   sno1 char(10),
   sname1 char(8), 
   sno2 char(10),
   sname2 char(8), 
   sno3 char(10),
   sname3 char(8), 
   sno4 char(10),
   sname4 char(8), 
   sno5 char(10),
   sname5 char(8), 
   sno6 char(10),
   sname6 char(8), 
   sno7 char(10),
   sname7 char(8), 
   sno8 char(10),
   sname8 char(8)
 )
  create table login_log1
  ( 
  
   name varchar(13),
   ondate varchar(20),
   ontime varchar(10)
   )
   create table st_log
   (
     users char(10),
     name char(3),
     ondate char(20),
     ontime char(10),
     content char(30)
     )
    create table secretary_log
   (
     users char(10),
     name char(3),
     data char(20),
     times char(10),
     content char(30)
     )
go
exec create_table

create view T_view
as
select Tno,Tname,sums
    from select_result
                             

use ST                 
go

IF EXISTS(SELECT name FROM sysobjects 
              WHERE name='insert_valuse1' AND type='P')
    DROP PROCEDURE insert_valuse1
GO
create procedure insert_valuse1
as

 insert into STUDENT values 
use ST
go                     
create role students 
grant insert,update
on student
to students
grant select
on teacher
to students
grant select
on select_result
to students 
grant insert,update,select
on Sselect
to students

create role teachers
grant select
on student
to teachers
grant insert,update
on teacher
to teachers
grant insert,update,select
on Sselect
to teachers
grant select
on select_result
to teachers

create role secretarys
grant insert,update,select,delete
on student
to secretarys
grant insert,update,select,delete
on teacher
to secretarys
                                        
create login s11           
with password='11'
create user s11
for login s11

create login s12
with password='12'
create user s12
for login s12
                        
create login s13
with password='13'
create user s13
for login s13

exec  sp_addrolemember'students','s11'   
exec  sp_addrolemember'students','s12'
exec  sp_addrolemember'students','s13'

create login t1   
with password='15'
create user t1
for login t1

create login t2
with password='16'
create user t2
for login T2

create login t3
with password='17'
create user t3
for login t3
exec  sp_addrolemember'teachers','t1'   
exec  sp_addrolemember'teachers','t2'
exec  sp_addrolemember'teachers','t3'



create login secretary
with password='123456';
create user secretary
for login secretary
exec  sp_addrolemember 'secretarys','secretary'


create view s1_Student     
as
select *
from Student
where Sno='95005'



grant update,select
on s1_Student
to s11



create view s2_Student             
as
select *
from Student 
where Sno='95003'


grant update,select
on s2_Student
to s12

create view s3_Student              
as
select *
from Student
where Sno='95004'

grant update,select
on s3_Student
to s13


create view t1_Teacher            
as
select *
from teacher
where tno='10004'

grant update,select
on t1_Teacher
to t1

select *
from t1_Teacher

create view t2_Teacher             
as
select *
from teacher
where tno='10005'
grant update,select
on t2_Teacher
to t2

create view t3_Teacher              
as
select *
from teacher
where tno='10003'
grant update,select
on t3_Teacher
to t3

select *
from  t3_teacher

              
use ST
go
create procedure on_log
as
insert into login_log1(name,ondate,ontime) values(system_user,CONVERT(varchar(10),GETDATE(),110),CONVERT(varchar(25),getdate(),114))


USE master
GO 
create procedure tt
as
begin
EXEC sp_addumpdevice 'disk','gg','D:\data\1327010178ÕÅ·«.bak'
BACKUP DATABASE ST TO gg
end

exec tt

