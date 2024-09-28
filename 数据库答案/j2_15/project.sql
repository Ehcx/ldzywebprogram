--3.5第一题
--在 T_business_unit 表插入数据：“J2009302，振华港机，上海浦东，集体经济”
insert into T_business_unit
values ('J2009302','振华港机','上海浦东','集体经济')

--3.5第二题
--查询简称为“振华港机”的经营单位所对应的收费单位名称和收费单位电话
select a.feeunit_name,a.feeunit_phone
from T_fee_unit a,T_business_unit b,T_relation_businessunit_feeunit c
where a.feeunit_id=c.feeunit_id and b.businessunit_code=c.businessunit_code
 and b.short_name='振华港机'
 
 --3.5第三题
 --创建存储过程，查询经营类型为“集体经济”的经营单位由哪些收费单位收费，查
---询这些收费单位的名称、电话号码和地址
 create proc p_feeunit
 as
 select a.feeunit_name,a.feeunit_phone,a.feeunit_address
 from T_fee_unit a,T_business_unit b,T_relation_businessunit_feeunit c
where a.feeunit_id=c.feeunit_id and b.businessunit_code=c.businessunit_code
 and b.type='集体经济'
 
 exec p_feeunit