 ---任务四第一题：向 4 个表分别插入 2 条样本数据（样本数据包含下面题目中使用的数据）；
 insert into tbl_supplier values('银泰日货','13007380001','湖南娄底',null)
 insert into tbl_supplier values('江南牛奶','13007380002','湖南娄底',null)
 
 insert into tbl_goods values(1,'娄星牛奶','20180910','食品',1,100,null)
 insert into tbl_goods values(2,'娄星牛奶','20181010','食品',1,100,null)
 
 insert into tbl_instock values(1,10,58,default)
  insert into tbl_instock values(1,5,58,default)
  
 insert into tbl_outstock values(1,3,default)
  insert into tbl_outstock values(1,3,default)
 
 ---任务四第二题：查询供应商名称为”银泰日货”所供货的所有商品名称；
 
 
 
 ---任务四第三题：修改货物ID为 2 的入库单价，在原有基础上提高 10%；
 
 
 ---任务四第四题：创建视图查询“银泰日货”供货的所有商品名称、入库单价、现有库存；
 create view vw_goods
 as
 select a.goodName as 商品名称,b.goodPrice as 入库单价,a.storeQuantity as 现有库存
 from tbl_goods a,tbl_instock b,tbl_supplier c
 where a.goodId=b.goodId and a.suppId=c.suppId and c.suppName='银泰日货'
 
 
 ---任务四第五题： 创建触发器实现某商品出库时自动更新库存数量。
 --是特殊的存储过程，特殊在执行是自动的，不需要主动调用，只需要满足了触发条件就自动执行该代码
 
 create trigger trg_outStock
 on tbl_outstock
 for insert
 as
---当往tbl_outstock插入记录就自动执行下面代码
begin
	declare  @goodid int,@outQuantity int
	select @goodid=goodId,@outQuantity=outQuantity from Inserted
	update tbl_goods
	set storeQuantity=storeQuantity-@outQuantity
	where goodId=@goodid
end

 insert into tbl_outstock values(1,3,default)