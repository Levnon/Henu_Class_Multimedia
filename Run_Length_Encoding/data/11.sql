create database xuan_daoshi
use xuan_daoshi
go
create procedure create_table_view     
as
create table student         
(
sno char(10) primary key,
sname char(10) not null,
sage char(2),
ssex char(2),
sdept char(20) not null,
class char(10),
sinterest char(20)
)
create table teacher          
(
tno char(10) primary key,
tname char(10) not null,
tage char(2),
tsex char(2),
tdept char(20),
trank char(10) ,
tinterst1 char(20),
tinterst2 char(20),
tinterst3 char(20)
)
create table student_xuan_teacher   
(
sno char(10) primary key,
sname char(10) not null,
tno1 char(10),
tname1 char(10),
tno2 char(10),
tname2 char(10),
tno3 char(10),
tname3 char(10), 
tno4 char(10),
tname4 char(10),
tno5 char(10),
tname5 char(10),
tno6 char(10),
tname6 char(10),
foreign key(sno) references student(sno),
foreign key(tno1) references teacher(tno),
foreign key(tno2) references teacher(tno),
foreign key(tno3) references teacher(tno),
foreign key(tno4) references teacher(tno),
foreign key(tno5) references teacher(tno),
foreign key(tno6) references teacher(tno)
)
create table teacher_xuan_student    
(
tno char(10) primary key,
tname char(10) not null,
sno1 char(10),
sname1 char(10),
sno2 char(10),
sname2 char(10),
sno3 char(10),
sname3 char(10), 
sno4 char(10),
sname4 char(10),
sno5 char(10),
sname5 char(10),
sno6 char(10),
sname6 char(10),
sno7 char(10),
sname7 char(10),
sno8 char(10),
sname8 char(10),
foreign key(tno) references teacher(tno),
foreign key(sno1) references student(sno),
foreign key(sno2) references student(sno),
foreign key(sno3) references student(sno),
foreign key(sno4) references student(sno),
foreign key(sno5) references student(sno),
foreign key(sno6) references student(sno),
foreign key(sno7) references student(sno),
foreign key(sno8) references student(sno),
)
create table      student_result   
sno char(10),
sname char(10),
tno char(10),
tname char(10)
foreign key(sno) references student(sno),
foreign key(tno) references teacher(tno),
)
create table     teacher_result     
(
tno char(10) primary key,
tname char(10) not null,
sno1 char(10),
sname1 char(10),
sno2 char(10),
sname2 char(10),
sno3 char(10),
sname3 char(10), 
sno4 char(10),
sname4 char(10),
sno5 char(10),
sname5 char(10),
sno6 char(10),
sname6 char(10),
sno7 char(10),
sname7 char(10),
sno8 char(10),
sname8 char(10),
foreign key(tno) references teacher(tno),
foreign key(sno1) references student(sno),
foreign key(sno2) references student(sno),
foreign key(sno3) references student(sno),
foreign key(sno4) references student(sno),
foreign key(sno5) references student(sno),
foreign key(sno6) references student(sno),
foreign key(sno7) references student(sno),
foreign key(sno8) references student(sno),
)

create table teacher_xuanze_jieguo    
(
tno char(10) primary key,
tname char(10) not null,
numstudent char(2),
sno1 char(10),
sname1 char(10),
sno2 char(10),
sname2 char(10),
sno3 char(10),
sname3 char(10), 
sno4 char(10),
sname4 char(10),
sno5 char(10),
sname5 char(10),
sno6 char(10),
sname6 char(10),
sno7 char(10),
sname7 char(10),
sno8 char(10),
sname8 char(10),
foreign key(tno) references teacher(tno),
foreign key(sno1) references student(sno),
foreign key(sno2) references student(sno),
foreign key(sno3) references student(sno),
foreign key(sno4) references student(sno),
foreign key(sno5) references student(sno),
foreign key(sno6) references student(sno),
foreign key(sno7) references student(sno),
foreign key(sno8) references student(sno),
)
create table deng_lu_rizhi    
(
username char(10),
logtime  datetime,
)


