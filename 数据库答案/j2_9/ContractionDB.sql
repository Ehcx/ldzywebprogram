--任务三 第一题
--在每个表中插入 1 条测试数据（样本数据包含下面题目中使用的数据）；
insert into T_appr_area values(1,'天心花苑','10001','2016-01-01 00:00:00','2015-12-10 00:00:00',100,'市城投')
insert into T_plot_info values('10001',1,100,'长沙市天心花苑','住宅','正方形')
--任务三 第二题
--查询出地块编号为“10001”的建设用地的报批基本信息；
select *
from T_appr_area
where plot_id='10001'

--任务三 第三题
--查询出地块名称为“长沙市天心花苑”的建设用地的报批基本信息；
select a.* 
from T_appr_area a,T_plot_info b
where b.plot_name='长沙市天心花苑' and a.plot_id=b.plot_id


--任务三 第四题
--查询出所有的地块基本信息并按地块面积升序排序；
select a.* 
from T_appr_area a,T_plot_info b
where a.plot_id=b.plot_id
order by b.total_area asc


--任务三 第五题
--删除地块面积大于“1100”的地块基本信息；
delete 
from T_plot_info
where total_area>1100


--任务三 第六题
--把地块名称为“长沙市天心花苑”修改为“株洲市天心花苑”；
update T_plot_info
set plot_name='株洲市天心花苑'
where plot_name='长沙市天心花苑'

--任务三 第七题
--在 T_plot_info 表中插入数据，(地块编号为“10006”，地块名称为“新型工业区”，
--地块面积为“1500”，地块用途为“工业用地”，图形类型为“长方形”的信息；
insert into T_plot_info values('10006','1',1500,'新型工业区','工业用地','长方形')

--任务三 第八题
--创建名为 Plot_id_view1 的视图，视图的数据为地块编号是“10005”的建设用地
--报批基本信息；
create view Plot_id_view1
as
select *
from T_appr_area
where plot_id='10005'

--任务三 第九题
--删除上题中所创建的 Plot_id_view1 视图。
drop view Plot_id_view1