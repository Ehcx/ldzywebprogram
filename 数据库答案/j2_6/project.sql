--3.4��һ��
--��������ֱ���¼�� 3 ���������ݣ��������ݰ���������Ŀ��ʹ�õ����ݣ���
insert into T_category values(1,'����','2016-09-20 16:10')

insert into T_product values(1,'����740',400,'�߼��γ�','2016-09-20 16:10')

insert into T_product_review values(1,1,'�ó��ó�','2016-09-21 16:10')

--3.4�ڶ���
--��ѯĳ��������������� 3 �������в�Ʒ�����ƣ�
select a.product_name as ��Ʒ����
from T_product a,T_product_review b,T_category c
where a.product_id=b.product_id and a.category_id=c.category_id and c.category_name='����'
group by a.product_id,a.product_name
having COUNT(b.product_id)>3
--����ͳ�Ʋ�ѯ���ѱ��м�¼����ĳ���ֶηֳ������飬Ȼ�����ڽ���ͳ�ƣ��ٸ�������ͳ�ƽ����������

--3.4������
--��ѯ��Ʒ�۸񳬹� 400 Ԫ�����в�Ʒ��
select *
from T_product
where price>=400



--3.4������
--������Ϊ product_view1 ����ͼ����ͼ�е����ݰ���¼�������� 2011 �� 3 �µ� 6��֮��Ĳ�Ʒ������Ϣ��
create view product_view1
as
select *
from T_product
where register_date>='2011-03-01 0:0' and register_date<='2011-06-30 23:59'
--���������﷨
--1��Ѱ��������������ҵ���ѯ��
--2��Ѱ�Ҳ�ѯ�����������������Դ��
--3�����������ű��Ƿ�ֱ�ӹ�����û�л���Ҫ�ҵ��ű�����where�Ӿ���д����������
--4��д����ѯ����

--3.4������
--ɾ������������������ͼ product_view1��
drop view product_view1



--3.4������
--ɾ����Ʒ�۸񳬹� 400 �����в�Ʒ��
delete from T_product
where price>400

-