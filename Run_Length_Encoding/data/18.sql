create database u
go
use u
go
create procedure stu
as
begin
    create table student
   (ssno char(10) primary key,
    sname char(10)unique,
    sclass char(10),
    sage char(10),
    ssex char(10),
    ssdept char(10),
    sinterest char(10))
   
    
    
    create table guideteacher
   (gsno char(10)primary key,
    gname char(10),
    gage char(10),
    gsex char(10),
    gsdept char(10),
    gcall char(10),
    gdircection1 char(10),
    gdircection2 char(10),
    gdircection3 char(10))
    
    
    create table studentwish
    (ssno char(10),
    sname char(10),
    gsno char(10),
    gname char(10),
    foreign key(ssno) references student(ssno),
    foreign key(gsno) references guideteacher(gsno))

    
    
    
    create table guidewish
    (gsno char(10),
    gname char(10),
    ssno char(10),
    sname char(10),
   
    foreign key(ssno) references student(ssno),
    foreign key(gsno) references guideteacher(gsno))

    
    
    create table chooseresult
    (
    gsno char(10)primary key,
    gname char(10),
    gnumber char(10),
    ssno1 char(10),
    sname1 char(10),
    ssno2 char(10),
    sname2 char(10),
    ssno3 char(10),
    sname3 char(10),
    ssno4 char(10),
    sname4 char(10),
    ssno5 char(10),
    sname5 char(10),
    ssno6 char(10),
    sname6 char(10),
    ssno7 char(10),
    sname7 char(10),
    ssno8 char(10),
    sname8 char(10))
    create table log

    end
   exec stu
    select*from student
    
 
 use u
go
create procedure st5
as
begin
   insert into guideteacher(gsno ,gname ,gage ,gsex,gsdept ,gcall ,gdircection1 ,gdircection2,gdircection3 )

   end
   exec st5
   
    
 

   use u 
go



create role teacher
grant select on Student to teacher

create role student
grant select on guideteacher to student


create role mishu
grant insert,update,delete,select on student to mishu
grant insert,update,delete,select on guideteacher to mishu
grant select on chooseresult to mishu

create login zheng with password='1';
create user  FOR LOGIN zheng 

create login zheng2 with password='2';
create user OR LOGIN zheng2 

create login zheng3 with password='2';
create user OR LOGIN zheng3
EXEC sp_addrolemember'student',
EXEC sp_addrolemember'student',
EXEC sp_addrolemember'student',

create login hte1 with password='111'

create login hte2 with password='111'


create login hte3 with password='111'





create login nh1 with password='111'
create user mr1 for login nh1
EXEC sp_addrolemember'mishu','mr1'



use u
go

as select *
from student
where ssno='5'


as select *
from studentwish
where ssno='5'



create vie
as select *
from student
where Sno='8'

as select *
from studentwish 
where Sno='8'

as select *
from student
where Sno='14'


as select *
from studentwish 
where Sno='14'







execute as user=

select *
from student

select *


revert






create view view
as select *
from teacher
where gsno='1'

create view view
as select *
from teacherwish
where gsno='20006'


create view view
as select *
from teacher
where gsno='5'

create view view
as select *
from teacherwish
where gsno='5'

create view view_
as select *
from teacher
where gsno='10'

create view view
as select *
from teacherwish
where gsno='10'

grant insert,update on view_
grant insert,update,select on view

grant insert,update on view
grant insert,update,select on view



execute as user='

select *
from guideteacher 
use u
go
select*
from view


revert

use u 
go
create procedure logt
as
begin
insert into log values
( CURRENT_USER,current_user ,
convert(varchar(10),getdate(),103),convert(varchar(10),getdate(),24))
end
exec logt
select *from log
USE u 
GO
create procedure ping
as
begin
exec sp_addumpdevice 'disk','asz','
backup database u to asz
END
EXEC ping  
