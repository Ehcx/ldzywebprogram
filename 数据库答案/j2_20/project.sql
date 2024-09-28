--4.4.2
--�� T_book ��������ݣ�004����ѧӢ�001��29.5��
insert into T_book
values('004','��ѧӢ��','001',29.5)

--4.4.3��ѯ�����ڡ���������רҵ�Ľ̲�
select a.name
from T_book a,T_speciality b
where a.speciality_id=b.id and b.name='��������'

--4.4.4��ѯ�� ����������רҵ����Щ�̲ı�Ԥ��
select b.name
from T_purchase a,T_book b,T_speciality c
where a.book_id=b.id and b.speciality_id=c.id
 and c.name='��������'
 
 --4.4.5��ѯ��Ԥ���̲� �����˼������ѧ���Ŀ�������
 select a.name
 from T_purchase a,T_book b
 where a.book_id=b.id and b.name='���˼������ѧ'
 
 --4.4.6������ͼ��ѯ����������Ԥ���̲����ƣ�Ԥ������
 create view v_book
 as
 select a.name as ��������,b.name as Ԥ���̲�����,a.quantity as  Ԥ������
 from T_purchase a,T_book b
 where a.book_id=b.id
 
 --4.4.7�����洢���̣���ѯĳ��רҵ����רҵ����Ϊ������Ԥ���̲ĵ��ܼ�
 create proc p_books(@name varchar(20))
 as
 select SUM(b.price*a.quantity)
 from T_purchase a,T_book b,T_speciality c 
 where a.book_id=b.id and b.speciality_id=c.id
  and c.name=@name
  
  
 exec p_books '��������' 