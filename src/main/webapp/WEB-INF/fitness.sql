--- ���� ��ɾ� ����� -- TOAD ���� F9 �� ���� �� ��ɾ� �����ؼ� F5 �� ���� 
SELECT  'DROP TABLE ' || object_name || ' CASCADE CONSTRAINTS;'
  FROM    user_objects
WHERE   object_type = 'TABLE';

SELECT  'DROP SEQUENCE ' || object_name ||';'
  FROM    user_objects
WHERE   object_type = 'SEQUENCE';

--���̺��ʱ�ȭ----------------------------
drop table pt_register;
drop table gx_register;
drop table survey;
drop table event;
drop table gx_schedule;
drop table subject;
drop table notice;
drop table payment;
drop table stf_att;
drop table sales;
drop table medicalcheck;
drop table pt_log;
drop table pt_schedule;
drop table timetable;
drop table trainer;
drop table refund;
drop table mem_att;
drop table qnaboard;
drop table freeboard;
drop table staff;
drop table position; 
drop table department;
drop table period;
drop table registration;
drop table member;
drop table center; 

--���������� �빮�ڷ� ǥ���ص� ����������!!

drop sequence SV_SEQ;	-- ������ ������
drop sequence EVENT_SEQ;	-- EVENT ������
drop sequence GX_SEQ; 	-- GX������ ������
drop sequence NOTICE_SEQ; 	-- ���� ������
drop sequence PAY_SEQ; 	-- ���� ������
drop sequence SATT_SEQ;	-- �����⼮ ������ (staff attendance)
drop sequence SALES_SEQ;	-- ���� ������
drop sequence MD_SEQ;	-- �Ƿ����� ������
drop sequence PTL_SEQ;	-- PT���� ������
drop sequence PTS_SEQ;	-- PT������ ������
drop sequence TT_SEQ;	-- �ð�ǥ ������
drop sequence TR_SEQ;	-- Ʈ���̳� ������
drop sequence RF_SEQ;	-- ȯ�� ������
drop sequence REGI_SEQ;	-- ��� ������
drop sequence MATT_SEQ;	-- ȸ���⼮ ������ (member attendance)
drop sequence QNA_SEQ;	-- QnA ������
drop sequence FREE_SEQ;	-- �����Խ��� ������
drop sequence STAFF_SEQ;	-- ���� ������
drop sequence DEPT_SEQ;	-- �μ� ������
drop sequence MEM_SEQ;	-- ȸ�� ������
drop sequence CT_SEQ;	-- ���� ������
drop sequence PTR_SEQ; -- pt���
drop sequence GX_SEQ; -- pt���

-------------------------------------------
create table center				--��������
(
	ct_code number(5) primary key,	--�����ڵ� PK
	ct_name varchar2(100),		--�����̸�
	ct_tel varchar2(30),			--������ȭ
	ct_addr varchar2(1000),		--�����ּ�
	ct_intro varchar2(4000)		--�����Ұ�
);
CREATE SEQUENCE CT_SEQ;
insert into center values(ct_seq.nextval,'ȭ������','031-111-1234','ȭ���� 1���ⱸ','Fitness Center ȭ������');
insert into center values(ct_seq.nextval,'��������','02-222-2224','������ 2���ⱸ','Fitness Center ��������');
insert into center values(ct_seq.nextval,'��������','02-333-7896','���̿� 3���ⱸ','Fitness Center ��������');
insert into center values(ct_seq.nextval,'��������','02-333-6514','���Ŀ� 4�� �ⱸ','Fitness Center ��������');
insert into center values(ct_seq.nextval,'�б�����','02-444-7582','�б����� 5�� �ⱸ','Fitness Center ��������');
insert into center values(ct_seq.nextval,'����','02-555-9463','����3���� 6�� �ⱸ','Fitness Center ����');
--ȭ������ ct_code 1���

