create database stsystem
go


use
STsystem   
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

create table STapply   
(Sno char(10) not null,
Sname char(15) not null,
Tno1 char(10) not null,
Tno2 char(10),
Tno3 char(10),
Tno4 char(10),
Tno5 char(10),
Tno6 char(10),
constraint pk_STapply primary key(Sno),
constraint fk_STapply foreign key (Sno) references Student(Sno))



create table TSapply 
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
constraint pk_TSapply primary key(Tno),
constraint fk_Tsapply foreign key(Tno) references Tutor(Tno) )




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
go
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
on tutor
to sRole




grant insert 
on STapply
to sRole




create login student2    
with password='102'

create user student2
for login student2

create login student1
with password='101'
create user student1
for login student1

create login student3
with password='103'
create user student3
for login student3

exec sp_addrolemember'srole','student1'   
exec  sp_addrolemember'srole','student2'
exec  sp_addrolemember'srole','student3'


create view s1_student              
as
select *
from STUDENT
where Sno='101'

grant update,select
on s1_student
to student1

create view s2_student             
as
select *
from student 
where Sno='102'

grant update,select
on s2_student
to student2

create view s3_student              
as
select *
from STUDENT
where Sno='103'

grant update,select
on s3_student
to student3


create role tRole     
grant select
on student
to tRole
grant insert 
on tsapply
to tRole




create login teacher1    
with password='01'
create user teacher1
for login teacher1

create login teacher2
with password='02'
create user teacher2
for login teacher2

create login teacher3
with password='03'
create user teacher3
for login teacher3

exec sp_addrolemember'trole','teacher1'   
exec  sp_addrolemember'trole','teacher2'
exec  sp_addrolemember'trole','teacher3'


create view t1_tutor               
select *
from tutor
where tno='01'

grant update,select
on t1_tutor
to teacher1


create view t2_tutor             
as
select *
from tutor 
where tno='02'

grant update,select
on t2_tutor
to teacher2

create view t3_tutor              
as
select *
from tutor
where tno='03'

grant update,select
on t3_tutor
to teacher3


create role mishu_role                  
grant update,insert,delete
on student
to mishu_role
grant update,insert,delete
on tutor
to mishu_role


create login mishu
with password='mishu'
create user mishu_user
for login mishu 



exec sp_addrolemember 'mishu_role','mishu_user'



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
 



if exists(select name from sysobjects where xtype='p' and name='backup_stsystem')
   drop procedure backup_stsystem
   go
   create procedure backup_stsystem
   as 
   begin
  
   exec sp_addumpdevice 'disk','stsystem','D:\data\backup_st.bak'
   
   
   backup database STsystem to backup_st
   end  
   
   
   
   execute  as login='student1'   
revert


 
