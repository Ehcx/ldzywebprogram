 ---�����ĵ�һ�⣺�� 4 ����ֱ���� 2 ���������ݣ��������ݰ���������Ŀ��ʹ�õ����ݣ���
 insert into tbl_supplier values('��̩�ջ�','13007380001','����¦��',null)
 insert into tbl_supplier values('����ţ��','13007380002','����¦��',null)
 
 insert into tbl_goods values(1,'¦��ţ��','20180910','ʳƷ',1,100,null)
 insert into tbl_goods values(2,'¦��ţ��','20181010','ʳƷ',1,100,null)
 
 insert into tbl_instock values(1,10,58,default)
  insert into tbl_instock values(1,5,58,default)
  
 insert into tbl_outstock values(1,3,default)
  insert into tbl_outstock values(1,3,default)
 
 ---�����ĵڶ��⣺��ѯ��Ӧ������Ϊ����̩�ջ�����������������Ʒ���ƣ�
 
 
 
 ---�����ĵ����⣺�޸Ļ���IDΪ 2 ����ⵥ�ۣ���ԭ�л�������� 10%��
 
 
 ---�����ĵ����⣺������ͼ��ѯ����̩�ջ���������������Ʒ���ơ���ⵥ�ۡ����п�棻
 create view vw_goods
 as
 select a.goodName as ��Ʒ����,b.goodPrice as ��ⵥ��,a.storeQuantity as ���п��
 from tbl_goods a,tbl_instock b,tbl_supplier c
 where a.goodId=b.goodId and a.suppId=c.suppId and c.suppName='��̩�ջ�'
 
 
 ---�����ĵ����⣺ ����������ʵ��ĳ��Ʒ����ʱ�Զ����¿��������
 --������Ĵ洢���̣�������ִ�����Զ��ģ�����Ҫ�������ã�ֻ��Ҫ�����˴����������Զ�ִ�иô���
 
 create trigger trg_outStock
 on tbl_outstock
 for insert
 as
---����tbl_outstock�����¼���Զ�ִ���������
begin
	declare  @goodid int,@outQuantity int
	select @goodid=goodId,@outQuantity=outQuantity from Inserted
	update tbl_goods
	set storeQuantity=storeQuantity-@outQuantity
	where goodId=@goodid
end

 insert into tbl_outstock values(1,3,default)