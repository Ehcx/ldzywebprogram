--3.4��һ��
--��ÿ�����в��� 1 ���������ݣ��������ݰ���������Ŀ��ʹ�õ����ݣ���
insert into T_card
values(1,'����','0','2016-09-21 9:28')

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

--3.4�ڶ���
--��ѯ���з�����Ϣ
select *
from T_card

--3.4������ 
--��ѯ���з��������֮��
select SUM(curr_money) as ���֮��
from T_card

--3.4������
--��ѯĳ�����з����ĳ�ֵ���֮��(����2011��6��2���ܹ���ֵ����Ƕ���Ԫ)��
select SUM(the_money) as ��ֵ��
from T_add_money
where register_date>='2016-9-21 0:0:0' and register_date<='2016-9-21 23:59:59'

--3.4������
--�����洢���̣�����ĳ��ѧ���ķ��� ID �ϵ����жϸ÷����Ƿ��ܽ���һ����
--������ѡ������緹�� ID ��Ϊ 1 �ķ������ֻ�� 3.5 Ԫ����÷������ܹ��� 5.5
--Ԫ���вͣ����洢�����������Ϊ���� ID �ţ��������ѽ�����ֵΪ true ����false��
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
	   
	 --��select��ѯ�����Ľ����ֻ��һ��ֵ������һ������
	 --��ʽ��������=д��select�Ӿ�����

	declare @ret int
	exec @ret=p_isconsume 1,10
	select @ret
end

--ע�⣺����ͨ��return����ֵ�Ĵ洢���̣��ڵ���ʱ��λ�ȡ����ֵ

--������

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
   
---�洢������ĸ�ֵ�������ͨ���Բ�ͬ
---������ֵ���βΣ��ں������oupput�ؼ��֣�
---�ڵ���ʱҪ����һ�����������գ���ʵ�κ������output

declare @ret char(6)
exec p_isconsume2 1,70,@ret output
select @ret

--���䣺
--1�����һ���洢���̣�������ˢ����������������,��������ѣ��β�a��ѧ�ţ�b:���ѽ��
--2�����һ���洢���̣������ǳ�ֵ���β�a��ѧ�ţ�b:��ֵ���

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
    