--3.5��һ��
--�� T_business_unit ��������ݣ���J2009302���񻪸ۻ����Ϻ��ֶ������徭�á�
insert into T_business_unit
values ('J2009302','�񻪸ۻ�','�Ϻ��ֶ�','���徭��')

--3.5�ڶ���
--��ѯ���Ϊ���񻪸ۻ����ľ�Ӫ��λ����Ӧ���շѵ�λ���ƺ��շѵ�λ�绰
select a.feeunit_name,a.feeunit_phone
from T_fee_unit a,T_business_unit b,T_relation_businessunit_feeunit c
where a.feeunit_id=c.feeunit_id and b.businessunit_code=c.businessunit_code
 and b.short_name='�񻪸ۻ�'
 
 --3.5������
 --�����洢���̣���ѯ��Ӫ����Ϊ�����徭�á��ľ�Ӫ��λ����Щ�շѵ�λ�շѣ���
---ѯ��Щ�շѵ�λ�����ơ��绰����͵�ַ
 create proc p_feeunit
 as
 select a.feeunit_name,a.feeunit_phone,a.feeunit_address
 from T_fee_unit a,T_business_unit b,T_relation_businessunit_feeunit c
where a.feeunit_id=c.feeunit_id and b.businessunit_code=c.businessunit_code
 and b.type='���徭��'
 
 exec p_feeunit