drop sequence ptprice_seq;
drop sequence proprice_seq;
drop sequence ptsign_seq;
drop sequence prosign_seq;
drop sequence properiod_seq;
drop sequence ptperiod_seq;

drop table ptprice;
drop table programprice;
drop table ptsign;
drop table prosign;
drop table properiod;
drop table ptperiod;

create sequence PTPRICE_SEQ;
create sequence PROPRICE_SEQ;
create sequence ptsign_seq;
create sequence prosign_seq;
create sequence properiod_seq;
create sequence ptperiod_seq;

<<<<<<< HEAD

drop sequence proprice_seq;
drop table programprice;
drop sequence ptsign_seq;
drop table ptsign;
drop sequence prosign_seq;
drop table prosign;
drop sequence properiod_seq;
drop table properiod;
drop sequence ptperiod_seq;
drop table ptperiod;

=======
>>>>>>> 8443473854847edc029a8f47a07635546b77b17a
create table ptprice --pt가격테이블
(
	pt_num number(20) primary key, --pt유형번호
	pt_code varchar2(20), --프로그램코드
	pt_name varchar2(20), --pt이름및개월
	ptr_count number(20), --pt횟수
	pt_signmonth number(6), --등록개월수
	pt_price number --pt가격
);

insert into ptprice values(ptprice_seq.nextval, 'pt01', '1개월 주1회', 4, 1, 200000);
insert into ptprice values(ptprice_seq.nextval, 'pt02', '1개월 주2회', 8, 1, 400000);
insert into ptprice values(ptprice_seq.nextval, 'pt03', '1개월 주3회', 12, 1, 600000);
insert into ptprice values(ptprice_seq.nextval, 'pt04', '3개월 주1회', 12, 3, 600000);
insert into ptprice values(ptprice_seq.nextval, 'pt05', '3개월 주2회', 24, 3, 1200000);
insert into ptprice values(ptprice_seq.nextval, 'pt06', '3개월 주3회', 36, 3, 1800000);

create table programprice --프로그램가격테이블
(
	pro_num number(20) primary key,       --등록번호
	pro_code varchar2(20),       --프로그램코드
	pro_name varchar2(20),       --프로그램이름및등록개월
	pro_signmonth number(6), --등록개월수
	pro_price number       --프로그램금액
);

insert into programprice values(proprice_seq.nextval,'a1','헬스 1개월',1,70000);
insert into programprice values(proprice_seq.nextval,'a2','헬스 3개월',3,180000);
insert into programprice values(proprice_seq.nextval,'a3','헬스 6개월',6,300000);
insert into programprice values(proprice_seq.nextval,'a4','헬스 12개월',12,480000);
insert into programprice values(proprice_seq.nextval,'b1','GX 1개월',1,90000);
insert into programprice values(proprice_seq.nextval,'b2','GX 3개월',3,210000);
insert into programprice values(proprice_seq.nextval,'b3','GX 6개월',6,360000);
insert into programprice values(proprice_seq.nextval,'b4','GX 12개월',12,600000);
insert into programprice values(proprice_seq.nextval,'c1','헬스GX 1개월',1,120000);
insert into programprice values(proprice_seq.nextval,'c2','헬스GX 3개월',3,330000);
insert into programprice values(proprice_seq.nextval,'c3','헬스GX 6개월',6,630000);
insert into programprice values(proprice_seq.nextval,'c4','헬스GX 12개월',12,960000);

create table ptsign --pt등록한 회원명단 테이블
(
	ptsign_num number(20),
	rg_num number(20) references registration(rg_num),
	mem_num number(20) references member(mem_num),
	pt_code varchar2(20),
	pt_name varchar2(20), --pt이름및개월
	ptr_count number(20) --pt횟수
);

create table prosign --단과과목 등록한 회원명단 테이블
(
	prosign_num number(20),
	rg_num number(20) references registration(rg_num),
	mem_num number(20) references member(mem_num),
	pro_name varchar2(20),       --프로그램이름및등록개월
	pro_code varchar2(20)
);

create table properiod --단과과목 등록기간테이블
(
	properiod_num number(20) primary key,
	rg_num number(20) references registration(rg_num),
	mem_num number(20) references member(mem_num),
	pro_signmonth number(6), --등록개월수
	pro_regdate date, --단과과목 시작일
	pro_expiration date --PT만료일
);

create table ptperiod --PT과목 등록기간테이블
(
	ptperiod_num number(20) primary key,
	rg_num number(20) references registration(rg_num),
	mem_num number(20) references member(mem_num),
	pt_signmonth number(6), --등록개월수
	ptr_initdate date, --PT과목 시작일
	pt_expiration date --PT 만료일
);