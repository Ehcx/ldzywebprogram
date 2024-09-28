--3.4��һ��
--�� T_book ���в������ݣ���9787302245339��Access ���ݿ⼼����Ӧ�ã������죬27.20��50��
insert into T_book
values ('9787302245339','Access���ݿ⼼����Ӧ��','������',27.20,50,0)

--3.4�ڶ���
--��ѯ������Ϊ 2010-10-31 �Ժ�����ͼ����Ϣ
select a.*
from T_book a,T_borrow b
where a.book_no=b.book_no and
b.borrow_date>='2010-11-1'
---����ʱ���ͳ������ֻ�������ڣ����Զ�����0:0:0

--3.4������
--��ѯ��û�л���Ľ���������
select a.card_name
from T_card a,T_borrow b
where a.card_no=b.card_no and
b.return_date is NULL

--3.4������
--��ѯ���������С�� 5 ���ͼ����Ϣ��
select *
from T_book
where qty<5

--3.4������
--��д��ͼ��ѯ�����˵��������ֻ�����͵�ַ��
create view v_card
as
select card_name as ����������,mobile as �ֻ�����,adress as  ��ַ
from T_card

--3.4������
--��д�洢���̣���ѯָ��ͼ�����ƵĽ��Ĵ���
create proc p_tot_bor(@bookname varchar(100))
as
select loan_qty
from T_book
where book_name=@bookname

exec p_tot_bor 'Access���ݿ⼼����Ӧ��'

--���䣺����һ���洢���̣������ǽ��飬�����ǽ���������������
--����ɹ�����1�����ɹ�����0
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

  
exec p_borrow '����','Access���ݿ⼼����Ӧ��'


--����2������һ���洢���̣������ǻ��飬�����ǽ���������������
--�������ɹ�������Ϊ1��������鲻�ɹ�������Ϊ0