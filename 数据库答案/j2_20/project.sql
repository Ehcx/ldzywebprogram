--4.4.2
--向 T_book 表插入数据：004，大学英语，001，29.5；
insert into T_book
values('004','大学英语','001',29.5)

--4.4.3查询出属于“电子政务”专业的教材
select a.name
from T_book a,T_speciality b
where a.speciality_id=b.id and b.name='电子政务'

--4.4.4查询出 “电子政务”专业有哪些教材被预订
select b.name
from T_purchase a,T_book b,T_speciality c
where a.book_id=b.id and b.speciality_id=c.id
 and c.name='电子政务'
 
 --4.4.5查询出预订教材 “马克思主义哲学”的考生姓名
 select a.name
 from T_purchase a,T_book b
 where a.book_id=b.id and b.name='马克思主义哲学'
 
 --4.4.6创建视图查询考生姓名，预订教材名称，预订数量
 create view v_book
 as
 select a.name as 考生姓名,b.name as 预订教材名称,a.quantity as  预订数量
 from T_purchase a,T_book b
 where a.book_id=b.id
 
 --4.4.7创建存储过程，查询某个专业（以专业名称为参数）预订教材的总价
 create proc p_books(@name varchar(20))
 as
 select SUM(b.price*a.quantity)
 from T_purchase a,T_book b,T_speciality c 
 where a.book_id=b.id and b.speciality_id=c.id
  and c.name=@name
  
  
 exec p_books '电子政务' 