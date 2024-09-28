---4.1向 T_Supplier 表插入数据：“BC0001, windows 程序设计,0257-9413, 刘立,电子工业出版社代理商,2010-11-10,42,无”；
insert into T_BookInfo
values('BC0001', 'windows程序设计','0257-9413','刘立','电子工业出版社代理商','2010-11-10',42,'无')

--4.2查询出供应商名称为“电子工业出版社代理商”的订单编号及订单状态
select a.order_id as 订单编号,a.order_status as 订单状态
from T_Order a,T_Supplier b
where a.supplier_id=b.supplier_id and
 b.supplier_name='电子工业出版社代理商'
 
 --4.3查询教材名称为“windows 程序设计”的订购日期
 select a.order_datetime as 订购日期
 from T_Order a,T_BookInfo b,T_Orderdet c
 where a.order_id=c.order_id and b.book_id=c.book_id
  and b.book_name='windows程序设计'
  
--4.4创建视图查询供应商名为“电子工业出版社代理商”所订购的教材的详细信息(包
--括名称，ISBN 编号，作者，出版社，出版时间，价格，数量)
  create view v_book
  as
  select  a.book_name as 名称,a.book_isbn as ISBN编号,a.book_author as 作者,
  a.book_publisher as 出版社,a.book_datetime as 出版时间,a.book_price as 价格,
  d.orderdet_num as 数量
  from T_BookInfo a,T_Supplier b ,T_Order c,T_Orderdet d
  where a.book_id=d.book_id and d.order_id=c.order_id
   and c.supplier_id=b.supplier_id 
   and b.supplier_name='电子工业出版社代理商'
   ---搭两条桥
   
 --4.5创建存储过程，当订单详情表中相应订单的状态为“1”时,修改订单表的订单状态为“1”
   create proc p_alter_order
   as
   update T_Order
   set order_status=1
   where order_id in
   (
   select a.order_id
   from T_Orderdet a
   where a.orderdet_status=1
   )
   
   exec p_alter_order