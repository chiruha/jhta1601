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
create table ptprice --pt�������̺�
(
	pt_num number(20) primary key, --pt������ȣ
	pt_code varchar2(20), --���α׷��ڵ�
	pt_name varchar2(20), --pt�̸��װ���
	ptr_count number(20), --ptȽ��
	pt_signmonth number(6), --��ϰ�����
	pt_price number --pt����
);

insert into ptprice values(ptprice_seq.nextval, 'pt01', '1���� ��1ȸ', 4, 1, 200000);
insert into ptprice values(ptprice_seq.nextval, 'pt02', '1���� ��2ȸ', 8, 1, 400000);
insert into ptprice values(ptprice_seq.nextval, 'pt03', '1���� ��3ȸ', 12, 1, 600000);
insert into ptprice values(ptprice_seq.nextval, 'pt04', '3���� ��1ȸ', 12, 3, 600000);
insert into ptprice values(ptprice_seq.nextval, 'pt05', '3���� ��2ȸ', 24, 3, 1200000);
insert into ptprice values(ptprice_seq.nextval, 'pt06', '3���� ��3ȸ', 36, 3, 1800000);

create table programprice --���α׷��������̺�
(
	pro_num number(20) primary key,       --��Ϲ�ȣ
	pro_code varchar2(20),       --���α׷��ڵ�
	pro_name varchar2(20),       --���α׷��̸��׵�ϰ���
	pro_signmonth number(6), --��ϰ�����
	pro_price number       --���α׷��ݾ�
);

insert into programprice values(proprice_seq.nextval,'a1','�ｺ 1����',1,70000);
insert into programprice values(proprice_seq.nextval,'a2','�ｺ 3����',3,180000);
insert into programprice values(proprice_seq.nextval,'a3','�ｺ 6����',6,300000);
insert into programprice values(proprice_seq.nextval,'a4','�ｺ 12����',12,480000);
insert into programprice values(proprice_seq.nextval,'b1','GX 1����',1,90000);
insert into programprice values(proprice_seq.nextval,'b2','GX 3����',3,210000);
insert into programprice values(proprice_seq.nextval,'b3','GX 6����',6,360000);
insert into programprice values(proprice_seq.nextval,'b4','GX 12����',12,600000);
insert into programprice values(proprice_seq.nextval,'c1','�ｺGX 1����',1,120000);
insert into programprice values(proprice_seq.nextval,'c2','�ｺGX 3����',3,330000);
insert into programprice values(proprice_seq.nextval,'c3','�ｺGX 6����',6,630000);
insert into programprice values(proprice_seq.nextval,'c4','�ｺGX 12����',12,960000);

create table ptsign --pt����� ȸ����� ���̺�
(
	ptsign_num number(20),
	rg_num number(20) references registration(rg_num),
	mem_num number(20) references member(mem_num),
	pt_code varchar2(20),
	pt_name varchar2(20), --pt�̸��װ���
	ptr_count number(20) --ptȽ��
);

create table prosign --�ܰ����� ����� ȸ����� ���̺�
(
	prosign_num number(20),
	rg_num number(20) references registration(rg_num),
	mem_num number(20) references member(mem_num),
	pro_name varchar2(20),       --���α׷��̸��׵�ϰ���
	pro_code varchar2(20)
);

create table properiod --�ܰ����� ��ϱⰣ���̺�
(
	properiod_num number(20) primary key,
	rg_num number(20) references registration(rg_num),
	mem_num number(20) references member(mem_num),
	pro_signmonth number(6), --��ϰ�����
	pro_regdate date, --�ܰ����� ������
	pro_expiration date --PT������
);

create table ptperiod --PT���� ��ϱⰣ���̺�
(
	ptperiod_num number(20) primary key,
	rg_num number(20) references registration(rg_num),
	mem_num number(20) references member(mem_num),
	pt_signmonth number(6), --��ϰ�����
	ptr_initdate date, --PT���� ������
	pt_expiration date --PT ������
);