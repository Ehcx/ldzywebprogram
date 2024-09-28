---��2��
--�� T_course ��������ݣ���004��001���ߵ���ѧ��3����
insert into T_course 
values('004','�ߵ���ѧ','001',3)

---��3�⣺��ѯ ����������רҵ����Ŀγ�
select a.*
from T_course a,T_speciality b
where a.specialityid=b.id and b.name='��������'

--��4�⣺��ѯ ����������רҵ����Щ��������
select distinct a.name
from T_enroll a,T_speciality b,T_course c
where a.course_id=c.id and c.specialityid=b.id
 and b.name='��������'
 ---���һ���������˶��ſγ̣�����ֶ�����¼,��������
 --��distinct�������ظ���¼

--��5�⣺��ѯ�������γ�Ϊ����Ϣ��ȫ���Ŀ���
select a.name
from T_enroll a,T_course b
where a.course_id=b.id and b.name='��Ϣ��ȫ'

--��6�⣺�����ɲ�ѯ���������������γ����Ƶ���ͼ
create view v_enroll
as
select a.name as ��������,b.name as �����γ�����
from T_enroll a,T_course b
where a.course_id=b.id

--��7�⣺�����洢���̣���ѯ����ĳ�ſγ̣��Կγ�����Ϊ�������Ŀ���
create proc p_enroll(@coursename varchar(20))
as
select a.name
from T_enroll a,T_course b
where a.course_id=b.id and b.name=@coursename

exec p_enroll '��Ϣ��ȫ'