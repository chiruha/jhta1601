create table refund				--ȯ��
(
	rf_num number(20) primary key,	--ȯ�ҹ�ȣ PK
	rg_numlist varchar2(50) , -- rg_num ��Ϲ�ȣ ��������
	rf_left date,			--�ܿ���
	ptrefund number(20), -- ptȯ�Ҿ�
	gxrefund number(20) -- gxȯ�Ҿ�	
);
CREATE SEQUENCE RF_SEQ;
