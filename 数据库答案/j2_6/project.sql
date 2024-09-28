--3.4第一题
--在三个表分别中录入 3 条测试数据（样本数据包含下面题目中使用的数据）；
insert into T_category values(1,'车辆','2016-09-20 16:10')

insert into T_product values(1,'宝马740',400,'高级轿车','2016-09-20 16:10')

insert into T_product_review values(1,1,'好车好车','2016-09-21 16:10')

--3.4第二题
--查询某类别下评论数超过 3 条的所有产品的名称；
select a.product_name as 产品名称
from T_product a,T_product_review b,T_category c
where a.product_id=b.product_id and a.category_id=c.category_id and c.category_name='车辆'
group by a.product_id,a.product_name
having COUNT(b.product_id)>3
--分组统计查询：把表中记录根据某个字段分成若干组，然后组内进行统计，再根据组内统计结果设置条件

--3.4第三题
--查询产品价格超过 400 元的所有产品；
select *
from T_product
where price>=400



--3.4第四题
--创建名为 product_view1 的视图，视图中的数据包括录入日期在 2011 年 3 月到 6月之间的产品数据信息；
create view product_view1
as
select *
from T_product
where register_date>='2011-03-01 0:0' and register_date<='2011-06-30 23:59'
--方法：主语法
--1、寻找主语，根据主语找到查询表
--2、寻找查询定语，分析定语数据来源表
--3、分析上两张表是否直接关联，没有还需要找到桥表，再在where子句中写出连接条件
--4、写出查询条件

--3.4第五题
--删除上题中所创建的视图 product_view1；
drop view product_view1



--3.4第六题
--删除产品价格超过 400 的所有产品。
delete from T_product
where price>400

-