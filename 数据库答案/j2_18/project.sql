---第一题
---在 T_student 表插入数据：“2009010001，张学友，男，1980-10-4，2009-9-1，15012345678，湖南长沙”，无；
insert into T_student
values('2009010001','张学友','男','1980-10-4','2009-9-1','15012345678','湖南长沙','无')

--第二题
-- 查询出籍贯为“湖南长沙”的学生基本信息
select *
from T_student
where birth_place='湖南长沙'

--第三题
--查询出姓名为“张学友”的学生所有课程的成绩
select c.course_name,a.score
from T_score a,T_student b,T_course c
where a.stud_id=b.stud_id and a.course_id=c.course_id and b.stud_name='张学友'

--第四题
--查询出“数据库应用”这门课的平均成绩
select avg(a.score) as 平均成绩
from T_score a,T_course b
where a.score_id=b.course_id and b.course_name='数据库应用'

--第五题
--创建视图查询学生的姓名，手机号码和籍贯
create view v_stud
as
select stud_name as 姓名,mobile as 手机号码,birth_place as 籍贯
from T_student

--第六题
---创建存储过程，查询指定课程名称的最高成绩
create proc p_max_score(@scorename varchar(100))
as
select @scorename as 课程名,MAX(a.score) as 最高成绩
from T_score a,T_course b
where a.course_id=b.course_id and b.course_name=@scorename

exec p_max_score '数据库应用'