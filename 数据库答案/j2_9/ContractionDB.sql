--������ ��һ��
--��ÿ�����в��� 1 ���������ݣ��������ݰ���������Ŀ��ʹ�õ����ݣ���
insert into T_appr_area values(1,'���Ļ�Է','10001','2016-01-01 00:00:00','2015-12-10 00:00:00',100,'�г�Ͷ')
insert into T_plot_info values('10001',1,100,'��ɳ�����Ļ�Է','סլ','������')
--������ �ڶ���
--��ѯ���ؿ���Ϊ��10001���Ľ����õصı���������Ϣ��
select *
from T_appr_area
where plot_id='10001'

--������ ������
--��ѯ���ؿ�����Ϊ����ɳ�����Ļ�Է���Ľ����õصı���������Ϣ��
select a.* 
from T_appr_area a,T_plot_info b
where b.plot_name='��ɳ�����Ļ�Է' and a.plot_id=b.plot_id


--������ ������
--��ѯ�����еĵؿ������Ϣ�����ؿ������������
select a.* 
from T_appr_area a,T_plot_info b
where a.plot_id=b.plot_id
order by b.total_area asc


--������ ������
--ɾ���ؿ�������ڡ�1100���ĵؿ������Ϣ��
delete 
from T_plot_info
where total_area>1100


--������ ������
--�ѵؿ�����Ϊ����ɳ�����Ļ�Է���޸�Ϊ�����������Ļ�Է����
update T_plot_info
set plot_name='���������Ļ�Է'
where plot_name='��ɳ�����Ļ�Է'

--������ ������
--�� T_plot_info ���в������ݣ�(�ؿ���Ϊ��10006�����ؿ�����Ϊ�����͹�ҵ������
--�ؿ����Ϊ��1500�����ؿ���;Ϊ����ҵ�õء���ͼ������Ϊ�������Ρ�����Ϣ��
insert into T_plot_info values('10006','1',1500,'���͹�ҵ��','��ҵ�õ�','������')

--������ �ڰ���
--������Ϊ Plot_id_view1 ����ͼ����ͼ������Ϊ�ؿ����ǡ�10005���Ľ����õ�
--����������Ϣ��
create view Plot_id_view1
as
select *
from T_appr_area
where plot_id='10005'

--������ �ھ���
--ɾ���������������� Plot_id_view1 ��ͼ��
drop view Plot_id_view1