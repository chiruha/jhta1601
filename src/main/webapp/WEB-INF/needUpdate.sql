create table refund				--ȯ��
(
	rf_num number(20) primary key,	--ȯ�ҹ�ȣ PK
	rg_num number(20) REFERENCES REGISTRATION(RG_NUM),	--��Ϲ�ȣ FK
	rf_left date,			--�ܿ���
	pri_num number(20) REFERENCES PERIOD(PRI_NUM)--�Ⱓ��ȣ FK
);
CREATE SEQUENCE RF_SEQ;