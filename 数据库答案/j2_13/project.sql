--3.4第一题
--在 3 个表中分别插入表 2.13.2-2.13.4 中的样本数据；
insert into T_suppliers
values('430102','盛唐科技')
insert into T_suppliers
values('540199','博士科技')
insert into T_suppliers
values('440708','惠普科技')

insert into T_goods 
values('430102','盛唐笔记本',5600,'广东')
insert into T_goods 
values('540199','博士笔记本',6700,'台湾')
insert into T_goods 
values('440708','惠普笔记本',7800,'广东')

insert into T_orders
values(11010232,1000,3,16800)
insert into T_orders
values(11060343,1002,1,7800)
insert into T_orders
values(11050322,1001,2,13400)

--3.4第二题
--将商品名为“惠普笔记本”的价格下调 10%
update T_goods
set Goods_price=Goods_price*0.9
where Goods_name='惠普笔记本'

--3.4第三题
--查询出商品编号为“1002”的总的订购数量
select MAX(Goods_id) as 商品编号,sum(Quantity) as 总的数量
from T_orders
where Goods_id=1002

--3.4第四题
--查询出商品名称为“惠普笔记本”的商品的订购数量、总价
select MAX(b.Goods_name) as 商品编号,sum(a.Quantity) as 总的数量,SUM(a.Total_price) as 总价
from T_orders a,T_goods b
where a.Goods_id=b.Goods_id and  b.Goods_name='惠普笔记本'
--求和

--3.4第五题
--创建存储过程 P_stored_proc，指定供应商代码，查询该供应商的订单信息
create proc P_stored_proc(@supp_code varchar(20))
as
select a.*
from T_orders a ,T_goods b
where a.Goods_id=b.Goods_id and b.Supp_code=@supp_code

exec P_stored_proc '440708'

--3.4第六题
--查询所有名称包含“科技”的供应商编号、供应商名称
select Supp_code as 供应商编号 ,Supp_name as 供应商名称
from T_suppliers
where Supp_name like '%科技%'
--模糊查询用like
--字符串要通配符,%:

