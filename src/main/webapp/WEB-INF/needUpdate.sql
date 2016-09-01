create table refund				--환불
(
	rf_num number(20) primary key,	--환불번호 PK
	rg_num number(20) REFERENCES REGISTRATION(RG_NUM),	--등록번호 FK
	rf_left date,			--잔여일
	pri_num number(20) REFERENCES PERIOD(PRI_NUM)--기간번호 FK
);
CREATE SEQUENCE RF_SEQ;