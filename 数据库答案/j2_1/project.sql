--任务四，第一题
-- 在T_user表插入数据： “id01，刘德华，123，KBB，5678900，湖南长沙，13899005678，ldh123，admin”；
insert into T_user  values('id01','刘德华','123','KBB','5678900','湖南长沙','13899005678','ldh123','admin')

--任务四，第二题
--查询出所属部门为“KBB”的操作员的姓名和编号
select user_name as 姓名,user_id as 编号
from T_user
where dept_id='KBB'

--任务四,第三题
---查询出姓名为“刘德华”的操作员具有哪些功能权限；
select T_func_item.func_name as 功能权限
from T_user,T_func_item,T_user_T_func_role_def,T_func_item_T_func_role_def
where T_user.user_id=T_user_T_func_role_def.user_id and T_user_T_func_role_def.func_role_id=T_func_item_T_func_role_def.func_role_id
 and T_func_item.func_id=T_func_item_T_func_role_def.func_id and T_user.user_name='刘德华'
 
 
 --任务四，第四题
 --查询出“投标责任人”角色所拥有的功能 
 select T_func_item.func_name as 所有拥有的功能
 from T_func_item,T_func_role_def,T_func_item_T_func_role_def
 where T_func_role_def.func_role_id=T_func_item_T_func_role_def.func_role_id and T_func_role_def.func_role_name='投标责任人'
 
 
 --任务四，第五题
 --创建视图查询操作员的姓名，密码和所属部门
 create view v_T_user 
 as 
 select user_name as 姓名,user_passwd as 密码,dept_id as 所有部门
 from T_user
 
 
  --任务四，第六题
  --创建存储过程，查询指定操作员所具有的功能权限
  create procedure p_user_fucn
  @user_id char(4)
  as
  begin
	select T_func_item.func_name as 功能权限
	from T_user,T_func_item,T_user_T_func_role_def,T_func_item_T_func_role_def
	where T_user.user_id=T_user_T_func_role_def.user_id and T_user_T_func_role_def.func_role_id=T_func_item_T_func_role_def.func_role_id
		and T_func_item.func_id=T_func_item_T_func_role_def.func_id and T_user.user_name=@user_id
  end
 
 
 --执行存储过程
 exec p_user_fucn 'id01'