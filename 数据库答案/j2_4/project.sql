use BankCreditLoanDB
--3.4��һ��
--��������߼�����ģ�͵���⣬�ֱ����������в���һ���������ݣ��������ݰ���
--������Ŀ��ʹ�õ����ݣ������пͻ�������Ϊ��001����
insert into T_customer_info values('2016091901','����Ƽ�','¹��','����¦��','417000')

insert into T_agency_info values('001','����','01','13888888888')

insert into T_impawn_info values('2016091901','2016091901','001','����������ס��',180,'2016-09-19 16:16')

--3.4�ڶ���
--��ѯ ��XX ��˾����Ѻ����Ʒ��������˵������XX ��˾��Ϊ������������еĹ�˾���ƣ���
select a.pawn_goods_name,a.pawn_goods_num
from T_impawn_info a,T_customer_info b
where a.cust_id=b.cust_id and b.cust_name='����Ƽ�'
--������
--1���ҳ�����ҵ�Ҫ��ѯ������
--2�����ݲ�ѯ������ȥѰ����ر�д��from�Ӿ���
--3���������������ֶ�д��select�־���
--4����where�־���д��from�־��еı���������������û���γ�����������Ѱ����ر���Ϊ�ţ�����֮����and����
--5������ѯ����д��where�־��У���ǰ���������and����

--3.4������
--ͳ��ÿ���ͻ����������ֵ���Ѻҵ��������ѯ�����Ӧ�����ֶΣ��ͻ�������������Ѻҵ������
select a.agency_name as �ͻ���������,COUNT(b.agency_id)  as ��Ѻҵ����
from T_agency_info a,T_impawn_info b
where a.agency_id=b.agency_id
group by b.agency_id,a.agency_name
--group by ����ͳ���־䣬һ����sum,count,max,minһ��ʹ��
--����ͳ����guoup by�־���Ҫ����select�־��������ֶ�
--����ͳ������һ��Ҫд��having�־�

--3.4������
--�����洢���� P_customer_info��ɾ��ָ���ͻ���ŵĿͻ�������Ϣ��ͬʱҲɾ���ÿͻ�����Ѻ��Ϣ̨���е����м�¼��
create proc P_customer_info(@cust_id char(10))
as 
delete 
from T_impawn_info
where cust_id=@cust_id
delete 
from T_customer_info
where cust_id=@cust_id

exec P_customer_info '2016091901'