create table member 			--ȸ������
(
	mem_num number(5) primary key,	--ȸ����ȣ PK
	mem_name varchar2(50) not null,	--ȸ���̸�
	mem_phone varchar2(50) not null,	--��ȭ��ȣ
	mem_addr varchar2(100) not null,	--ȸ���ּ�
	mem_email varchar2(50) not null,	--�̸���
	mem_age	number(5) not null,	--ȸ������
	mem_gen varchar2(10) not null CHECK ( MEM_GEN IN ('��', '��')),	--ȸ������
	mem_birth date not null,		--�������
	regdate date not null,		--������
	mem_picture varchar2(1000) not null,	--��������
	ct_code number(5)	 --�����ڵ� FK
);
CREATE SEQUENCE MEM_SEQ;

create table department			--�μ�����
(
	dept_code number(5) primary key,	--�μ��ڵ�PK
	dept_name varchar2(50)		--�μ��̸�
);
CREATE SEQUENCE DEPT_SEQ;
insert into department values(dept_seq.nextval,'�濵������');
insert into department values(dept_seq.nextval,'PT��');
insert into department values(dept_seq.nextval,'GX��');
insert into department values(dept_seq.nextval,'������');
insert into department values(dept_seq.nextval,'��Ÿ');

create table position			--��������
(
	pos_code varchar2(20) primary key,	--�����ڵ� PK
	pos_name varchar2(50),		--�����̸�
	dept_code number(5)  --�μ��ڵ� FK
);
INSERT INTO position VALUES('A','��ǥ�̻�',1);
INSERT INTO position VALUES('B','������',1);
INSERT INTO position VALUES('C','PT����',2);
INSERT INTO position VALUES('D','GX����',3);
INSERT INTO position VALUES('E','�Ŵ���',4);
INSERT INTO position VALUES('F1','GX����1',3);
INSERT INTO position VALUES('F2','GX����2',3);
INSERT INTO position VALUES('G1','PT����1',2);
INSERT INTO position VALUES('G2','PT����2',2);
INSERT INTO position VALUES('H','FC����',1);
INSERT INTO position VALUES('I','������',1);
INSERT INTO position VALUES('J','�Ƹ�����Ʈ',5);
INSERT INTO position VALUES('K','�繫����',1);
INSERT INTO position VALUES('L','Ȩ�ǰ���',1);


create table staff				--������
(
	stf_num number(5) primary key,	--��������ȣ PK
	stf_name varchar2(50),		--�������̸�
	stf_phone varchar2(50),		--��������ȭ
	stf_date date DEFAULT SYSDATE,	--�����������
	stf_picture varchar2(1000),		--����������
	pos_code varchar2(20) ,	--�����ڵ� FK
	ct_code number(5) DEFAULT 0  --�����ڵ� FK
);
CREATE SEQUENCE STAFF_SEQ;


create table freeboard			--�����Խ���
( 
	fb_num number(5) primary key,	--�۹�ȣ PK
	mem_num number(5) ,--�ۼ��� FK
	fb_title varchar2(100),		--������
	fb_content varchar2(4000),		--�۳���
	fb_date date,			--�ۼ���
	fb_hit number(5),			--��ȸ��
	fb_ref number(5),			--�׷��ȣ
	fb_lev number(5),			--�۷���
	fb_step number(5)			--��¼���
);
CREATE SEQUENCE FREE_SEQ;

create table qnaboard			--QnA�Խ���
(
	qna_num number(5) primary key,	--�۹�ȣ PK
	mem_num number(5),--�ۼ���(ȸ����ȣ) FK
	stf_num number(5),--��������ȣ FK
	qna_title varchar2(100),		--������
	qna_content varchar2(4000),		--�۳���
	qna_date	date,			--�ۼ���
	qna_hit number(5),			--��ȸ��
	qna_ref number(5),		--�׷��ȣ
	qna_lev number(5),		--�۷���
	qna_step number(5)		--��¼���
);


create table registration			--�������
(
	rg_num number(5) primary key,	--��Ϲ�ȣ
	mem_num number(5) ,--ȸ����ȣ FK
	rg_type varchar2(20),		--�������
	rg_price number,		--��ϰ���
	locker_price number(30) DEFAULT 0,	--��Ŀ����
	wear_price number(30) DEFAULT 0,	--�������
	signdate date
);
CREATE SEQUENCE REGI_SEQ;

