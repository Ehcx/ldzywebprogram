--3.4第一题
--向 T_student_info 表插入数据：“102011，刘德华，男，03/23/1991，2009，湖南
--长沙劳动东路 168 号”；
insert into T_student_info
values('102011','刘德华','男','03/23/1991',2009,'湖南长沙劳动东路168号')

--3.4第二题
--查询出 1991 年出生的学生信息；
select *
from T_student_info
--where birth>='1991-1-1 0:0' and birth<='1991-12-31 23:59'
where year(birth)='1991'
--year()的作用是取出字段的年份

--3.4第三题
--查询选修了“数据结构”的学生姓名、平时成绩、期末成绩、总评成绩；
select b.student_name as 学生姓名,a.ordinary_scores as 平时成绩,a.end_scores as 期末成绩,a.total_scores as 总评成绩
from T_student_scores a,T_student_info b,T_course_info c
where a.student_no=b.student_no and a.course_no=c.course_no
 and c.course_name='数据结构'
 
 --3.4第四题
 --创建视图查询学生的学号、姓名、课程名、总评成绩；
 create view v_scores
 as
 select b.student_no as 学号,b.student_name as  姓名,c.course_name as 课程名,a.total_scores as 总评成绩
 from T_student_scores a,T_student_info b,T_course_info c
 where a.student_no=b.student_no and a.course_no=c.course_no
 
 --3.4第五题
 --分组统计
 --统计每门课程的选课人数、最高分、平均分，并将统计结果保存在表 T_total 中。
 select b.course_name as 课程名称,COUNT(a.course_no)as 选课人数,MAX(a.total_scores) as 最高分,AVG(a.total_scores) as 平均分
 into T_total
 from T_student_scores a,T_course_info b
 where a.course_no=b.course_no 
 group by a.course_no,b.course_name
 
 --课程编号相同的为一组
 --将查询结果保存到一张新的数据表中，into 新表名
 --补充：
 --1、如果有统计条件，例如：只查询选课人数低于10人课程的选课人数，最高分，平均分
 --having COUNT(*)<=10
 --2、如果要去显示课程名称,则需要再添加一张表