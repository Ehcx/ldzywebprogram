--3.4第一题
--在每个表中插入 1 条测试数据（样本数据包含下面题目中使用的数据）；
insert into T_card
values(1,'李涛','0','2016-09-21 9:28')

insert into T_add_money
values(1,60,'2016-09-21 9:30')

update T_card 
set curr_money=curr_money+60 
where card_id=1

insert into T_consume_money
values(1,10,'2016-09-21 9:34')

update T_card 
set curr_money=curr_money-10
where card_id=1

--3.4第二题
--查询所有饭卡信息
select *
from T_card

--3.4第三题 
--查询所有饭卡的余额之和
select SUM(curr_money) as 余额之和
from T_card

--3.4第四题
--查询某日所有饭卡的充值金额之和(比如2011年6月2号总共充值金额是多少元)；
select SUM(the_money) as 充值和
from T_add_money
where register_date>='2016-9-21 0:0:0' and register_date<='2016-9-21 23:59:59'

--3.4第五题
--创建存储过程，根据某个学生的饭卡 ID 上的余额，判断该饭卡是否能进行一定金
--额的消费。（比如饭卡 ID 号为 1 的饭卡余额只有 3.5 元，则该饭卡不能购买 5.5
--元的中餐）。存储过程输入参数为饭卡 ID 号，本次消费金额，返回值为 true 或者false。
create proc p_isconsume(
@student_id int,
@the_money money
)
as 
begin
	declare @currmoney money
	select @currmoney=curr_money
	from T_card
	where student_id=@student_id 
	if(@currmoney>=@the_money)
	   return 1
	 else
	   return 0
	   
	 --将select查询出来的结果（只有一个值）赋给一个变量
	 --格式：将变量=写在select子句中里

	declare @ret int
	exec @ret=p_isconsume 1,10
	select @ret
end

--注意：带有通过return返回值的存储过程，在调用时如何获取返回值

--方法二

create proc p_isconsume2(
@student_id int,
@the_money money,
@isconsume char(6) output
)
as 
declare @currmoney money
select @currmoney=curr_money
from T_card
where student_id=@student_id 
if(@currmoney>=@the_money)
   set @isconsume='true'
 else
   set @isconsume='false'
   
---存储过程里的赋值语句与普通语言不同
---带返回值的形参，在后面加上oupput关键字，
---在调用时要定义一个变量来接收，但实参后面加上output

declare @ret char(6)
exec p_isconsume2 1,70,@ret output
select @ret

--补充：
--1、设计一个存储过程，功能是刷卡，如果余额能消费,则进行消费，形参a：学号，b:消费金额
--2、设计一个存储过程，功能是充值，形参a：学号，b:充值金额

create proc p_consume(@st_id int,@mon money)
as
declare @currmoney money
declare @card int
select @currmoney=curr_money,@card=card_id
from T_card
where student_id=@st_id 
if(@currmoney>=@mon)
   begin
     insert into T_consume_money values(@card,@mon,GETDATE())
     update T_card set curr_money=curr_money-@mon where card_id=@card 
     return 1
   end
 else
    return 0
    