create table refund				--환불
(
	rf_num number(20) primary key,	--환불번호 PK
	rg_numlist varchar2(50) , -- rg_num 등록번호 가져오기
	rf_left date,			--잔여일
	ptrefund number(20), -- pt환불액
	gxrefund number(20) -- gx환불액	
);
CREATE SEQUENCE RF_SEQ;
