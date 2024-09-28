--任务四、第一题
--向每个表插入 2 条测试数据（样本数据包含下面题目中使用的数据）

insert into T_ship values('20160101','英雄号','china','1000','2016-01-01','中国',default)
insert into T_ship values('20160102','长缨号','china','1000','2016-01-02','中国',default)

insert into T_line values('20180101','长江线','国内省级')
insert into T_line values('20180102','长江线','国内省级')

insert into T_business_unit values('20150101','亨利航运','湖南娄底','私营经济')
insert into T_business_unit values('20150102','恒利航运','湖南娄底','私营经济')

insert into T_vehicle_declare values('20181001','20150101','20180101','20160101','01010101','进港',GETDATE(),0,0,0,0,0,0,'dwh',DEFAULT,GETDATE(),'')
insert into T_vehicle_declare values('20181002','20150102','20180101','20160102','01010102','进港',GETDATE(),0,0,0,0,0,0,'dwh',DEFAULT,GETDATE(),'')

--第二题：
--创建视图，查询所有船舶国籍为“巴拿马”的进出港车辆申报信息，包含船名、进
--出港方式、进出港时间及申报人字段
create view view_vehicle_declare
as
select b.ship_name as 船名,a.inout_port as 进出港方式,a.inout_port_date as 进出港时间,a.declarer as 申报人
from T_vehicle_declare a,T_ship b
where b.ship_nationality='巴拿马' and a.ship_code=b.ship_code