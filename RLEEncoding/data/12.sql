create database Choose
go



use Choose
go  








create procedure 
as
begin

CREATE TABLE Student 
(Sno CHAR(9) not null,
 Sname CHAR(20) not null,
 Sage CHAR(4) not null,
 Ssex CHAR(2) not null,
 Sdept CHAR(20) not null,
 Sclass CHAR(10) not null,
 Shobby CHAR(20) not null,
 constraint pk_Sno primary key(Sno))


CREATE TABLE Teacher  
(Tno CHAR(9) not null,
 Tname CHAR(20) not null,
 Tage CHAR(4) not null,
 T_Sex CHAR(2) not null,
 Tdept CHAR(20) not null,
 Ttltle CHAR(20) not null,
 Thobby1 CHAR(20) not null,
 Thobby2 CHAR(20) not null,
 Thobby3 CHAR(20) not null,
 constraint pk_Tno primary key(Tno))


CREATE TABLE S_T 
(Sno CHAR(9) not null,
 Sname CHAR(20) not null,
 T_Sno CHAR(9) not null,
 Tname CHAR(20) not null,
 Sorder1 CHAR(2) not null,
 Sorder2 CHAR(2),
 Sorder3 CHAR(2),
 Sorder4 CHAR(2),
 Sorder5 CHAR(2),
 Sorder6 CHAR(2),
constraint pk_S_T primary key(Sno),
constraint fk_S_T foreign key (Sno) references Student(Sno))



CREATE TABLE T_S
(Tno CHAR(9) not null,
 Tname CHAR(20) not null,
 Sno CHAR(9) not null,
 Sname CHAR(20) not null,
 Torder1 CHAR(2),
 Torder2 CHAR(2),
 Torder3 CHAR(2),
 Torder4 CHAR(2),
 Torder5 CHAR(2),
 Torder6 CHAR(2),
 constraint pk_T_S primary key(Tno),
 constraint fk_T_S foreign key(Tno) references Teacher(Tno) )






exec 







use Choose        

   create procedure add_S
   (@Sno char(10),@Sname char(15),@Sage int,@Ssex char(15),@Sdept char(15),@Sclass char(15),@Sinterest char(15))
   as
   begin
   insert into Student values(@Sno,@Sname,@Sage,@Ssex,@Sdept,@Sclass,@Sinterest)
   end
   return
   go
   
   
   
   
   
   
   
  
     
     
use Choose                                
go

   create procedure add_T
   (@Tno char(10),@Tname char(15),@Tage int,@T_Sex char(15),@Tdept char(15),@Ttitle char(15),
   @Tre1 char(15),@Tre2 char(15),@Tre3 char(15)) 
   as
   begin
   insert into Teacher values(@Tno,@Tname,@Tage,@T_Sex,@Tdept,@Ttitle ,@Tre1,@Tre2,@Tre3)
   end
   return
   go
                                                                                                
     
     
     
     
                                                                                                
   
   
   
   
   
   
create role Srole    
on Teacher
to Srole
grant insert 
on S_T
to Srole


create login s2    
with password='102'
create user s2
for login s2

create login s1
with password='101'
create user s1
for login s1

create login s3
with password='103'
create user s3
for login s3


exec  sp_addrolemember'Srole','s1'   
exec  sp_addrolemember'Srole','s2'
exec  sp_addrolemember'Srole','s3'







create view s1_Student          
as
select *
from Student
where Sno='101'



grant update,select
on s1_Student
to s1


select *
from s1_Student

create view s2_Student             
as
select *
from Student 
where Sno='102'


grant update,select
on s2_Student
to s2

create view s3_Student              
as
select *
from Student
where Sno='103'

grant update,select
on s3_Student
to s3


create role Trole     
grant select
on Student
to Trole
grant insert 
on T_S
to Trole




create login t1    
with password='01'
create user t1
for login t1

create login t2
with password='02'
create user t2
for login T2

create login t3
with password='03'
create user t3
for login t3
exec  sp_addrolemember'Trole','t1'   
exec  sp_addrolemember'Trole','t2'
exec  sp_addrolemember'Trole','t3'


create view t1_Teacher              
as
select *
from Teacher
where tno='01'

grant update,select
on t1_Teacher
to t1

select *
from t1_Teacher

create view t2_Teacher             
as
select *
from Teacher 
where tno='02'

grant update,select
on t2_Teacher
to t2

create view t3_Teacher              
as
select *
from Teacher
where tno='03'

grant update,select
on t3_Teacher
to t3








create table system_log
(
username varchar(20),
ondate varchar(10),
ontime varchar(20),
)

 


 create procedure on_log
as
begin
insert into system_log(username,ondate,ontime) values(system_user,CONVERT(varchar(10),GETDATE(),110),CONVERT(varchar(20),getdate(),114))
end
 
 
  exec on_log
 
 
 select *
 from system_log





  

   use master   
   go
   exec sp_addumpdevice 'disk','COBAK','D:\data\CPBAK.bak'
   backup database Choose to CPBAK