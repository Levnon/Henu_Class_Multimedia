create database ST
go

use ST
go  
create table student   
(Sno char(10)  primary key,
Sname char(15) not null,
Sage int not null,
Ssex char(15) not null,
Sdept char(15) not null,
Sclass char(15) not null,
Sinterest char(15) not null)


create table teacher  
(Tno char(10) primary key,
Tname char(15) not null,
Tage int not null,
Tsex char(15) not null,
Tdept char(15) not null,
Ttitle char(15) not null,
Tre1 char(15) not null,
Tre2 char(15) not null,
Tre3 char(15) not null)

 
create table SST  
(Sno char(10) not null,
Sname char(15) not null,
Tno1 char(10) not null,
Tno2 char(10),
Tno3 char(10),
Tno4 char(10),
Tno5 char(10),
Tno6 char(10),
constraint pk_SST primary key(Sno),
constraint fk_SST foreign key (Sno) references Student(Sno))



create table TSS   
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
constraint pk_TSS primary key(Tno),
constraint fk_TSS foreign key(Tno) references teacher(Tno) )

create table TSRE    
(Tno char(10) not null,
Tname char(15) not null,
num char(10),
Sno1 char(10),
Sname1 char(15),
Sno2 char(10),
Sname2 char(15),
Sno3 char(10),
Sname3 char(15),
Sno4 char(10),
Sname4 char(15),
Sno5 char(10),
Sname5 char(15),
Sno6 char(10),
Sname6 char(15),
Sno7 char(10),
Sname7 char(15),
Sno8 char(10),
Sname8 char(15),
constraint pk_TSRE primary key(Tno),
constraint fk_TSRE foreign key(Tno) references teacher(Tno) )


create table Dlog   
(uname char(15),
name char(15) not null,
date date not null,
time time(7))



use ST    
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
   
   exec student_add '1327010001'
    exec student_add '1327010002'
     exec student_add '1327010003'
     exec student_add '1327010004'
     exec student_add '1327010005'
     exec student_add '1327010006'
     exec student_add '1327010007'
     exec student_add '1327010008'
     exec student_add '1327010009'
     exec student_add '1327010010'
     exec student_add '1327010011'
     exec student_add '1327010012'
     exec student_add '1327010013
     exec student_add '1327010014'
     exec student_add '1327010015'
     exec student_add '1327010016'
     exec student_add '1327010017'
     exec student_add '1327010018'
     exec student_add '1327010019'
     exec student_add '1327010020'
     exec student_add '1327010021'
     exec student_add '1327010022'
     exec student_add '1327010023'
     exec student_add '1327010024'
     exec student_add '1327010025'
     exec student_add '1327010025'
     exec student_add '1327010026'
     exec student_add '1327010027'
     exec student_add '1327010028'
     exec student_add '1327010029'
     exec student_add '1327010030'
     exec student_add '1327010031'
     exec student_add '1327010032'
     
     
     
     
use ST                             
go
if exists(select name from sysobjects where xtype='p' and name='teacher_add')
   drop procedure teacher_add
   go
   create procedure teacher_add
   (@Tno char(10),@Tname char(15),@Tage int,@Tsex char(15),@Tdept char(15),@Ttitle char(15),
   @Tre1 char(15),@Tre2 char(15),@Tre3 char(15)) 
   as
   begin
   insert into teacher values(@Tno,@Tname,@Tage,@Tsex,@Tdept,@Ttitle ,@Tre1,@Tre2,@Tre3)
   end
   return
   go
                                                                                                
                                                                                              
  
   
create role sRole   
grant select
on teacher
to sRole
grant insert 
on SST
to sRole


create role tRole    
grant select
on student
to tRole
grant insert 
on tss
to tRole


create role c_role                
grant update,insert,delete
on student
to c_role
grant update,insert,delete
on teacher
to c_role




create login s1   
with password='111111'
create user s1
for login s1

create login s2
with password='222222'
create user s2
for login s2

create login s3
with password='333333'
create user s3
for login s3

exec sp_addrolemember'srole','s1'   
exec  sp_addrolemember'srole','s2'
exec  sp_addrolemember'srole','s3'


create login t1   
with password='111111'
create user t1
for login t1

create login t2
with password='222222'
create user t2
for login T2

create login t3
with password='333333'
create user t3
for login t3


exec sp_addrolemember'trole','t1'  
exec  sp_addrolemember'trole','t2'
exec  sp_addrolemember'trole','t3'


create login c1        
with password='111111'
create user c_user
for login c1 


exec sp_addrolemember 'c_role','c_user'     


create view s1_student    
as
select *
from STUDENT
where Sno='1327010002'

grant update,select
on s1_student
to s1


create view s2_student             
as
select *
from student 
where Sno='1327010001'

grant update,select
on s2_student
to s2

create view s3_student              
as
select *
from STUDENT
where Sno='1327010003'

grant update,select
on s3_student
to s3



create view t1_teacher              
as
select *
from teacher
where tno='1'

grant update,select
on t1_teacher
to t1


create view t2_teacher             
as
select *
from teacher 
where tno='2'

grant update,select
on t2_teacher
to t2

create view t3_teacher             
as
select *
from teacher
where tno='3'

grant update,select
on t3_teacher
to t3


create view c1   
select *
from Dlog

grant update,select
on C1
to C1



use ST     
go
if exists(select name from sysobjects where xtype='p' and name='Dlog_add')
   drop procedure Dlog_add
   go
   create procedure Dlog_add
   (@uname char(15),@name char(15),@date date,@time time(7))
   as
   begin
   insert into Dlog values(@uname,@name,@date,@time)
   end
   return
   go
   
   exec Dlog_add 'ASUS','2014-6-29','20:00'
   
   
   
  use master 
  go
  exec sp_addumpdevice 'disk','STBAK','D:\data\STBAK.bak'
  backup database ST to STBAK

















 
   
   
   
   
   
   
   
   
   
   
   
   