create table trainer				--��������
(
	tr_num number(5) primary key,	--�����ȣ PK
	stf_num number(5) , --��������ȣ FK
	tr_career varchar2(4000),		--������
	tr_intro varchar2(4000)		--����Ұ�
);
CREATE SEQUENCE TR_SEQ;

create table timetable			--���ǽð�
(
	tt_num number(5) primary key,	--�ð���ȣ PK
	tt01 varchar2(50),			--1����
	tt02 varchar2(50),			--2����			
	tt03 varchar2(50),			--3����
	tt04 varchar2(50),			--4����
	tt05 varchar2(50),			--5����
	tt06 varchar2(50)			--6����
);
CREATE  SEQUENCE TT_SEQ;

create table pt_schedule				--PT������
(
	pts_num number(5) primary key,	--PT�����ٹ�ȣ PK
	pts_start date,			--PT������
	pts_end date,			--PT������
	mem_num number(5), --ȸ����ȣFK
	tt_num number(5) , --�ð���ȣFK
	tr_num number(5) , --�����ȣFK
	ct_code number(5)   --�����ڵ�FK
);
CREATE SEQUENCE PTS_SEQ;

create table pt_log				--�����
(
	ptl_num number(5) primary key,	--������ȣ PK
	ptl_content varchar2(4000),		--��������
	pts_num number(5)  --PT�����ٹ�ȣ FK
);
CREATE SEQUENCE PTL_SEQ;

create table medicalcheck			--�Ƿ�����
(
	md_num number(5) primary key,	--md��ȣ PK
	mem_num number(5) , --ȸ����ȣ FK
	relative varchar2(50),   		-- ���������
	absolute varchar2(50),		-- ����������
	par_q varchar2(50)			-- ��������
);
CREATE SEQUENCE MD_SEQ;

create table sales				--����
(	
	sal_num number(5) primary key,	--�����ȣ PK
	sal_money number,		--����ݾ�	
	ct_code number(5)		 --�����ڵ� FK
);
CREATE SEQUENCE SALES_SEQ;

create table mem_att			--ȸ���⼮
(	
	matt_num number(5) primary key, 	--ȸ���⼮��ȣPK
	in_date date,			--�⼮�Ͻ� 
	out_date date,		--�Ͱ��Ͻ�
	x_time number(5), 			--��ð�
	mem_num number(5) ,--ȸ����ȣ FK	
	ct_code number(5)  --�����ڵ� FK			--�����ڵ�
);
CREATE SEQUENCE MATT_SEQ;


create table stf_att				--���������
(
	Satt_num number(5) primary key, 	--�����⼮��ȣPK
	in_date date,			--����Ͻ�
	out_date date,			--����Ͻ� 
	work_time number(5), -- �ٹ��ð�
	stf_num number(5) , --������ȣ FK
	ct_code number(5)			--�����ڵ�
);
CREATE SEQUENCE SATT_SEQ;

	
create table payment			--����
(
	pay_num number(5) primary key,	--���޹�ȣ PK
	stf_num number(5) ,  --������ ��ȣ FK
	time_sum number(5),   -- �ѱٹ��ð�
	pay_tot number,		--�����հ�
	pay_date date			--���޳�¥
);
CREATE SEQUENCE PAY_SEQ;

create table notice				--��������	
(
	nt_num number(5) primary key,	--�۹�ȣ PK
	stf_num number(5) , --������ ��ȣ FK
	nt_title varchar2(100),			--������
	nt_content varchar2(4000),		--�۳���
	nt_date date,			--�ۼ���
	nt_hit number(5)			--��ȸ��
);
CREATE SEQUENCE NOTICE_SEQ;
-- insert into notice values(notice_seq.nextval,'1','���������Դϴ�','�ܿ��������',sysdate,0);
-- insert into notice values(notice_seq.nextval,'2','���������Դϴ�','�������',sysdate,0);
-- insert into notice values(notice_seq.nextval,'3','���������Դϴ�','��Ŀ������',sysdate,0);


