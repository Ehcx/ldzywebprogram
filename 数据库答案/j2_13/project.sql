--3.4��һ��
--�� 3 �����зֱ����� 2.13.2-2.13.4 �е��������ݣ�
insert into T_suppliers
values('430102','ʢ�ƿƼ�')
insert into T_suppliers
values('540199','��ʿ�Ƽ�')
insert into T_suppliers
values('440708','���տƼ�')

insert into T_goods 
values('430102','ʢ�ƱʼǱ�',5600,'�㶫')
insert into T_goods 
values('540199','��ʿ�ʼǱ�',6700,'̨��')
insert into T_goods 
values('440708','���ձʼǱ�',7800,'�㶫')

insert into T_orders
values(11010232,1000,3,16800)
insert into T_orders
values(11060343,1002,1,7800)
insert into T_orders
values(11050322,1001,2,13400)

--3.4�ڶ���
--����Ʒ��Ϊ�����ձʼǱ����ļ۸��µ� 10%
update T_goods
set Goods_price=Goods_price*0.9
where Goods_name='���ձʼǱ�'

--3.4������
--��ѯ����Ʒ���Ϊ��1002�����ܵĶ�������
select MAX(Goods_id) as ��Ʒ���,sum(Quantity) as �ܵ�����
from T_orders
where Goods_id=1002

--3.4������
--��ѯ����Ʒ����Ϊ�����ձʼǱ�������Ʒ�Ķ����������ܼ�
select MAX(b.Goods_name) as ��Ʒ���,sum(a.Quantity) as �ܵ�����,SUM(a.Total_price) as �ܼ�
from T_orders a,T_goods b
where a.Goods_id=b.Goods_id and  b.Goods_name='���ձʼǱ�'
--���

--3.4������
--�����洢���� P_stored_proc��ָ����Ӧ�̴��룬��ѯ�ù�Ӧ�̵Ķ�����Ϣ
create proc P_stored_proc(@supp_code varchar(20))
as
select a.*
from T_orders a ,T_goods b
where a.Goods_id=b.Goods_id and b.Supp_code=@supp_code

exec P_stored_proc '440708'

--3.4������
--��ѯ�������ư������Ƽ����Ĺ�Ӧ�̱�š���Ӧ������
select Supp_code as ��Ӧ�̱�� ,Supp_name as ��Ӧ������
from T_suppliers
where Supp_name like '%�Ƽ�%'
--ģ����ѯ��like
--�ַ���Ҫͨ���,%:

