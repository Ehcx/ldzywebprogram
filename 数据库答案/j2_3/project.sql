use BankCreditLoanDB

--3.4��һ��
--���ݶ��߼�����ģ�͵���⣬�ֱ����������в���һ���������ݣ��������ݰ���������Ŀ��ʹ�õ����ݣ�
insert into T_customer_info values('2016091801','����Ƽ�','Ф��','����¦��','417000')

insert into T_cust_credit_level values('2016091801','01','2016-09-18 00:00:00','2017-03-18 00:00:00')

insert into T_his_cust_credit_level values('2016091801','01','2016-09-18 00:00:00','2017-03-18 00:00:00')

--3.4�ڶ���
--��ѯ�ͻ�����Ϊ��XX ��˾�������õȼ���˵������XX ��˾��Ϊ������������еĹ�˾���ƣ���
select a.credit_level
from T_cust_credit_level a,T_customer_info b
where a.cust_id=b.cust_id and b.cust_name='����Ƽ�'


--3.4������
--������ͼ V_his_cust_credit_level ���ڲ�ѯ�ͻ������ü�����ʷ��¼����ͼ����
--��ʾΪ���ͻ����ơ����ü���������Ч��ʼ���ڡ�������Ч��ֹ���ڣ�
create view V_his_cust_credit_level
as
select b.cust_name as �ͻ�����,a.credit_level as ���ü���,a.begin_date as ������Ч��ʼ����,a.end_date as ������Ч��ֹ����
from T_his_cust_credit_level a,T_customer_info b
where a.cust_id=b.cust_id

--3.4������
--��������������Ĵ洢���� P_cust_credit_level����������������¿ͻ����õ�
--������������ǰ�ļ�¼���뵽�ͻ����õȼ���ʷ��
create proc P_cust_credit_level(@credit_level char(2),@begin_date datetime,@end_date datetime,@cust_name varchar(60))
as
insert into T_his_cust_credit_level 
select *
from T_cust_credit_level
where cust_id in(
select cust_id
from T_customer_info
where cust_name=@cust_name
)
update T_cust_credit_level 
set credit_level= @credit_level,begin_date=@begin_date,end_date=@end_date
where cust_id in(
select cust_id
from T_customer_info
where cust_name=@cust_name
)

exec P_cust_credit_level '02','2017-03-18 0:0:0','2017-06-18 0:0:0','����Ƽ�'