create table subject				--��������
(
	sb_code varchar2(20) primary key,	--�����ڵ� PK
	sb_name varchar2(20)		--�����̸�
);

create table gx_schedule			--GX������
(
	gx_num number(5) primary key,	--GX�����ٹ�ȣ PK
	sb_code varchar2(20) REFERENCES SUBJECT(SB_CODE), --�����ڵ� FK
	gx_start date,			--���ǽ�����
	gx_end date,			--���Ǹ�����
	tt_num number(5) REFERENCES TIMETABLE(TT_NUM), --�ð���ȣ FK
	tr_num number(5) , --�����ȣ FK
	ct_code number(5)  --�����ڵ� FK
);
CREATE SEQUENCE GX_SEQ;

create table event				--�̺�Ʈ
(
	ev_num number(5) primary key,	--�̺�Ʈ��ȣ PK
	ev_title varchar2(10),		--�̺�Ʈ����
	stf_num number(5) , --�̺�Ʈ�ۼ��� FK
	ev_content varchar2(4000),		--�̺�Ʈ����
	re_writer varchar2(50),		--����ۼ���
	re_content varchar2(1000)		--��۳���
);
CREATE SEQUENCE EVENT_SEQ; 

create table survey
(
	sv_num number(5) primary key,
	sv_route varchar2(50),
	sv_anamnesis varchar2(50),
	sv_lifestyle varchar2(1000),
	sv_goal varchar2(1000),
	sv_memo varchar2(2000),
	mem_num number(5) ,
	sv_agree varchar2(10) CHECK(SV_AGREE IN ('YES','NO'))

);
CREATE SEQUENCE SV_SEQ;

create table pt_register
(
	ptr_num number(5) primary key, --ȸ����ϳѹ�	
	tr_num number(5) , --Ʈ���̳� ����
	rg_num number(5) , --ȸ�� ����
	ptr_initdate varchar2(50), --ȸ��������
	ptr_time varchar2(50), --ȸ���ð�
	ptr_count number(3), --PTȽ��
	ct_code number(5), --�����ڵ�
	ptr_ok varchar2(15) DEFAULT '���δ��' CHECK ( PTR_OK IN ('����','�������','���δ��')) --ȸ������
);
CREATE SEQUENCE PTR_SEQ;

COMMIT;

create table gx_register
(
	gx_num number(5) primary key, --ȸ����ϳѹ�
	tr_num number(5) , --Ʈ���̳� ����
	ct_name varchar2(20)	, --�����ڵ� FK
	mon09 varchar2(20), -- ������ 09��
	tue09 varchar2(20), -- ȭ���� 09��
	wed09 varchar2(20), -- ������ 09��
	thu09 varchar2(20), -- ����� 09��
	fri09 varchar2(20), -- �ݿ��� 09��
	sat09 varchar2(20), -- ����� 09��
	sun09 varchar2(20), -- �Ͽ��� 09��
	mon10 varchar2(20), -- ������ 10��
	tue10 varchar2(20), -- ȭ���� 10��	
	wed10 varchar2(20), -- ������ 10��
	thu10 varchar2(20), -- ����� 10��
	fri10 varchar2(20), -- �ݿ��� 10��
	sat10 varchar2(20), -- ����� 10��
	sun10 varchar2(20), -- �Ͽ��� 10��
	mon11 varchar2(20), -- ������ 10��
	tue11 varchar2(20), -- ȭ���� 10��
	wed11 varchar2(20), -- ������ 11��
	thu11 varchar2(20), -- ����� 11��
	fri11 varchar2(20), -- �ݿ��� 11��
	sat11 varchar2(20), -- ����� 11��
	sun11 varchar2(20), -- �Ͽ��� 11��
	mon18 varchar2(20), -- ������ 18��
	tue18 varchar2(20), -- ȭ���� 18��
	wed18 varchar2(20), -- ������ 18��
	thu18 varchar2(20), -- ����� 18��
	fri18 varchar2(20), -- �ݿ��� 18��
	sat18 varchar2(20), -- ����� 18��
	sun18 varchar2(20), -- �Ͽ��� 18��
	mon19 varchar2(20), -- ������ 19��
	tue19 varchar2(20), -- ȭ���� 19��
	wed19 varchar2(20), -- ������ 19��
	thu19 varchar2(20), -- ����� 19��
	fri19 varchar2(20), -- �ݿ��� 19��
	sat19 varchar2(20), -- ����� 19��
	sun19 varchar2(20), -- �Ͽ��� 19��
	mon20 varchar2(20), -- ������ 20��
	tue20 varchar2(20), -- ȭ���� 20��
	wed20 varchar2(20), -- ������ 20��
	thu20 varchar2(20), -- ����� 20��
	fri20 varchar2(20), -- �ݿ��� 20��
	sat20 varchar2(20), -- ����� 20��
	sun20 varchar2(20) -- �Ͽ��� 20��
);

