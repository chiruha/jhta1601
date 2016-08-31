alter table registration add(signdate date); --registration 테이블 수정

drop sequence ptprice_seq;
drop table ptprice;
create table ptprice --pt가격테이블
(
	pt_num number(20) primary key, --pt유형번호
	pt_code varchar2(20), --프로그램코드
	pt_month varchar2(20), --pt 등록개월및주몇회
	ptr_count number(20), --pt횟수
	pt_price number --pt가격
);
create sequence PTPRICE_SEQ;
insert into ptprice values(ptprice_seq.nextval, 'pt01', '1개월 주1회', 4, 200000);
insert into ptprice values(ptprice_seq.nextval, 'pt02', '1개월 주2회', 8, 200000);
insert into ptprice values(ptprice_seq.nextval, 'pt03', '1개월 주3회', 12, 200000);
insert into ptprice values(ptprice_seq.nextval, 'pt04', '3개월 주1회', 12, 200000);
insert into ptprice values(ptprice_seq.nextval, 'pt05', '3개월 주2회', 24, 200000);
insert into ptprice values(ptprice_seq.nextval, 'pt06', '3개월 주3회', 36, 200000);

drop sequence proprice_seq;
drop table programprice;
create table programprice --프로그램가격테이블
(
	pro_num number(20) primary key,       --등록번호
	pro_code varchar2(20),       --프로그램코드
	pro_name varchar2(20),       --프로그램이름및등록개월
	pro_price number       --프로그램금액
);
create sequence PROPRICE_SEQ;
insert into programprice values(proprice_seq.nextval,'a1','헬스 1개월',70000);
insert into programprice values(proprice_seq.nextval,'a2','헬스 3개월',180000);
insert into programprice values(proprice_seq.nextval,'a3','헬스 6개월',300000);
insert into programprice values(proprice_seq.nextval,'a4','헬스 12개월',480000);
insert into programprice values(proprice_seq.nextval,'b1','GX 1개월',90000);
insert into programprice values(proprice_seq.nextval,'b2','GX 3개월',210000);
insert into programprice values(proprice_seq.nextval,'b3','GX 6개월',360000);
insert into programprice values(proprice_seq.nextval,'b4','GX 12개월',600000);
insert into programprice values(proprice_seq.nextval,'c1','헬스GX 1개월',120000);
insert into programprice values(proprice_seq.nextval,'c2','헬스GX 3개월',330000);
insert into programprice values(proprice_seq.nextval,'c3','헬스GX 6개월',630000);
insert into programprice values(proprice_seq.nextval,'c4','헬스GX 12개월',960000);


drop sequence ptsign_seq;
drop table ptsign;

create sequence ptsign_seq;
create table ptsign --pt등록한 회원명단 테이블
(
	ptsign_num number(20),
	mem_num number(20) references member(mem_num),
	pt_code varchar2(20),
	ptr_count number(20), --pt횟수
	pt_regdate date --pt등록일
);

drop sequence prosign_seq;
drop table prosign;
create sequence prosign_seq;
create table prosign --단과과목 등록한 회원명단 테이블
(
	prosign_num number(20),
	mem_num number(20) references member(mem_num),
	pro_code varchar2(20),
	prosign_regdate date
);