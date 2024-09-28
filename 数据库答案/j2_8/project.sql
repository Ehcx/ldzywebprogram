--3.4第一题
--在每个表中插入 1 条测试数据（样本数据包含下面题目中使用的数据）；
insert into T_canton_info 
values(1,360,'01011','娄底娄星区','娄底市','位于湖南中部')

insert into T_proj_info
values(1,1,'西部物流园','01021','商业',120,110,'娄底市国土局')
--有先后顺序、数据前后有关系、自动增长字段

--3.4第二题
--查询出项目编号为“1”的建设用地基本信息；
select  *
from T_proj_info
where proj_no='1'

--3.4第三题
--查询出行政直属部门为“长沙市国土资源局”的建设用地基本信息；
select a.*
from T_proj_info a,T_canton_info b
where a.canton_id=b.canton_id and b.branch='长沙市国土资源局'

--3.4第四题
--查询出所有的建设土地基本信息,并按农用地总面积升序排序；
select *
from T_proj_info
order by farm_tot asc
--order by 排序子句，asc升序，desc降序

--3.4第五题
--删除耕地面积大于“720”的建设用地基本信息；
delete 
from T_proj_info
where tilth_state>720

--3.4第六题
--请把直属部门由“长沙市国土资源局”修改为“株洲市国土资源局”；
update T_canton_info
set branch='株洲市国土资源局'
where branch='长沙市国土资源局'

--3.4第七题
--在行政区域信息表中插入数据，编号为“83100”，行政名称为“星沙”，行政面积
--为“142”，直属部门为“长沙市国土资源局”；
insert into T_canton_info values(1111,142,'83100','星沙','长沙市国土资源局',null)

--1、values子句中的值得项数如果小于可以输入的字段数，则在表名后加上字段
--列表，并且顺序要和值相同
--2、values子句中省掉的值，要么有默认值，要么可以为空

--3.4第八题
--创建名为 ProjInfo_view1 的视图，视图的数据为编号是“1”的建设用地基本信息；
create view ProjInfo_view1
as
select  *
from T_proj_info
where proj_no='1'

--3.4第九题
--删除上题中所创建的 ProjInfo_view1 视图。
drop view ProjInfo_view1



