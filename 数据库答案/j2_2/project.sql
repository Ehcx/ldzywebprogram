use ConstructionDB

--3.5��һ��
--�� T_flow_step_def ���в������ݣ���1���б깫ʾ����ʾ�б������30��http://localhost:8080/stepmenu.jsp���ڹ涨ʱ������������������ϵ���ǡ���
insert into T_flow_step_def values(1,'�б깫ʾ','��ʾ�б����',30,'http://localhost:8080/stepmenu.jsp','���ڹ涨ʱ������������������ϵ����')

--3.5�ڶ���
--��ѯ���б귽ʽ����Ϊ��1�������б�������Ϣ��
select  *   --select��ѯ�Ľ��
from   T_sub_project    --from��ʾ������Դ���Ǽ��ű�
where  in_method_id='1'    --where��������1��������ı���������2����ѯ����

---1��Ҫ��ʲô,������
---2����Դ����
---3��������ѯ�������������ű��У�����from�������Ӧ��
--where��������1��������ı���������
--��д������������ķ������ҳ���ͬ�ֶΣ�һ�����fk��
--��������һ�������м���and����
--2����ѯ����

--3.5������
--��ѯ��������ɱ�־Ϊ��0���ı�������Ϣ��
select *
from T_sub_project
where flag_done='0'

--3.5������
--��ѯ�������������Ϊ�����ꡱ�����б�������
select a.*
from T_sub_project a,T_flow_type b
where a.flow_type_id=b.flow_type_id and b.flow_type_name='����'

--3.5������
--������ͼ��ѯ���е����̵Ĳ������ơ����̲�������������������ơ�
create view v_flow
as
select a.step_name as ��������,a.step_des as ���̲�������,b.flow_type_name as �����������
from T_flow_step_def a,T_flow_type b,T_flow_procedure c
where a.step_no=c.step_no and b.flow_type_id=c.flow_type_id
