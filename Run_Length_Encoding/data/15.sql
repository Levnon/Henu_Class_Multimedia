create database xdx   
go

use xdx
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
 

create table syslogin_log   
(nowuser char(15) default current_user,
 nowdate date default convert(varchar(12),getdate(),111),
 nowtime time default convert(char(8),getdate(),108))

create table guider_info   
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

use xdx
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
grant insert, update ,select
on SG
to stuRole

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



create role guiRole;
grant select
on Student
to guiRole
grant insert ,delete,update
on GS
to guiRole


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





if exists(select name from sysobjects where xtype='p' and name='register_p')
   drop procedure register_p
   go
   create procedure register_p
   as
   begin
   insert into syslogin_log values( default,default,default)
   end

- execute  as user='g1'
 select*  from STUDENT
 Revert
 go
 execute  as user='s1'
 
  select*  from guider


   




