use Stutotea

create table student 
(Sno char(9) primary key,
Sname char(20) not null,
Sage smallint not null,
Ssex char(2) not null,
Sdept char(20) not null,
Sclass char(2) not null,
Sinster char(11) not null
);
drop table student

use Stutotea       
go
if exists(select name from sysobjects where xtype='p' and name='student_add')
   drop procedure student_add
   go
   create procedure student_add
   (@Sno char(9),@Sname char(20),@Sage smallint,@Ssex char(2),@Sdept char(20),@Sclass char(2),@Sinster char(11))
   as
   begin
   insert into student values(@Sno,@Sname,@Sage,@Ssex,@Sdept,@Sclass,@Sinster)
   end
   return
   go
 


create table teacher 
(Tno char(9) primary key,
Tname char(20) not null,
Tage smallint not null,
Tsex char(2) not null,
Tdept char(20) not null,
Tjob char(20) not null,
Tstu1 char(20) not null,
Tstu2 char(20) not null,
Tstu3 char(20) not null
);

use Stutotea      
go
if exists(select name from sysobjects where xtype='p' and name='teacher_add')
   drop procedure teacher_add
   go
   create procedure teacher_add
   (@Tno char(9),@Tname char(20),@Tage smallint,@Tsex char(2),@Tdept char(20),@Tjob char(20),
   @Tstu1 char(20),@Tstu2 char(20),@Tstu3 char(20)) 
   as
   begin
   insert into teacher values(@Tno,@Tname,@Tage,@Tsex,@Tdept,@Tjob,@Tstu1,@Tstu2,@Tstu3)
   end
   return
   go



create table stuTOteacher 
(sno char(9) primary key,
sname char(20) not null,
Tno1 char(9) not null,
Tno2 char(9) not null,
Tno3 char(9) not null,
Tno4 char(9) not null,
Tno5 char(9) not null,
Tno6 char(9) not null
foreign key(sno) references student(sno));

create table teaTOstu 
(Tno char(9) primary key,
Tname char(20) not null,
Sno1 char(9) not null,
Sno2 char(9) not null,
Sno3 char(9) not null,
Sno4 char(9) not null,
Sno5 char(9) not null,
Sno6 char(9) not null,
Sno7 char(9) not null,
Sno8 char(9) not null
foreign key(Tno) references teacher(Tno));

create table sumtable 
(Tno char(9) not null,
Tname char(20) not null,
Sno1 char(9) not null,
sname1 char(20) not null,
sno2 char(9) not null,
sname2 char(20) not null,
sno3 char(9) not null,
sname3 char(20) not null,
sno4 char(9) not null,
sname4 char(20) not null,
sno5 char(5) not null,
sname5 char(20) not null,
sno6 char(5) not null,
sname6 char(20) not null,
sno7 char(5) not null,
sname7 char(20) not null,
sno8 char(5) not null,
sname8 char(20) not null
)


create role sturole 
grant select
on teacher
to sturole
grant insert
on stuTOteacher
to sturole

create login s101 
with password='111'
create user s101
for login s101

create login s201
with password='222'
create user s201
for login s201

create login s301
with password='333'
create user s301
for login s301

exec sp_addrolemember'sturole','s101' 
exec sp_addrolemember'sturole','s201'
exec sp_addrolemember'sturole','s301'

create view s101_student   
as
select *
from student
where Sno='100000001'

grant update,select
on s101_student
to s101

create view s201_student 
as
select *
from student
where Sno='100000002'

grant update,select
on s201_student
to s201

create view s301_student 
as
select *
from student
where Sno='100000003'

grant update,select
on s301_student
to s301

create role tearole 
grant select
on student
to tearole
grant insert
on teaTOstu
to tearole

create login t101
with password='001'
create user t101
for login t101

create login t201
with password='002'
create user t201
for login t201

create login t301
with password='003'
create user t301
for login t301

exec sp_addrolemember'tearole','t101' 
exec sp_addrolemember'tearole','t201'
exec sp_addrolemember'tearole','t301'

create view t101_teacher  
as
select *
from teacher
where Tno='200000001'

grant update,select
on t101_teacher
to t101

create view t201_teacher 
as
select *
from teacher
where Tno='200000002'

grant update,select
on t201_teacher
to t201

create view t301_teacher 
as
select *
from teacher
where Tno='200000003'

grant update,select
on t301_teacher
to t301

create role secrole 
grant insert,update,delete
on student
to secrole
grant insert,update,delete
on teacher
to secrole
grant select
on teatostu
to secrole

create login sec0
with password='123456'
create user sec0
for login sec0 


create table stuandtea_table  
(nowuser char(9) default current_user,
nowdate date default convert(varchar(12),getdate(),111),
nottime time default convert(char(8),getdate(),108))




if exists(select name from sysobjects where xtype='p' and name='stuandtea_add')
   drop procedure stuandtea_add
   go
   create procedure stuandtea_add
   as
   begin
   insert into stuandtea values( default,default,default)
   end
   

If exists(select name from sysobjects     
where name='backup1' and type='p')
drop procedure backup1
go
create procedure backup1
as
exec sp_addumpdevice 'disk','cpbak','D:\data\132701019
backup database stutotea to cpbak with init
return 
go

exec backup1    

   
   
  
   execute as login='s10'
   update s10_student
   set sdept='MA'
   where Sno='100000002'
   revert
   go
   
   
   execute as login='t101'
   
   select *
   from t101_teacher
   where Tno='200000001'