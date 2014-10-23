

create database xitong
go



use xitong
go
create procedure build
as

begin


 
create table student
(   sno      char(9)    not null   primary key,
    name     char(20)       null,
    age      smallint       null,
    sex      char(2)        null,
    dept     char(20)       null,
    class    char(20)       null,
    interest char(20)       null
)



create table teacher
(   number   char(9)     not null  primary key,
    name     char(20)        null,
    age      smallint        null,
    sex      char(2)         null,
    dept     char(20)        null,
    zhicheng char(20)        null,
    yanjiu1  char(20)        null,
    yanjiu2  char(20)        null,
    yanjiu3  char(20)        null
)



create table studentchoose
(   sno             char(9)      not null foreign key references student(sno),
    studentname     char(20)         null,
    number1         char(9)      not null foreign key references teacher(number),
    teacher1name    char(20)         null,
    number2         char(9)      not null foreign key references teacher(number),
    teacher2name    char(20)         null,
    number3         char(9)      not null foreign key references teacher(number),
    teacher3name    char(20)         null,
    number4         char(9)      not null foreign key references teacher(number),
    teacher4name    char(20)         null,
    number5         char(9)      not null foreign key references teacher(number),
    teacher5name    char(20)         null,
    number6         char(9)      not null foreign key references teacher(number),
    teacher6name    char(20)         null
)



create table teacherchoose
(   number           char(9)          not null foreign key references teacher(number),
    teachername      char(20)             null,
    sno1             char(9)          not null foreign key references student(sno),
    student1name     char(20)             null,
    sno2             char(9)          not null foreign key references student(sno),
    student2name     char(20)             null,
    sno3             char(9)          not null foreign key references student(sno),
    student3name     char(20)             null,
    sno4             char(9)          not null foreign key references student(sno),
    student4name     char(20)             null,
    sno5             char(9)          not null foreign key references student(sno),
    student5name     char(20)             null,
    sno6             char(9)          not null foreign key references student(sno),
    student6name     char(20)             null,
    sno7             char(9)          not null foreign key references student(sno),
    student7name     char(20)             null,
    sno8             char(9)          not null foreign key references student(sno),
    student8name     char(20)             null
)



create table caozuo_log
(   yonghu    char(20),
    name      char(20),
    riqi      date default convert(char(20),getdate(),102),
    shijian   time default convert(char(8),getdate(),108),
    caozuo    char(20)
)



create table login_log
(   yonghu char(20),
    name   char(20),
    riqi      date default convert(char(20),getdate(),102),
    shijian   time default convert(char(8),getdate(),108)
)

end

return
go



exec build



use xitong
go
create procedure charu
as
begin



insert into student 
    values
end
begin   

--向导师基本信息表中插入数据
       
insert into teacher
    values('123456781','t001',31,'男','x1','z1','y11','y12','y13'),
          ('123456782','t002',32,'女','x2','z2','y21','y22','y23'),
          ('123456783','t003',33,'男','x3','z3','y31','y32','y33'),
          ('123456784','t004',34,'女','x4','z4','y41','y41','y43'),
          ('123456785','t005',35,'男','x5','z5','y51','y52','y53'),
          ('123456786','t006',36,'女','x6','z6','y61','y62','y63'),
          ('123456701','t007',31,'男','x1','z1','y11','y12','y13'),
          ('123456702','t008',32,'女','x2','z2','y21','y22','y23'),
          ('123456703','t009',33,'男','x3','z3','y31','y32','y33'),
          ('123456704','t010',34,'女','x4','z4','y41','y41','y43'),
          ('123456705','t011',35,'男','x5','z5','y51','y52','y53'),
          ('123456706','t012',36,'女','x6','z6','y61','y62','y63'),
          ('123456001','t013',31,'男','x1','z1','y11','y12','y13'),
          ('123456002','t014',32,'女','x2','z2','y21','y22','y23'),
          ('123456003','t015',33,'男','x3','z3','y31','y32','y33'),
          ('123456004','t016',34,'女','x4','z4','y41','y41','y43')
