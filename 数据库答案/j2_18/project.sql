---��һ��
---�� T_student ��������ݣ���2009010001����ѧ�ѣ��У�1980-10-4��2009-9-1��15012345678�����ϳ�ɳ�����ޣ�
insert into T_student
values('2009010001','��ѧ��','��','1980-10-4','2009-9-1','15012345678','���ϳ�ɳ','��')

--�ڶ���
-- ��ѯ������Ϊ�����ϳ�ɳ����ѧ��������Ϣ
select *
from T_student
where birth_place='���ϳ�ɳ'

--������
--��ѯ������Ϊ����ѧ�ѡ���ѧ�����пγ̵ĳɼ�
select c.course_name,a.score
from T_score a,T_student b,T_course c
where a.stud_id=b.stud_id and a.course_id=c.course_id and b.stud_name='��ѧ��'

--������
--��ѯ�������ݿ�Ӧ�á����ſε�ƽ���ɼ�
select avg(a.score) as ƽ���ɼ�
from T_score a,T_course b
where a.score_id=b.course_id and b.course_name='���ݿ�Ӧ��'

--������
--������ͼ��ѯѧ�����������ֻ�����ͼ���
create view v_stud
as
select stud_name as ����,mobile as �ֻ�����,birth_place as ����
from T_student

--������
---�����洢���̣���ѯָ���γ����Ƶ���߳ɼ�
create proc p_max_score(@scorename varchar(100))
as
select @scorename as �γ���,MAX(a.score) as ��߳ɼ�
from T_score a,T_course b
where a.course_id=b.course_id and b.course_name=@scorename

exec p_max_score '���ݿ�Ӧ��'