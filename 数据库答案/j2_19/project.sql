---第2题
--在 T_course 表插入数据：“004，001，高等数学，3”；
insert into T_course 
values('004','高等数学','001',3)

---第3题：查询 “电子政务”专业开设的课程
select a.*
from T_course a,T_speciality b
where a.specialityid=b.id and b.name='电子政务'

--第4题：查询 “电子政务”专业有哪些考生报名
select distinct a.name
from T_enroll a,T_speciality b,T_course c
where a.course_id=c.id and c.specialityid=b.id
 and b.name='电子政务'
 ---如果一个考生报了多门课程，会出现多条记录,这样我们
 --用distinct来消除重复记录

--第5题：查询出报考课程为“信息安全”的考生
select a.name
from T_enroll a,T_course b
where a.course_id=b.id and b.name='信息安全'

--第6题：创建可查询考生姓名，报考课程名称的视图
create view v_enroll
as
select a.name as 考生姓名,b.name as 报考课程名称
from T_enroll a,T_course b
where a.course_id=b.id

--第7题：创建存储过程，查询报考某门课程（以课程名称为参数）的考生
create proc p_enroll(@coursename varchar(20))
as
select a.name
from T_enroll a,T_course b
where a.course_id=b.id and b.name=@coursename

exec p_enroll '信息安全'