end          
begin 


         
insert into studentchoose
    values
end
begin



insert into teacherchoose
    values
 end
 return 
 go

              
exec charu

use xitong 
go  
create view student1
    as
   select *
   from student
   where sno='111111111'
go



use xitong
select * from student1
go


use xitong 
go  
create view student2
    as
   select *
   from student
   where sno='222222222'
go



use xitong
select * from student2
go
 


use xitong
go
create view student3
    as
   select *
   from student
   where sno='333333333'
go



use xitong
select * from student3
go



use xitong
go
create view teacher1
    as
    select * 
    from  teacher
    where number='123456781' 
go



use xitong
select * from teacher1
go 


use xitong
go
create view teacher2
    as
    select * 
    from  teacher
    where number='123456782' 
go



use xitong
select * from teacher2
go



use xitong
go
create view teacher3
    as
    select * 
    from  teacher
    where number='123456783' 
go



use xitong
select * from teacher3
go


use xitong
go
create view student1choose
    as
   select *
   from studentchoose
   where sno='111111111'
go


use xitong
select * from student1choose
go



use xitong
go
create view student2choose
    as
   select *
   from studentchoose
   where sno='222222222'
go



use xitong
select * from student2choose
go



use xitong
go
create view student3choose
    as
   select *
   from studentchoose
   where sno='333333333'
go


use xitong
select * from student3choose
go


use xitong
go
create view teacher1choose
    as
   select *
   from teacherchoose
   where number='123456781'
go



use xitong
select * from teacher1choose
go



use xitong
go
create view teacher2choose
    as
   select *
   from teacherchoose
   where number='123456782'
go



use xitong
select * from teacher2choose
go


use xitong
go
create view teacher3choose
    as
   select *
   from teacherchoose
   where number='123456783'
go



use xitong
select * from teacher3choose
go



use xitong 
go
create view teacherresult
    as
     select number ,teachername ,sno ,studentname 
      from studentchoose,teacherchoose
      where   (teacherchoose.sno1=studentchoose.sno and teacherchoose.number=studentchoose.number1) or
              (teacherchoose.sno2=studentchoose.sno and teacherchoose.number=studentchoose.number1) or
              (teacherchoose.sno3=studentchoose.sno and teacherchoose.number=studentchoose.number1) or
              (teacherchoose.sno4=studentchoose.sno and teacherchoose.number=studentchoose.number1)
go



use xitong
select * from teacherresult


use xitong
go   
create view teacher1result
    as
    select number,teachername,sno,studentname
    from   teacherresult
    where  number='123456781'
go



use xitong
select * from teacher1result
go



use xitong
go
create view teacher1result1
    as 
    select number,teachername,shumu=(select COUNT(sno) from teacher1result)
    from    teacher1result
    where   number='123456781' and sno='111111111'
go


use xitong
select * from teacher1result1
go


use xitong
go   
create view teacher2result
    as
    select number,teachername,sno,studentname
    from   teacherresult
    where  number='123456782'
go


use xitong
select * from teacher2result
go


use xitong
go
create view teacher2result2
    as 
    select number,teachername,shumu=(select COUNT(sno) from teacher2result)
    from    teacher2result
    where   number='123456782' and sno='222222222'
go



use xitong
select * from teacher2result2 
go



use xitong
go   
create view teacher3result
    as
    select number,teachername,sno,studentname
    from   teacherresult
    where  number='123456783'
go


use xitong
select * from teacher3result
go



use xitong
go
create view teacher3result3
    as 
    select number,teachername,shumu=(select COUNT(sno) from teacher3result)
    from    teacher3result
    where   number='123456783' and sno='333333333'
go


use xitong
select * from teacher3result3
go


use xitong
go
create view student1result
    as
    select sno,studentname,number,teachername
    from   teacherresult
    where  sno='111111111'   
