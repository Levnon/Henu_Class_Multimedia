create database STsystem
go

use STsystem
go   


create procedure 
as
begin
create table student   
(Sno char(10) not null,
Sname char(15) not null,
Sage int not null,
Ssex char(15) not null,
Sdept char(15) not null,
Sclass char(15) not null,
Sinterest char(15) not null,
constraint pk_Sno primary key(Sno))
create table tutor   
(Tno char(10) not null,
Tname char(15) not null,
Tage int not null,
Tsex char(15) not null,
Tdept char(15) not null,
Ttitle char(15) not null,
Tre1 char(15) not null,
Tre2 char(15) not null,
Tre3 char(15) not null,
constraint pk_Tno primary key(Tno))
create table STchoose  
(Sno char(10) not null,
Sname char(15) not null,
Tno1 char(10) not null,
Tno2 char(10),
Tno3 char(10),
Tno4 char(10),
Tno5 char(10),
Tno6 char(10),
constraint pk_STchoose primary key(Sno),
constraint fk_STchoose foreign key (Sno) references student(Sno))
create table TSchoose   
(Tno char(10) not null,
Tname char(15) not null,
Sno1 char(10),
Sno2 char(10),
Sno3 char(10),
Sno4 char(10),
Sno5 char(10),
Sno6 char(10),
Sno7 char(10),
Sno8 char(10),
constraint pk_TSchoose primary key(Tno),
constraint fk_TSchoose foreign key(Tno) references Tutor(Tno) )
end
return
go







use STsystem       
go
if exists(select name from sysobjects where xtype='p' and name='student_add')
   drop procedure STUDENT_add
   go
   create procedure student_add
   (@Sno char(10),@Sname char(15),@Sage int,@Ssex char(15),@Sdept char(15),@Sclass char(15),@Sinterest char(15))
   as
   begin
   insert into STUDENT values(@Sno,@Sname,@Sage,@Ssex,@Sdept,@Sclass,@Sinterest)
   end
   return
   go
   
   
   
    
     
     
    
use STsystem                               
if exists(select name from sysobjects where xtype='p' and name='tutor_add')
   drop procedure tutor_add
   go
   create procedure tutor_add
   (@Tno char(10),@Tname char(15),@Tage int,@Tsex char(15),@Tdept char(15),@Ttitle char(15),
   @Tre1 char(15),@Tre2 char(15),@Tre3 char(15)) 
   as
   begin
   insert into tutor values(@Tno,@Tname,@Tage,@Tsex,@Tdept,@Ttitle ,@Tre1,@Tre2,@Tre3)
   end
   return
   go
                                                                                                
     
     
     
     
                                                                                               
   
   
   
   
create role sRole     
grant select
on tutor
to sRole
grant insert 
on STchoose
to sRole


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




exec sp_addrolemember'srole','s1'  
exec  sp_addrolemember'srole','s2'
exec  sp_addrolemember'srole','s3'




create view s1_student               
as
select *
from STUDENT
where Sno='101'



grant update,select
on s1_student
to s1



create view s2_student             
as
select *
from student 
where Sno='102'



grant update,select
on s2_student
to s2



create view s3_student              
as
select *
from STUDENT
where Sno='103'



grant update,select
on s3_student
to s3


create role tRole     
on student
to tRole
grant insert 
on tschoose
to tRole


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


exec sp_addrolemember'trole','t1'   
exec  sp_addrolemember'trole','t2'
exec  sp_addrolemember'trole','t3'


create view t1_tutor               
as
select *
from tutor
where tno='01'

grant update,select
on t1_tutor
to t1


create view t2_tutor             
as
select *
from tutor 
where tno='02'

grant update,select
on t2_tutor
to t2

create view t3_tutor              
as
select *
from tutor
where tno='03'

grant update,select
on t3_tutor
to t3

create role clerk_role                  
grant update,insert,delete
on student
to clerk_role



grant update,insert,delete
on tutor
to clerk_role



create login clerk              
with password='clerk'
create user clerk_user
for login clerk 



exec sp_addrolemember 'clerk_role','clerk_user'





select * from tutor                          
select * from s1_student
update s1_student set Sclass='2' where Sno='101'
   
select * from student                        
select * from t1_tutor 
update t1_tutor set Tdept

insert into student values








create table register_table     
(nowuser char(15) default current_user,
 nowdate date default convert(varchar(12),getdate(),111),
 nowtime time default convert(char(8),getdate(),108))
 if exists(select name from sysobjects where xtype='p' and name='register_p')
   drop procedure register_p
   go
   create procedure register_p
   as
   begin
   insert into register_table values( default,default,default)
   end
 
 
 exec register_p
 
 
 select *
 from register_table


 
 
 
 
 
 use master                  
 go
   exec	sp_addumpdevice 'disk','CPBAK','D:\data\CPBAK.bak'
   BACKUP DATABASE STsystem TO CPBAK
   
