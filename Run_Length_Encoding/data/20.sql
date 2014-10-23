create database ABD
go
use ABD
go
create table Student
(Sno char(9)primary key,
Sname char(20),
Sage smallint,
Ssex char(2),
Sdept char(20),
Sclass int,
Smajor char(20)
)
create table Tutor
(Tno char(9)primary key,
Tname char(20),
Tage smallint,
Tsex char(2),
Tdept char(20),
Tjob char(20),
Tmajor1 char(20),
Tmajor2 char(20),
Tmajor3 char(20)
)
create table Svolunteer
(Sno char(9),
Sname char(20),
Tno char(9),
Tname char(20),
Sorder int,
primary key(Sno,Tno),
foreign key(Sno) references Student(Sno),
foreign key(Tno) references Tutor(Tno)
)
create table Tvolunteer
(Tno char(9),
Tname char(20),
Sno char(9),
Sname char(20),
Torder int,
primary key(Tno,Sno),
foreign key(Sno) references student(Sno),
foreign key(Tno) references tutor(Tno)
)

create table Tresult
(Tno char(9)primary key,
Tname char(20),
Sno1 char(9),
Sname1 char(20),
Sno2 char(9),
Sname2 char(20),
Sno3 char(9),
Sname3 char(20),
Sno4 char(9),
Sname4 char(20),
Sno5 char(9),
Sname5 char(20),
Sno6 char(9),
Sname6 char(20),
Sno7 char(9),
Sname7 char(20),
Sno8 char(9),
Sname8 char(20),
foreign key(Tno) references tutor(Tno)
)

drop database ABD
drop table Tvolunteer
drop  table Svolunteer
drop  table student
drop  table tutor
drop  table Tresult

insert into Student(Sno,Sname,Sage,Ssex,Sdept,Sclass,Smajor)

insert into Tutor(Tno,Tname,Tage,Tsex,Tdept,Tjob,Tmajor1,Tmajor2,Tmajor3)
values


create role student
create role tutor
create role secretary

use ABD
go
grant update,insert
on Student
to student
go
grant select
on Tutor
to student
go
grant select
on Tvolunteer
to student
go
grant insert,update
on Tutor
to tutor
go
grant select
on Student
to tutor
go
grant select,update,insert
on Svolunteer
to tutor
go
grant delete,update,select,insert
on Student
to secretary
go
grant delete,update,select,insert
on Tutor
to secretary
go

create login S1
with password='111'
create user S1
for login S1

create login S2    
with password='112'
create user S2
for login S2

create login S3
with password='113'
create user S3
for login S3

drop login S1
drop user S1
drop login S2
drop user S2
drop login S3
drop user S3

exec sp_addrolemember'student','S1'  
exec  sp_addrolemember'student','S2'
exec  sp_addrolemember'student','S3'
exec sp_addrolemember'tutor','S1'  
exec  sp_addrolemember'tutor','S2'
exec  sp_addrolemember'tutor','S3'

create login T1
with password='01'
create user T1
for login T1

create login T2
with password='02'
create user T2
for login T2

create login T3
with password='03'
create user T3
for login T3

drop login T1
drop user T1
drop login T2
drop user T2
drop login T3
drop user T3

exec sp_addrolemember'student','T1'  
exec  sp_addrolemember'student','T2'
exec  sp_addrolemember'student','T3'
exec sp_addrolemember'tutor','T1'  
exec  sp_addrolemember'tutor','T2'
exec  sp_addrolemember'tutor','T3'

create view S1_Student
as
select *
from Student
where Sno='111'

create view S2_Student
as
select *
from Student
where Sno='112'

create view S3_Student
as
select *
from Student
where Sno='113'

create view T1_Tutor
as
select *
from Tutor
where Tno='01'

create view T2_Tutor
as
select *
from Tutor
where Tno='02'

create view T3_Tutor
as
select *
from Tutor
where Tno='03'

grant update,select
on S1_Student
to S1

grant update,select
on S2_Student
to S2

grant update,select
on S3_Student
to S3

grant update,select
on T1_Tutor
to T1

grant update,select
on T2_Tutor
to T2

grant update,select
on T3_Tutor
to T3

 exec sp_addumpdevice 'disk','cpbak','D:\data\backup_st.bak'
 backup database ABD to cpbak