exec create_table_view 





create procedure insert_into       
as
insert into student         
values

exec insert_into

create procedure create_student_view @sno char(10)  --创建学生基本信息视图及志愿视图的存储过程
as        
declare @viewname1 char(50),@viewname2 char(50)
set @viewname1='student_view_'+@sno
set @viewname2='student_xuan_teacher_view'+@sno
exec ('
create view '+@viewname1+'
as
select sno,sname,sage,ssex,sdept,class,sinterest
from student
where sno='+@sno+'
')
exec('
create view '+@viewname2+'
as
select sno,sname,tno1,tname1,tno2,tname2,tno3,tname3,tno4,tname4,tno5,tname5,tno6,tname6
from student_xuan_teacher
where sno='+@sno+'
')
--执行该存储过程
exec create_student_view '1327010101'
exec create_student_view '1327010102'
exec create_student_view '1327010103'

create procedure create_teacher_view @tno char(10) 
as        
declare @viewname1 char(50),@viewname2 char(50)
set @viewname1='teacher_view_'+@tno
set @viewname2='teacher_xuan_student_view'+@tno
exec ('
create view '+@viewname1+'
as
select tno,tname,tage,tsex,tdept,trank,tinterst1,tinterst2,tinterst3
from teacher
where tno='+@tno+'
')
exec('
create view '+@viewname2+'
as
select tno,tname,sno1,sname1,sno2,sname2,sno3,sname3,sno4,sname4,sno5,sname5,sno6,sname6,sno7,sname7,sno8,sname8
from teacher_xuan_student
where tno='+@tno+'
')

exec create_teacher_view  '001'
exec create_teacher_view  '002'
exec create_teacher_view  '003'



use xuan_daoshi             
go
create role teacher_role
create role student_role
create role   jiaoxue_mishu_role





 grant select         
     to student_role
     

execute as user=
select *from teacher
revert

create procedure student_user_shouquan    @sno char(10), @username char(10)   --给学生用户授权的存储过
as
declare @viewname1 char(50),@viewname2 char(50)
set @viewname1='student_view_'+@sno
set @viewname2='student_xuan_teacher_view'+@sno
exec('
 grant select, insert,update,delete
 on '+@viewname1+'
 TO '+@username+'
 ')
exec('
 grant select, insert,update,delete
 on '+@viewname2+'
 TO '+@username+'
')

select *from student_view_1327010101
select *from student_xuan_teacher_view1327010101
revert                                             



grant select                                    
       on student
       to teacher_role
execute as user
select *from  student   
revert


create procedure teacher_user_shouquan    @tno char(10), @username char(10)  
as
declare @viewname1 char(50),@viewname2 char(50)
set @viewname1='teacher_view_'+@tno
set @viewname2='teacher_xuan_student_view'+@tno
exec('
 grant select, insert,update,delete
 on '+@viewname1+'
 TO '+@username+'
 ')
exec('
 grant select, insert,update,delete
 on '+@viewname2+'
 TO '+@username+'
')  

exec  teacher_user_shouquan '001'
execute as user=
select *from teacher_view_001                             
select *from teacher_xuan_student_view001
revert  



grant select,update,insert,delete    
     on student 
     to jiaoxue_mishu_role
grant select,update,insert,delete    
     on teacher
     to jiaoxue_mishu_role
grant select                        
     on teacher_xuanze_jieguo
     to jiaoxue_mishu_role
execute as user
select *from student
select *from teacher
select *from teacher_xuanze_jieguo      
revert    
  
  

CREATE procedure  insert_deng_lu_rizhi
as
declare
@user char(10),
@time datetime
begin
SELECT @user=CURRENT_USER,@time=CURRENT_TIMESTAMP
INSERT INTO deng_lu_rizhi VALUES(@user,@time)
end 

exec insert_deng_lu_rizhi   

create procedure beifen

exec beifen