--3.4第一题
--在 T_book 表中插入数据：“9787302245339，Access 数据库技术与应用，陈世红，27.20，50”
insert into T_book
values ('9787302245339','Access数据库技术与应用','陈世红',27.20,50,0)

--3.4第二题
--查询出日期为 2010-10-31 以后借出的图书信息
select a.*
from T_book a,T_borrow b
where a.book_no=b.book_no and
b.borrow_date>='2010-11-1'
---日期时间型常量如果只包含日期，会自动补充0:0:0

--3.4第三题
--查询出没有还书的借书人姓名
select a.card_name
from T_card a,T_borrow b
where a.card_no=b.card_no and
b.return_date is NULL

--3.4第四题
--查询出库存数量小于 5 册的图书信息；
select *
from T_book
where qty<5

--3.4第五题
--编写视图查询借书人的姓名，手机号码和地址；
create view v_card
as
select card_name as 借书人姓名,mobile as 手机号码,adress as  地址
from T_card

--3.4第六题
--编写存储过程，查询指定图书名称的借阅次数
create proc p_tot_bor(@bookname varchar(100))
as
select loan_qty
from T_book
where book_name=@bookname

exec p_tot_bor 'Access数据库技术与应用'

--补充：创建一个存储过程，功能是借书，参数是借书人姓名，书名
--借书成功返回1，不成功返回0
create proc p_borrow(@borrname varchar(30),@bookname varchar(100))
as
begin
	declare @bookid varchar(20)
	declare @cardid varchar(20)
	declare @qty int

	select @qty=qty,@bookid=book_no
	from T_book
	where book_name=@bookname
	
	if @qty>0
		begin
			select @cardid=card_no
			from  T_card
			where card_name=@borrname

			insert into T_borrow(borrow_id,book_no,card_no,borrow_date)
			values(2016092900001,@bookid,@cardid,GETDATE()) 

			update T_book
			set qty=qty-1
			where book_no=@bookid

			return 1
		end
	else
	    return 0
 end

  
exec p_borrow '戴冰','Access数据库技术与应用'


--补充2：创建一个存储过程，功能是还书，参数是借书人姓名，书名
--如果还书成功，返回为1，如果还书不成功，返回为0