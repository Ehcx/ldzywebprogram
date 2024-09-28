use BankCreditLoanDB
--3.4第一题
--根据你对逻辑数据模型的理解，分别向三个表中插入一条测试数据（样本数据包含
--下面题目中使用的数据），其中客户经理编号为“001”；
insert into T_customer_info values('2016091901','永恒科技','鹿晗','湖南娄底','417000')

insert into T_agency_info values('001','刘烨','01','13888888888')

insert into T_impawn_info values('2016091901','2016091901','001','三房两厅的住房',180,'2016-09-19 16:16')

--3.4第二题
--查询 “XX 公司”质押的物品及数量（说明：“XX 公司”为插入测试数据中的公司名称）；
select a.pawn_goods_name,a.pawn_goods_num
from T_impawn_info a,T_customer_info b
where a.cust_id=b.cust_id and b.cust_name='永恒科技'
--方法：
--1、找出主语，找到要查询的内容
--2、根据查询的内容去寻找相关表，写到from子句中
--3、根据主语，把相关字段写到select字句中
--4、在where字句中写出from字句中的表的连接条件，如果没有形成连接龙，则寻找相关表作为桥，条件之间用and连接
--5、将查询条件写到where字句中，与前面的条件用and连接

--3.4第三题
--统计每个客户经理所经手的质押业务数，查询结果集应包含字段：客户经理姓名、质押业务数；
select a.agency_name as 客户经理姓名,COUNT(b.agency_id)  as 质押业务数
from T_agency_info a,T_impawn_info b
where a.agency_id=b.agency_id
group by b.agency_id,a.agency_name
--group by 分组统计字句，一定与sum,count,max,min一起使用
--分组统计中guoup by字句中要包含select字句中所有字段
--分组统计条件一定要写在having字句

--3.4第四题
--创建存储过程 P_customer_info，删除指定客户编号的客户基本信息，同时也删除该客户在质押信息台帐中的所有记录。
create proc P_customer_info(@cust_id char(10))
as 
delete 
from T_impawn_info
where cust_id=@cust_id
delete 
from T_customer_info
where cust_id=@cust_id

exec P_customer_info '2016091901'