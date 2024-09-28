--3.4第一题
--在三个表分别中录入 3 条测试数据（样本数据包含下面题目中使用的数据）；
insert into T_category values('车辆','2016-09-20 16:10')

insert into T_product values(1,'宝马740',800,'高级轿车','2016-09-20 16:10')

insert into T_product_review values(3,'好车好车','2016-09-21 16:10')

--3.4第二题
--查询某类别下所有产品；
select a.*
from T_product a,T_category b
where a.category_id=b.category_id and b.category_name='车辆'

--3.4第三题
--查询产品价格在 300-500 元之间的产品；
select *
from T_product
where price>=300 and price<=500


--3.4第四题
--查询录入日期在 2011 年 3 月到 6 月之间的产品数据；
select *
from T_product
where register_date>='2011-03-01 0:0' and register_date<='2011-06-30 23:59'
--方法：主语法
--1、寻找主语，根据主语找到查询表
--2、寻找查询定语，分析定语数据来源表
--3、分析上两张表是否直接关联，没有还需要找到桥表，再在where子句中写出连接条件
--4、写出查询条件

--3.4第五题
--查询产品价格在 90-200 元之间的所有评论；
select a.*
from T_product_review a,T_product b
where a.product_id=b.product_id and b.price>=90 and b.price<=200

--3.4第六题
--查询评论数在 1-3 条的所有产品。
select a.product_name,COUNT(b.product_id) as 评论条数
from T_product a,T_product_review b
where a.product_id=b.product_id
group by b.product_id,a.product_name
having COUNT(b.product_id)>=1 and COUNT(b.product_id)<=3

--分组统计查询：把表中记录根据某个字段分成若干组，然后组内进行统计，再根据组内统计结果设置条件