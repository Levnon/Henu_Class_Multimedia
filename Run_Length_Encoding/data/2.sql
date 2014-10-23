create database sst
go
use
sst
create table student 
(Sno char(10) not null,
Sname char(15) not null,
Sage int not null,
Ssex char(15) not null,
Sdept char(15) not null,
Sclass char(15) not null,
Sinterest char(15) not null,
constraint pk_Sno primary key(Sno))


create table teacher  
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


create table sst  
(Sno char(10) not null,
Sname char(15) not null,
Tno1 char(10) not null,
Tno2 char(10),
Tno3 char(10),
Tno4 char(10),
Tno5 char(10),
Tno6 char(10),
constraint pk_sst primary key(Sno),
constraint fk_sst foreign key (Sno) references Student(Sno))



create table tss  
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
constraint pk_tss primary key(Tno),
constraint fk_tss foreign key(Tno) references teacher(Tno) )





use sst    
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
   
   exec student_add '001'
    exec student_add '002'
     exec student_add '003'
     exec student_add '004'
     exec student_add '005'
     exec student_add '006'
     exec student_add '007'
     exec student_add '008'
     exec student_add '009'
     exec student_add '010'
     exec student_add '011'
     exec student_add '012'
     exec student_add '013'
     exec student_add '014'
     exec student_add '015'
     exec student_add '016'
     exec student_add '017'
     exec student_add '018'
     exec student_add '019'
     exec student_add '020'
     exec student_add '021'
     exec student_add '022'
     exec student_add '023'
     exec student_add '024'
     exec student_add '025'
     exec student_add '026'
     exec student_add '027'
     exec student_add '028'
     exec student_add '029'
     exec student_add '030'
     exec student_add '031'
     exec student_add '032'
     
     
     
     
use sst                                
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
on sst
to sRole

create login s2    
with password='001'
create user s2
for login s2

create login s1
with password='002'
create user s1
for login s1

create login s3
with password='003'
create user s3
for login s3

exec sp_addrolemember'srole','s1'  
exec  sp_addrolemember'srole','s2'
exec  sp_addrolemember'srole','s3'


create view s1_student              
as
select *
from STUDENT
where Sno='001'

grant update,select
on s1_student
to s1


create view s2_student             
as
select *
from student 
where Sno='002'

grant update,select
on s2_student
to s2

create view s3_student              
as
select *
from STUDENT
where Sno='003'

grant update,select
on s3_student
to s3


create role tRole    
grant select
on student
to tRole
grant insert 
on tss
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


create view t1_teacher               
as
select *
from teacher
where tno='01'

grant update,select
on t1_teacher
to t1


create view t2_teacher             
as
select *
from teacher 
where tno='02'

grant update,select
on t2_teacher
to t2

create view t3_teacher             
as
select *
from teacher
where tno='03'

grant update,select
on t3_teacher
to t3


create role clerk_role                   
grant update,insert,delete
on student
to clerk_role
grant update,insert,delete
on teacher
to clerk_role


create login clerk
with password='clerk'
create user clerk_user
for login clerk 



exec sp_addrolemember 'clerk_role','clerk_user'























 
   
   
   
   
   
   
   
   
   
   
   
   



