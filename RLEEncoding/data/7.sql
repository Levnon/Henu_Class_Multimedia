create database ST 

use ST

go

create procedure table_add     
as

begin

  create table Student     
  (
    Sno char(10) primary key,
    Sname char(20) not null,
    Sage int,
    Ssex bit,
    Sdept char(20),
    Class char(6),
    Sinterest char(20) not null
   );
   
  create table Tutor     
  (
    Tno char(10) primary key,
    Tname char(20) not null,
    Tage int,
    Tsex bit,
    Tdept char(20),
    Ttitle char(20),
    Tdirection1 char(20) not null,
    Tdirection2 char(20),
    Tdirection3 char(20)
   );
   
   create table SchooseT       
   (
     Sno char(10) primary key,
     Sname char(20),
     Tno1 char(10) not null,
     Tno2 char(10),  
     Tno3 char(10),  
     Tno4 char(10),  
     Tno5 char(10),  
     Tno6 char(10),
     TOrder char(6),
     foreign key(Sno) references Student(Sno),
     foreign key(Tno1) references Tutor(Tno),
     foreign key(Tno2) references Tutor(Tno), 
     foreign key(Tno3) references Tutor(Tno), 
     foreign key(Tno4) references Tutor(Tno), 
     foreign key(Tno5) references Tutor(Tno),
     foreign key(Tno6) references Tutor(Tno)
   );
   create table TchooseS      
   (
     Tno char(10) primary key,
     Tname char(20),
     Sno1 char(10) not null, 
     Sno2 char(10), 
     Sno3 char(10), 
     Sno4 char(10),
     Sno5 char(10),
     Sno6 char(10),
     Sno7 char(10),
     Sno8 char(10),
     Sorder char(8), 
     foreign key(Sno1) references Student(Sno),
     foreign key(Sno2) references Student(Sno),
     foreign key(Sno3) references Student(Sno),
     foreign key(Sno4) references Student(Sno),
     foreign key(Sno5) references Student(Sno),
     foreign key(Sno6) references Student(Sno),
     foreign key(Sno7) references Student(Sno),
     foreign key(Sno8) references Student(Sno)
   );
   
   create table Tresult       
   (
     Tno char(10) primary key,
     Tname char(20),
     Sno1 char(10) not null,
     Sname1 char(20) not null,
     Sno2 char(10),
     Sname2 char(20),
     Sno3 char(10),
     Sname3 char(20),
     Sno4 char(10),
     Sname4 char(20),
     Sno5 char(10),
     Sname5 char(20),
     Sno6 char(10),
     Sname6 char(20),
     Sno7 char(10),
     Sname7 char(20),
     Sno8 char(10),
     Sname8 char(20)
   );
   
   create table Enter_log    
   (
     username char(20)default current_user,
     enterdate date default convert(varchar(12),getdate(),111),
     entertime time default convert(char(8),getdate(),108)
   )
   
end
   
exec table_add    


use ST 
  
go
create procedure table_insert
as

begin

    insert into Student(Sno,Sname,Sage,Ssex,Sdept,Class,Sinterest)   
    
    insert into Tutor(Tno,Tname,Tage,Tsex,Tdept,Ttitle,Tdirection1,Tdirection2,Tdirection3)   
    values
          
end

exec table_insert     

create role boss      
EXEC sp_addrolemember'DB_OWNER','boss'


create role Secretary  
grant update,insert,delete
on Student
to Secretary
grant update,insert,delete
on Tutor
to Secretary

create login Secretary 
with password='123546'
create user Secretary_user
for login Secretary 

exec sp_addrolemember 'Secretary','Secretary_user'


create role Student_role 
grant select
on Tutor
to Student_role
grant insert 
on SchooseT
to Student_role


create login student1   
with password='123456'
create user student1
for login student1

create login student2    
with password='123456'
create user student2
for login student2

create login student3
with password='123456'
create user student3
for login student3

exec  sp_addrolemember'Student_role','student1'     
exec  sp_addrolemember'Student_role','student2'
exec  sp_addrolemember'Student_role','student3'

create view student_1   
as
select *
from Student
where Sno='001'

grant update,select
on student_1
to student1


create view student_2   
select *
from Student 
where Sno='002'

grant update,select
on student_2
to student2


create view student_3 
as
select *
from Student
where Sno='003'

grant update,select
on student_3
to student3



create role Tutor_role      
grant select
on Student
to Tutor_role
grant insert 
on TchooseS
to Tutor_role


create login tutor1     
with password='123456'
create user tutor1 
for login tutor1 

create login tutor2 
with password='123456'
create user tutor2 
for login tutor2 

create login tutor3 
with password='123456'
create user tutor3 
for login tutor3 

exec  sp_addrolemember'Tutor_role','tutor1 '     
exec  sp_addrolemember'Tutor_role','tutor2'
exec  sp_addrolemember'Tutor_role','tutor3 '


create view tutor_1      
as
select *
from Tutor
where Tno='01'

grant update,select
on tutor_1
to tutor1


create view tutor_2       
as
select *
from Tutor
where Tno='02'

grant update,select
on tutor_2
to tutor2

create view tutor_3     
as
select *
from Tutor
where Tno='03'

create procedure Enter      
as

begin

insert into Enter_log values( default,default,default)

end

exec Enter    
select * from Enter_log  

If exists(select name from sysobjects     
where name='backup_ST' and type='p')
drop procedure backup_ST
go
create procedure backup_ST
as
exec sp_addumpdevice 'disk','cpbak','D:\data\backup_ST.bak'
backup database ST to cpbak with init
return 

go

exec backup_ST
exec sp_dropdevice cpbak
 
execute  as user='student

 update
 set Sage='25'
 where Sno='001'
 
 Revert
 
 execute  as user='student2'

 update Student2
 set Sage='22'
 where Sno='002'
 
 
 
Revert

execute  as user='tutor2'

select * from  SchooseT
  

 

 
update tutor_2
set Tage='55'
where Tno='02'
 