create database tea_stu

use tea_stu
go

create table student   
(Sno char(10) not null primary key,
Sname char(15) not null,
Sage smallint not null,
Ssex char(15) not null,
Sdept char(15) not null,
Sclass char(15) not null,
Sintere char(20) not null,
)
 

create table teacher   
(Tno char(10) not null primary key,
Tname char(15) not null,
Tage smallint not null,
Tsex char(15) not null,
Tdept char(15) not null,
Ttitle char(15) not null,
Tin1 char(20) not null,
Tin2 char(20) ,
Tin3 char(20) ,
)


create table Sselect   
(Sno char(10) not null primary key,
Sname char(15) not null,
Tno1 char(10) not null,
Tno2 char(10),
Tno3 char(10),
Tno4 char(10),
Tno5 char(10),
Tno6 char(10),
foreign key (Sno) references Student(Sno))



create table Tselect   
(Tno char(10) not null primary key,
Tname char(15) not null,
Sno1 char(10) not null,
Sno2 char(10),
Sno3 char(10),
Sno4 char(10),
Sno5 char(10),
Sno6 char(10),
Sno7 char(10),
Sno8 char(10),
foreign key(Tno) references Teacher(Tno) )






if exists(select name from sysobjects                 
            where name='studentadd' and type='p')
   drop procedure STUDENTadd
   go
   create procedure studentadd
   (@Sno char(10),@Sname char(15),@Sage smallint,@Ssex char(15),@Sdept char(15),@Sclass char(15),@Sintere char(20))
   as
   insert into STUDENT values(@Sno,@Sname,@Sage,@Ssex,@Sdept,@Sclass,@Sintere)
    
                                 

if exists(select name from sysobjects where name='teacheradd' and type='p' )
   drop procedure teacheradd
   go
   create procedure teacheradd
   (@Tno char(10),@Tname char(15),@Tage smallint,@Tsex char(15),@Tdept char(15),@Ttitle char(15),
   @Tin1 char(20),@Tin2 char(20),@Tin3 char(20)) 
   as
   insert into teacher values(@Tno,@Tname,@Tage,@Tsex,@Tdept,@Ttitle ,@Tin1,@Tin2,@Tin3)

   
   
     
     

                                                                                                

   
   

create view stu1              
as
select *
from STUDENT
where Sno='101'

create view stu2             
as
select *
from student 
where Sno='102'

create view stu3              
as
select *
from student
where Sno='103'

create view tea1             
as
select *
from teacher
where tno='101'

create view tea2            
as
select *
from teacher 
where tno='102'

create view tea3              
as
select *
from teacher
where tno='103'
   
   
   
create role sstudent     
grant select
on teacher
to sstudent
grant insert 
on Sselect
to sstudent




create login s1111  
with password='111111'
create user s111
for login s1111

create login s2222
with password='222222'
create user s222
for login s2222

create login s3333
with password='333333'
create user s333
for login s3333



exec  sp_addrolemember'sstudent','s111'   
exec  sp_addrolemember'sstudent','s222'
exec  sp_addrolemember'sstudent','s333'

grant update,select
on stu1
to s111

grant update,select
on stu2
to s222

grant update,select
on stu3
to s333



create role tteacher     
grant select
on student
to tteacher
grant insert 
on tselect
to tteacher


create login t1111    
with password='11111'
create user t111
for login t1111

create login t2222
with password='22222'
create user t222
for login t2222

create login t3333
with password='33333'
create user t333
for login t3333


exec  sp_addrolemember'tteacher','t111'   
exec  sp_addrolemember'tteacher','t222'
exec  sp_addrolemember'tteacher','t333'

grant update,select
on tea1
to t111

grant update,select
on tea2
to t222

grant update,select
on tea3
to t333



create role secreta            
grant update,insert,delete
on student
to secreta
grant update,insert,delete
on teacher
to secreta




create login sec11
with password='1111'
create user secre11
for login sec11



exec sp_addrolemember 'secreta','secre1'



create table register    
(newuser char(20) default current_user,
 newdate date default convert(char(10),getdate(),102),
 newtime time default convert(char(8),getdate(),108))
 
 
if exists(select name from sysobjects where name='register1' and type='p')
   drop procedure register1
   go
   create procedure register1
   as
   insert into register values( default,default,default)
 



if exists(select name from sysobjects where name='backup1' and type='p')
   drop procedure backup1
   go
   create procedure backup1
   as 
   begin
   exec sp_addumpdevice 'disk','cpbak','e:\data\1327010171÷‹ø…ø….bak'
   backup database tea_stu to cpbak with init
   end  
   
   exec backup1
   
  









 
   
   
   
   
   
   
   
   
   
   
   
   



