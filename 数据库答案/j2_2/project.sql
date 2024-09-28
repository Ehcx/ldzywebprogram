use ConstructionDB

--3.5第一题
--在 T_flow_step_def 表中插入数据：“1，中标公示，公示中标情况，30，http://localhost:8080/stepmenu.jsp，在规定时间内如有异议则请联系我们”；
insert into T_flow_step_def values(1,'中标公示','公示中标情况',30,'http://localhost:8080/stepmenu.jsp','，在规定时间内如有异议则请联系我们')

--3.5第二题
--查询出招标方式代号为“1”的所有标段情况信息；
select  *   --select查询的结果
from   T_sub_project    --from表示数据来源于那几张表
where  in_method_id='1'    --where两种条件1、将上面的表连接条件2、查询条件

---1、要查什么,找主语
---2、来源哪里
---3、分析查询条件出现在哪张表中，再在from中添加相应表
--where两种条件1、将上面的表连接条件
--书写多表连接条件的方法：找出相同字段（一般出现fk）
--两两连成一条龙，中间用and连接
--2、查询条件

--3.5第三题
--查询出所有完成标志为“0”的标段情况信息；
select *
from T_sub_project
where flag_done='0'

--3.5第四题
--查询出流程类别名称为“开标”的所有标段情况；
select a.*
from T_sub_project a,T_flow_type b
where a.flow_type_id=b.flow_type_id and b.flow_type_name='开标'

--3.5第五题
--创建视图查询所有的流程的步骤名称、流程步骤描述及流程类别名称。
create view v_flow
as
select a.step_name as 步骤名称,a.step_des as 流程步骤描述,b.flow_type_name as 流程类别名称
from T_flow_step_def a,T_flow_type b,T_flow_procedure c
where a.step_no=c.step_no and b.flow_type_id=c.flow_type_id
