
create database student_teacher

use student_teacher
go


create procedure jianbiao
as
create table Student
(
Sno char(10) primary key,
Sname char(10),
Sage int,
Ssex char(10),
Sdept char(15),
Sclass char(6),
Sinterest char(20)
)
create table Teacher
(
Tno char(10) primary key,
Tname char(10),
Tage int,
Tsex char(10),
Tdept char(15),
Tptitle char(20) ,
Trd1 char(20),
Trd2 char(20),
Trd3 char(20)
)
create table StuxuanTea
(
Sno char(10) primary key,
Sname char(10),
Tno1 char(10),
Tname1 char(10),
Tno2 char(10),
Tname2 char(10),
Tno3 char(10),
Tname3 char(10),
Tno4 char(10),
Tname4 char(10),
Tno5 char(10),
Tname5 char(10),
Tno6 char(10),
Tname6 char(10),
foreign key(Sno) references Student(Sno)
)
create table TeaxuanStu
(
Tno char(10) primary key,
Tname char(10),
Sno1 char(10),
Sname1 char(10),
Sno2 char(10),
Sname2 char(10),
Sno3 char(10),
Sname3 char(10),
Sno4 char(10),
Sname4 char(10),
Sno5 char(10),
Sname5 char(10),
Sno6 char(10),
Sname6 char(10),
Sno7 char(10),
Sname7 char(10),
Sno8 char(10),
Sname8 char(10),
foreign key(Tno) references Teacher(Tno)
)
create table jieguo_teacher
(
Tno char(10) primary key,
Tname char(10),
Sno1 char(10),
Sname1 char(10),
Sno2 char(10),
Sname2 char(10),
Sno3 char(10),
Sname3 char(10),
Sno4 char(10),
Sname4 char(10),
Sno5 char(10),
Sname5 char(10),
Sno6 char(10),
Sname6 char(10),
Sno7 char(10),
Sname7 char(10),
Sno8 char(10),
Sname8 char(10),
foreign key(Tno) references Teacher(Tno)
)
create table jieguo_student
(
Sno char(10) primary key,
Sname char(10),
Tno1 char(10),
Tname1 char(10),
Tno2 char(10),
Tname2 char(10),
Tno3 char(10),
Tname3 char(10),
Tno4 char(10),
Tname4 char(10),
Tno5 char(10),
Tname5 char(10),
Tno6 char(10),
Tname6 char(10),
Tno7 char(10),
Tname7 char(10),
Tno8 char(10),
Tname8 char(10),
foreign key(Sno) references Student(Sno)
)
create table xitong_rizhi
(
Ulogin char(10),
Uuser char(10),
Udate char(10),
Utime char(10)
)
create table TeaResult
(
Tno char(10) primary key,
Tname char(10),
Shu char(10),
Sno1 char(10),
Sname1 char(10),
Sno2 char(10),
Sname2 char(10),
Sno3 char(10),
Sname3 char(10),
Sno4 char(10),
Sname4 char(10),
Sno5 char(10),
Sname5 char(10),
Sno6 char(10),
Sname6 char(10),
Sno7 char(10),
Sname7 char(10),
Sno8 char(10),
Sname8 char(10),
foreign key(Tno) references Teacher(Tno)
)
exec('
create view tea_result
as
select *
from TeaResult

exec jianbiao

create procedure insert_shuju
as
insert into Student values

create role teacher

create role student
grant select on Teacher to student


create role mishu
grant insert,update,delete,select on Student to mishu
grant insert,update,delete,select on Teacher to mishu

create procedure create_user

create login teacher_denglu1 with password='teacher1'
create user
for login teacher_denglu1 with default_schema=dbo
exec sp_addrolemember 'teacher
create login teacher_denglu2 with password='teacher2'
create user 
for login teacher_denglu2 with default_schema=dbo
exec sp_addrolemember 'teacher',
create login teacher_denglu3 with password='teacher3'
create user 
for login teacher_denglu3 with default_schema=dbo
exec sp_addrolemember 'teacher



create login mishu_denglu with password='mishu'
create user 
for login mishu_denglu with default_schema=dbo
exec sp_addrolemember 'mishu',
exec create_user


as select *
from Student
where Sno='10001'

as select *
from StuxuanTea
where Sno='10001'

as select *
from jieguo_student
where Sno='10001'


as select *
from Student
where Sno='10006'


as select *
from StuxuanTea
where Sno='10006'

as select *
from jieguo_student
where Sno='10006'


as select *
from Student
where Sno='10023'


as select *
from StuxuanTea
where Sno='10023'


as select *
from jieguo_student
where Sno='10023'



execute as user

select *
from Student

select *





as select *
from Teacher
where Tno='20002'

as select *
from TeaxuanStu
where Tno='20002'

as select *
from jieguo_teacher
where Tno='20002'


as select *
from Teacher
where Tno='20006'

as select *
from TeaxuanStu
where Tno='20006'

as select *
from jieguo_teacher
where Tno='20006'



as select *
from Teacher
where Tno='20014'


as select *
from TeaxuanStu
where Tno='20014'

as select *
from jieguo_teacher
where Tno='20014'

grant insert,update on view_


revert

create procedure beifen
as
exec sp_addumpdevice 'disk',

exec beifen