--3.4��һ��
--�� T_student_info ��������ݣ���102011�����»����У�03/23/1991��2009������
--��ɳ�Ͷ���· 168 �š���
insert into T_student_info
values('102011','���»�','��','03/23/1991',2009,'���ϳ�ɳ�Ͷ���·168��')

--3.4�ڶ���
--��ѯ�� 1991 �������ѧ����Ϣ��
select *
from T_student_info
--where birth>='1991-1-1 0:0' and birth<='1991-12-31 23:59'
where year(birth)='1991'
--year()��������ȡ���ֶε����

--3.4������
--��ѯѡ���ˡ����ݽṹ����ѧ��������ƽʱ�ɼ�����ĩ�ɼ��������ɼ���
select b.student_name as ѧ������,a.ordinary_scores as ƽʱ�ɼ�,a.end_scores as ��ĩ�ɼ�,a.total_scores as �����ɼ�
from T_student_scores a,T_student_info b,T_course_info c
where a.student_no=b.student_no and a.course_no=c.course_no
 and c.course_name='���ݽṹ'
 
 --3.4������
 --������ͼ��ѯѧ����ѧ�š��������γ����������ɼ���
 create view v_scores
 as
 select b.student_no as ѧ��,b.student_name as  ����,c.course_name as �γ���,a.total_scores as �����ɼ�
 from T_student_scores a,T_student_info b,T_course_info c
 where a.student_no=b.student_no and a.course_no=c.course_no
 
 --3.4������
 --����ͳ��
 --ͳ��ÿ�ſγ̵�ѡ����������߷֡�ƽ���֣�����ͳ�ƽ�������ڱ� T_total �С�
 select b.course_name as �γ�����,COUNT(a.course_no)as ѡ������,MAX(a.total_scores) as ��߷�,AVG(a.total_scores) as ƽ����
 into T_total
 from T_student_scores a,T_course_info b
 where a.course_no=b.course_no 
 group by a.course_no,b.course_name
 
 --�γ̱����ͬ��Ϊһ��
 --����ѯ������浽һ���µ����ݱ��У�into �±���
 --���䣺
 --1�������ͳ�����������磺ֻ��ѯѡ����������10�˿γ̵�ѡ����������߷֣�ƽ����
 --having COUNT(*)<=10
 --2�����Ҫȥ��ʾ�γ�����,����Ҫ�����һ�ű