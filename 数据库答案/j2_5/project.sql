--3.4��һ��
--��������ֱ���¼�� 3 ���������ݣ��������ݰ���������Ŀ��ʹ�õ����ݣ���
insert into T_category values('����','2016-09-20 16:10')

insert into T_product values(1,'����740',800,'�߼��γ�','2016-09-20 16:10')

insert into T_product_review values(3,'�ó��ó�','2016-09-21 16:10')

--3.4�ڶ���
--��ѯĳ��������в�Ʒ��
select a.*
from T_product a,T_category b
where a.category_id=b.category_id and b.category_name='����'

--3.4������
--��ѯ��Ʒ�۸��� 300-500 Ԫ֮��Ĳ�Ʒ��
select *
from T_product
where price>=300 and price<=500


--3.4������
--��ѯ¼�������� 2011 �� 3 �µ� 6 ��֮��Ĳ�Ʒ���ݣ�
select *
from T_product
where register_date>='2011-03-01 0:0' and register_date<='2011-06-30 23:59'
--���������﷨
--1��Ѱ��������������ҵ���ѯ��
--2��Ѱ�Ҳ�ѯ�����������������Դ��
--3�����������ű��Ƿ�ֱ�ӹ�����û�л���Ҫ�ҵ��ű�����where�Ӿ���д����������
--4��д����ѯ����

--3.4������
--��ѯ��Ʒ�۸��� 90-200 Ԫ֮����������ۣ�
select a.*
from T_product_review a,T_product b
where a.product_id=b.product_id and b.price>=90 and b.price<=200

--3.4������
--��ѯ�������� 1-3 �������в�Ʒ��
select a.product_name,COUNT(b.product_id) as ��������
from T_product a,T_product_review b
where a.product_id=b.product_id
group by b.product_id,a.product_name
having COUNT(b.product_id)>=1 and COUNT(b.product_id)<=3

--����ͳ�Ʋ�ѯ���ѱ��м�¼����ĳ���ֶηֳ������飬Ȼ�����ڽ���ͳ�ƣ��ٸ�������ͳ�ƽ����������