create database SCG    
go

use SCG
go

create  procedure choose       
as
begin
  create table Student          
  (
     sno char(5) primary key,
     Sname char(10),
     Ssex bit,
     Sage char(2),
     Sdept char(10),
     Sclass char(6),
     Sinterest char(20)
  );
  
  create table Guider           
  (
      Gno char(5) primary key,
      Gname char(10) ,
      Gsex bit,
      Gage char(2),
      Gdept char(10),
      Gpost char(6),
      Gdirection1 char(20),
      Gdirection2 char(20),
      Gdirection3 char(20)     
  );
  
  create table SG     
  (
      Sno char(5),
      Gno char(5),
      Sname char(10),
      Gname char(10),
      Gorder char(5),
      primary key (Sno,Gno),
      foreign key (Sno) references Student(Sno),
      foreign key (Gno) references Guider(Gno)
  );
  
    create table GS   
  (
      Sno char(5),
      Gno char(5),
      Sname char(10),
      Gname char(10),
      Gorder char(5),
      primary key (Sno,Gno),
      foreign key (Sno) references Student(Sno),
      foreign key (Gno) references Guider(Gno)
  );
  
  create table guider_log        
(
   Gno char(5) ,
   Glogin char(20),
   Gname  char(10),
   Gtime  datetime,
   Newdata char(10),
   Olddata char(10),
   operater char(8)
);

create table Student_log    
(
   Sno char(5) ,
   Slogin char(20),
   Sname  char(10),
   Stime  datetime,
   Newdata char(10),
   Olddata char(10),
   operater char(8)
);

create table syslogin_log   
(nowuser char(15) default current_user,
 nowdate date default convert(varchar(12),getdate(),111),
 nowtime time default convert(char(8),getdate(),108))

create table guider_info   
( 
   Gno char(5),
   Gname char(10),
   Studnt_num char(2),
   Stuno_1 char(5),
   Stuname_1 char(10),
   Stuno_2 char(5),
   Stuname_2 char(10),
   Stuno_3 char(5),
   Stuname_3 char(10),
   Stuno_4 char(5),
   Stuname_4 char(10),
   Stuno_5 char(5),
   Stuname_5 char(10),
   Stuno_6 char(5),
   Stuname_6 char(10),
   Stuno_7 char(5),
   Stuname_7 char(10),
   Stuno_8 char(5),
   Stuname_8 char(10), 
);
end

exec choose

use SCG
go
create procedure insertedinfo
as
begin


   insert into Student(sno,Sname,Sage,Ssex,Sdept,Sclass,Sinterest)
   values


    insert into Guider(Gno,Gname,Gage,Gsex,Gdept,Gdirection1,Gdirection2,Gdirection3)
    values 
     
         
     insert into SG(Sno,Sname,Gno,Gname,Gorder)
     values
           
           
 insert into GS(Gno,Gname,Sno,Sname,Gorder)
     values          
     
insert into guider_info(Gno,Gname,Studnt_num)
values
end
exec insertedinfo 

select *
from Student

create role secRole;
grant select,update,insert
on  Student 
to secRole

grant select,update,insert
on  Guider
to secRole

create login sec
with password='sec'
create user sec_user
for login sec 



exec sp_addrolemember 'secRole','sec_user'

create role stuRole;

grant select
on Guider
to stuRole
grant insert 
on SG
to stuRole


create role guiRole;

grant select
on Student
to guiRole
grant insert 
on GS
to guiRole


create login s1
with password='01'
create user s1
for login s1

create login s2    
with password='02'
create user s2
for login s2

create login s3
with password='03'
create user s3
for login s3


exec sp_addrolemember'stuRole','s1'  
exec  sp_addrolemember'stuRole','s2'
exec  sp_addrolemember'stuRole','s3'


create view s1_student 
as
select *
from Student
where Sno='01'

grant update,select
on s1_student
to s1


create view s2_student
as
select *
from student 
where Sno='02'