go


use xitong
select * from student1result
go
 


use xitong
go
create view student1result1
    as
    select sno,studentname,shumu=(select COUNT(number) from student1result)
    from   student1result
go


use xitong
select * from student1result1
go


use xitong
go
create view student2result
    as
    select sno,studentname,number,teachername
    from   teacherresult
    where  sno='222222222'   
go


use xitong
select * from student2result
go



use xitong
go
create view student2result2
    as
    select sno,studentname,shumu=(select COUNT(number) from student2result)
    from   student2result
go



use xitong
select * from student2result2
go


use xitong
go
create view student3result
    as
    select sno,studentname,number,teachername
    from   teacherresult
    where  sno='333333333'   
go



use xitong
select * from student3result
go
 


use xitong
go
create view student3result3
    as
    select sno,studentname,shumu=(select COUNT(number) from student3result)
    from   student3result
go



use xitong
select * from student3result3
go



use xitong
go
create trigger insert_student
on student
for insert
as
declare
@login char(20),
@name  char(20)
begin
begin
select @login=CURRENT_USER,@name=CURRENT_USER
from   inserted
end
begin
insert into caozuo_log values(@login,@name,default,default,
end
end
go 



use xitong
go
create trigger delete_student
on student
for delete
as
declare
@login char(20),
@name  char(20) 
begin
begin
select @login=CURRENT_USER,@name=CURRENT_USER
from   deleted
end
begin
insert into caozuo_log values(@login,@name,default,default,)
end
end
go



use xitong
go
create trigger update_student
on student
for update
as
declare
@login char(20),
@name  char(20) 
begin
begin
select @login=CURRENT_USER,@name=CURRENT_USER
from   deleted
end
begin
insert into caozuo_log values(@login,@name,default,default,)
end
end
go



use xitong
go
create trigger insert_teacher
on teacher
for insert
as
declare
@login char(20),
@name  char(20)
begin
begin
select @login=CURRENT_USER,@name=CURRENT_USER
from   inserted
end
begin
insert into caozuo_log values(@login,@name,default,default,)
end
end
go


use xitong
go
create trigger delete_teacher
on teacher
for delete
as
declare
@login char(20),
@name  char(20) 
begin
begin
select @login=CURRENT_USER,@name=CURRENT_USER
from   deleted
end
begin
insert into caozuo_log values(@login,@name,default,default,)
end
end
go


use xitong
go
create trigger update_teacher
on teacher
for update
as
declare
@login char(20),
@name  char(20)
begin
begin
select @login=CURRENT_USER,@name=CURRENT_USER
from   deleted
end
begin
insert into caozuo_log values(@login,@name,default,default,)
end
end
go



use xitong
go
create trigger insert_studentchoose
on studentchoose
for insert
as
declare
@login char(20),
@name  char(20)
begin
begin
select @login=CURRENT_USER,@name=CURRENT_USER
from   inserted
end
begin
insert into caozuo_log values(@login,@name,default,default,)
end
end
go



use xitong
go
create trigger delete_studentchoose
on studentchoose
for delete
as
declare
@login char(20),
@name  char(20)
begin
begin
select @login=CURRENT_USER,@name=CURRENT_USER
from   deleted
end
begin
insert into caozuo_log values(@login,@name,default,default,)
end
end
go



use xitong
go
create trigger update_studentchoose
on studentchoose
for update
as
declare
@login char(20),
@name  char(20)
begin
begin
select @login=CURRENT_USER,@name=CURRENT_USER
from   deleted
end
begin
insert into caozuo_log values(@login,@name,default,default,)
end
end
go



use xitong
go
create trigger insert_teacherchoose
on teacherchoose
for insert
as
declare
@login char(20),
@name  char(20)
begin
begin
select @login=CURRENT_USER,@name=CURRENT_USER
from   inserted
end
begin
insert into caozuo_log values(@login,@name,default,default,)
end
end
go


use xitong
go
create trigger delete_teacherchoose
on teacherchoose
for delete
as
declare
@login char(20),
@name  char(20) 
begin
begin
select @login=CURRENT_USER,@name=CURRENT_USER
from   deleted
end
begin
insert into caozuo_log values(@login,@name,default,default,)
end
end
go



use xitong
go
create trigger update_teacherchoose
on teacherchoose
for update
as
declare
@login char(20),
@name  char(20)
begin
begin
select @login=CURRENT_USER,@name=CURRENT_USER
from   deleted
end
begin
insert into caozuo_log values(@login,@name,default,default,)
end
end
go

   
use xitong   
create login  s001
    with password='123456'
create user s001
    for login s001
go
    

  
use xitong    
create login  s002
    with password='123456'
create user s002
    for login s002
go

   
use xitong    
create login  s003
    with password='123456'
create user s003
    for login s003
go


  
use xitong    
create login  t001
    with password='123456'
create user t001
    for login t001
go

   
use xitong    
create login  t002
    with password='123456'
create user t002
    for login t002 
go

   
use xitong
go    
create login  t003
    with password='123456'
create user t003
    for login t003
go

    
use xitong   
create login m00
    with password='123456'
create user m00
    for login m00
go


use xitong
create login y00
    with password='123456'
create user y00
    for login y00
go

use xitong
go
create role student
create role teacher
create role jiaoxuemishu
go


use xitong
go
grant  select
on teacher
to student
go



use xitong
go
grant select 
on student
to teacher
go



grant exec 
on login_logcharu
to student,teacher


exec sp_addrolemember 'student','s001'
exec sp_addrolemember 'student','s002'
exec sp_addrolemember 'student','s003'



exec sp_addrolemember 'teacher','t001'
exec sp_addrolemember 'teacher','t002'
exec sp_addrolemember 'teacher','t003'



use xitong
grant insert,update,select 
on student1 
to s001
grant insert,update,select 
on student1choose 
to s001
grant select
on student1result
to s001
grant select
on student1result1
to s001
go


use xitong
grant insert,update,select 
on student2 
to s002
grant insert,update,select 
on student2choose  
to s002
grant select
on student2result
to s002
grant select
on student2result2
to s002
go


use xitong
grant insert,update,select 
on student3 
to s003
grant insert,update,select 
on student3choose  
to s003
grant select
on student3result
to s003
grant select
on student3result3
to s003
go



use xitong
grant insert,update,select 
on teacher1 
to t001
grant insert,update,select 
on teacher1choose 
to t001
grant select
on teacher1result
to t001
grant select
on teacher1result1
to t001
go



use xitong
grant insert,update,select 
on teacher2 
to t002
grant insert,update,select 
on teacher2choose 
to t002
grant select
on teacher2result
to t002
grant select
on teacher2result2
to t002
go



use xitong
grant insert,update,select 
on teacher3 
to t003
grant insert,update,select 
on teacher3choose 
to t003
grant select
on teacher3result
to t003
grant select
on teacher3result3
to t003
go



use xitong
exec sp_addrolemember 'db_owner', 'm00'
go

use xitong
revoke select
on teacherresult
from m00
revoke select
on teacher1result
from m00
revoke select
on teacher2result
from m00
revoke select
on teacher3result
from m00
revoke select
on student1result
from m00
revoke select
on student2result
from m00
revoke select
on student3result
from m00



create procedure login_logcharu
as
begin
declare @yonghu char(20),@name char(20)
begin 
select @yonghu=CURRENT_USER,@name=CURRENT_USER
end
begin
insert into login_log values(@yonghu,@name,default,default)
end
end
go



exec login_logcharu


select * from login_log


execute as user='s001'


exec login_logcharu

revert 



select * from login_log

revert


use xitong
go
update student1
set name='s001'
update teacher1
set name='t001'
go



use master
go

backup database xitong to 















 