CREATE SEQUENCE GX_SEQ;

create table gxsubject			--��������
(
	gx_code varchar2(20) primary key,	--�����ڵ� PK
	gx_name varchar2(50)				--�����̸�	
);
INSERT INTO gxsubject VALUES('A','����κ�');
INSERT INTO gxsubject VALUES('B','����');
INSERT INTO gxsubject VALUES('C','�䰡');
INSERT INTO gxsubject VALUES('D','�ʶ��׽�');
INSERT INTO gxsubject VALUES('E','ABT');
INSERT INTO gxsubject VALUES('F','�ٵ�����');
INSERT INTO gxsubject VALUES('Z','��Ÿ');

create table refund(					 --ȯ��
	refund_num number(10)  primary key,
	mem_num number(10),			 	-- ȸ����ȣ
	refund_date date,   			 -- ȯ�ҳ�¥
	rg_num  number(10),              -- ��Ϲ�ȣ 
	ct_code number(10),              -- �����ڵ�
	rg_type varchar2(20),            -- �����
	refund_price number(10) 		 -- �ѱݾ�	
);
CREATE SEQUENCE RF_SEQ;;


drop sequence event_seq;
drop table eventcomments;
drop table event;

create table event(
	ev_num number(20) primary key, --�̺�Ʈ��ȣ
	ev_title varchar2(20), --�̺�Ʈ����
	ev_picture varchar2(1000) not null, --�̺�Ʈ����
	ev_content varchar2(4000), --�̺�Ʈ����
	stf_num number(20) , --�̺�Ʈ�ۼ��� FK
	ev_date date not null --�̺�Ʈ�ۼ���
);
CREATE SEQUENCE EVENT_SEQ; 

create table EventComments
(
 comm_num number(20) primary key, --�ڸ�Ʈ��ȣ
 ev_num number(20) references event(ev_num), --�̺�Ʈ��ȣFK
 mem_num number(20), --����ۼ���ȸ��
 stf_num number(20), --����ۼ�������
 comments varchar2(100), --��۳���
 comm_date date, --����ۼ���
 comm_ref number(10),
 comm_lev number(10),
 comm_step number(10)
);

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
--------------------------------------------------------
--�������� �߰��ٶ� �ɼ� ��)
--ALTER TABLE GROUPS
--ADD CONSTRAINTS FK_GROUPS_LEADER FOREIGN KEY(id)
--REFERENCES MEMBER(ID);
--DEFAULT : ���� �������������� ������ ���� ���� �ϴ� ��
--CHECK : ���ǿ� �´� �����͸� �Էµǵ��� ������ �ο��� ��������(��, ������ �ش�Ǵ� �÷��� ������ �� �ִ������� 100���̸�, 100������ ���� �����ʹ� �Է� ���ϵ��� ������ �ɾ�� �Ǵ� ������ ��쿣 ���� ���� �Է��� �����ϵ��� ��.)