grant update,select
on s2_student
to s2

create view s3_student
as
select *
from STUDENT
where Sno='03'

grant update,select
on s3_student
to s3


create login g1   
with password='001'
create user g1
for login g1

create login g2
with password='002'
create user g2
for login g2

create login g3
with password='003'
create user g3
for login g3


exec sp_addrolemember'guiRole','g1'  
exec  sp_addrolemember'guiRole','g2'
exec  sp_addrolemember'guiRole','g3'


create view g1_guider
as
select *
from Guider
where Gno='001'

grant update,select
on g1_guider
to g1


create view g2_guider
as
select *
from Guider 
where Gno='002'

grant update,select
on g2_guider
to g2

create view g3_guider
as
select *
from Guider
where Gno='003'

grant update,select
on g3_guider
to g3


if exists(select name from sysobjects where xtype='p' and name='register_p')
   drop procedure register_p
   go
   create procedure register_p
   as
   begin
   insert into syslogin_log values( default,default,default)
   end

exec register_p
   
   

create trigger Update_guider_log
on guider
FOR update  
AS
declare @no char(5),
@name char(10),
@login char(20),
@age char(2) ,
@dept char(10),
@post char(6),
@time datetime,
@new char(10),
@old char(10)
BEGIN
begin
  select @no=inserted.Gno,@login=CURRENT_USER,@name=deleted.Gname,@time=CURRENT_TIMESTAMP
  from inserted,deleted
end

if update(Gname)
begin
  select @new=inserted.Gname, @old=deleted.Gname
  from inserted,deleted
end
else
if update(Gsex)
begin
 select @new=inserted.Gsex, @old=deleted.Gsex
  from inserted,deleted
end
else
if update(Gage)
begin
 select @new=inserted.Gage, @old=deleted.Gage
  from inserted,deleted
end
else
if update(Gdept)
begin
 select @new=inserted.Gdept, @old=deleted.Gdept
  from inserted,deleted
end
else
if update(Gpost)
begin
 select @new=inserted.Gpost, @old=deleted.Gpost
  from inserted,deleted
end
begin
  insert into guider_log values(@no,@login,@name,@time,@new,@old,'update')
end
END

create trigger Update_Student_log
on Student
for update
as
declare @no char(10),
@name char(10),
@login char(20),
@age char(2) ,
@dept char(10),
@time datetime,
@new char(10),
@old char(10)
BEGIN

begin
  select @login=CURRENT_USER,@name=deleted.Sname,@time=CURRENT_TIMESTAMP
  from inserted,deleted
end

if update(Sname)
begin
  select @new=inserted.Sname, @old=deleted.Sname
  from inserted,deleted
end
else
if update(Ssex)
begin
 select @new=inserted.Ssex, @old=deleted.Ssex
  from inserted,deleted
end
else
if update(Sage)
begin
 select @new=inserted.Sage, @old=deleted.Sage
  from inserted,deleted
end
else
if update(Sdept)
begin
 select @new=inserted.Sdept, @old=deleted.Sdept
  from inserted,deleted
end
else
if update(Sclass)
begin
 select @new=inserted.Sclass, @old=deleted.Sclass
  from inserted,deleted
end
begin
  insert into Student_log values(@no,@login,@name,@time,@new,@old,'update')
end
END
   


   if exists(select name from sysobjects where xtype='p' and name='backup_stsystem')
   drop procedure backup_stsystem
   go
   create procedure backup_stsystem
   as  
   exec sp_addumpdevice 'disk','cpbak','D:\data\backup_stsystem.bak'
   backup database SCG to cpbak with init
   return 
   go 
   exec backup_stsystem


 insert into student values('35',null,null,null,null,null,null)
update student 
set Sno='36'
where Sno='35' 
select * from Student
select * from Student_log


 execute  as user='s1'
 update s1_student
 set Sage='55'

 Revert
 go
 
 execute  as user='s2'
 update s1_student
 set Sage='55'
