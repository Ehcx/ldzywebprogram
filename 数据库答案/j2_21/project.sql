---4.1�� T_Supplier ��������ݣ���BC0001, windows �������,0257-9413, ����,���ӹ�ҵ�����������,2010-11-10,42,�ޡ���
insert into T_BookInfo
values('BC0001', 'windows�������','0257-9413','����','���ӹ�ҵ�����������','2010-11-10',42,'��')

--4.2��ѯ����Ӧ������Ϊ�����ӹ�ҵ����������̡��Ķ�����ż�����״̬
select a.order_id as �������,a.order_status as ����״̬
from T_Order a,T_Supplier b
where a.supplier_id=b.supplier_id and
 b.supplier_name='���ӹ�ҵ�����������'
 
 --4.3��ѯ�̲�����Ϊ��windows ������ơ��Ķ�������
 select a.order_datetime as ��������
 from T_Order a,T_BookInfo b,T_Orderdet c
 where a.order_id=c.order_id and b.book_id=c.book_id
  and b.book_name='windows�������'
  
--4.4������ͼ��ѯ��Ӧ����Ϊ�����ӹ�ҵ����������̡��������Ľ̲ĵ���ϸ��Ϣ(��
--�����ƣ�ISBN ��ţ����ߣ������磬����ʱ�䣬�۸�����)
  create view v_book
  as
  select  a.book_name as ����,a.book_isbn as ISBN���,a.book_author as ����,
  a.book_publisher as ������,a.book_datetime as ����ʱ��,a.book_price as �۸�,
  d.orderdet_num as ����
  from T_BookInfo a,T_Supplier b ,T_Order c,T_Orderdet d
  where a.book_id=d.book_id and d.order_id=c.order_id
   and c.supplier_id=b.supplier_id 
   and b.supplier_name='���ӹ�ҵ�����������'
   ---��������
   
 --4.5�����洢���̣����������������Ӧ������״̬Ϊ��1��ʱ,�޸Ķ�����Ķ���״̬Ϊ��1��
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