use BankCreditLoanDB

--3.4第一题
--根据对逻辑数据模型的理解，分别向三个表中插入一条测试数据（样本数据包含下面题目中使用的数据）
insert into T_customer_info values('2016091801','永恒科技','肖健','湖南娄底','417000')

insert into T_cust_credit_level values('2016091801','01','2016-09-18 00:00:00','2017-03-18 00:00:00')

insert into T_his_cust_credit_level values('2016091801','01','2016-09-18 00:00:00','2017-03-18 00:00:00')

--3.4第二题
--查询客户名称为“XX 公司”的信用等级（说明：“XX 公司”为插入测试数据中的公司名称）；
select a.credit_level
from T_cust_credit_level a,T_customer_info b
where a.cust_id=b.cust_id and b.cust_name='永恒科技'


--3.4第三题
--创建视图 V_his_cust_credit_level 用于查询客户的信用级别历史记录，视图列名
--显示为：客户名称、信用级别、评级有效起始日期、评级有效中止日期；
create view V_his_cust_credit_level
as
select b.cust_name as 客户名称,a.credit_level as 信用级别,a.begin_date as 评级有效起始日期,a.end_date as 评级有效中止日期
from T_his_cust_credit_level a,T_customer_info b
where a.cust_id=b.cust_id

--3.4第四题
--创建带输入参数的存储过程 P_cust_credit_level，根据输入参数更新客户信用等
--级表，并将更新前的记录插入到客户信用等级历史表。
create proc P_cust_credit_level(@credit_level char(2),@begin_date datetime,@end_date datetime,@cust_name varchar(60))
as
insert into T_his_cust_credit_level 
select *
from T_cust_credit_level
where cust_id in(
select cust_id
from T_customer_info
where cust_name=@cust_name
)
update T_cust_credit_level 
set credit_level= @credit_level,begin_date=@begin_date,end_date=@end_date
where cust_id in(
select cust_id
from T_customer_info
where cust_name=@cust_name
)

exec P_cust_credit_level '02','2017-03-18 0:0:0','2017-06-18 0:0:0','永恒科技'
