--�����ġ���һ��
--��ÿ������� 2 ���������ݣ��������ݰ���������Ŀ��ʹ�õ����ݣ�

insert into T_ship values('20160101','Ӣ�ۺ�','china','1000','2016-01-01','�й�',default)
insert into T_ship values('20160102','��ӧ��','china','1000','2016-01-02','�й�',default)

insert into T_line values('20180101','������','����ʡ��')
insert into T_line values('20180102','������','����ʡ��')

insert into T_business_unit values('20150101','��������','����¦��','˽Ӫ����')
insert into T_business_unit values('20150102','��������','����¦��','˽Ӫ����')

insert into T_vehicle_declare values('20181001','20150101','20180101','20160101','01010101','����',GETDATE(),0,0,0,0,0,0,'dwh',DEFAULT,GETDATE(),'')
insert into T_vehicle_declare values('20181002','20150102','20180101','20160102','01010102','����',GETDATE(),0,0,0,0,0,0,'dwh',DEFAULT,GETDATE(),'')

--�ڶ��⣺
--������ͼ����ѯ���д�������Ϊ���������Ľ����۳����걨��Ϣ��������������
--���۷�ʽ��������ʱ�估�걨���ֶ�
create view view_vehicle_declare
as
select b.ship_name as ����,a.inout_port as �����۷�ʽ,a.inout_port_date as ������ʱ��,a.declarer as �걨��
from T_vehicle_declare a,T_ship b
where b.ship_nationality='������' and a.ship_code=b.ship_code