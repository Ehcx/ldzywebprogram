--�����ģ���һ��
-- ��T_user��������ݣ� ��id01�����»���123��KBB��5678900�����ϳ�ɳ��13899005678��ldh123��admin����
insert into T_user  values('id01','���»�','123','KBB','5678900','���ϳ�ɳ','13899005678','ldh123','admin')

--�����ģ��ڶ���
--��ѯ����������Ϊ��KBB���Ĳ���Ա�������ͱ��
select user_name as ����,user_id as ���
from T_user
where dept_id='KBB'

--������,������
---��ѯ������Ϊ�����»����Ĳ���Ա������Щ����Ȩ�ޣ�
select T_func_item.func_name as ����Ȩ��
from T_user,T_func_item,T_user_T_func_role_def,T_func_item_T_func_role_def
where T_user.user_id=T_user_T_func_role_def.user_id and T_user_T_func_role_def.func_role_id=T_func_item_T_func_role_def.func_role_id
 and T_func_item.func_id=T_func_item_T_func_role_def.func_id and T_user.user_name='���»�'
 
 
 --�����ģ�������
 --��ѯ����Ͷ�������ˡ���ɫ��ӵ�еĹ��� 
 select T_func_item.func_name as ����ӵ�еĹ���
 from T_func_item,T_func_role_def,T_func_item_T_func_role_def
 where T_func_role_def.func_role_id=T_func_item_T_func_role_def.func_role_id and T_func_role_def.func_role_name='Ͷ��������'
 
 
 --�����ģ�������
 --������ͼ��ѯ����Ա���������������������
 create view v_T_user 
 as 
 select user_name as ����,user_passwd as ����,dept_id as ���в���
 from T_user
 
 
  --�����ģ�������
  --�����洢���̣���ѯָ������Ա�����еĹ���Ȩ��
  create procedure p_user_fucn
  @user_id char(4)
  as
  begin
	select T_func_item.func_name as ����Ȩ��
	from T_user,T_func_item,T_user_T_func_role_def,T_func_item_T_func_role_def
	where T_user.user_id=T_user_T_func_role_def.user_id and T_user_T_func_role_def.func_role_id=T_func_item_T_func_role_def.func_role_id
		and T_func_item.func_id=T_func_item_T_func_role_def.func_id and T_user.user_name=@user_id
  end
 
 
 --ִ�д洢����
 exec p_user_fucn 'id01'