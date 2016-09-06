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
insert into center values(ct_seq.nextval,'ȭ������','031-111-1234','ȭ����','�Ǹ��� Ʈ���̳�');
insert into center values(ct_seq.nextval,'��������','02-222-2224','����3����','���� Ʈ���̳�');
insert into center values(ct_seq.nextval,'����','02-333-4444','����3����','���� Ʈ���̳�');
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
	ct_code number(5)	REFERENCES CENTER(CT_CODE) --�����ڵ� FK
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

create table position			--��������
(
	pos_code varchar2(20) primary key,	--�����ڵ� PK
	pos_name varchar2(50),		--�����̸�
	dept_code number(5) REFERENCES DEPARTMENT(DEPT_CODE) --�μ��ڵ� FK
);
INSERT INTO position VALUES('A','��ǥ�̻�',1);
INSERT INTO position VALUES('B','PT����',2);
INSERT INTO position VALUES('C','GX����',3);
INSERT INTO position VALUES('D','PT����',2);
INSERT INTO position VALUES('E','GX����',3);

create table staff				--������
(
	stf_num number(5) primary key,	--��������ȣ PK
	stf_name varchar2(50),		--�������̸�
	stf_phone varchar2(50),		--��������ȭ
	stf_date date DEFAULT SYSDATE,	--�����������
	stf_picture varchar2(1000),		--����������
	pos_code varchar2(20) REFERENCES POSITION(POS_CODE),	--�����ڵ� FK
	ct_code number(5) DEFAULT 0 REFERENCES CENTER(CT_CODE) --�����ڵ� FK
);
CREATE SEQUENCE STAFF_SEQ;
insert into staff values(staff_seq.nextval,'STF_KIM','011',sysdate,'kim.jpg','A',2);
insert into staff values(staff_seq.nextval,'STF_LEE','017',sysdate,'lee.jpg','B',2);
insert into staff values(staff_seq.nextval,'STF_MOON','019',sysdate,'moon.jpg','C',);


create table freeboard			--�����Խ���
( 
	fb_num number(5) primary key,	--�۹�ȣ PK
	mem_num number(5) REFERENCES MEMBER(MEM_NUM),--�ۼ��� FK
	fb_title varchar2(100),		--������
	fb_content varchar2(4000),		--�۳���
	fb_date date,			--�ۼ���
	fb_hit number(5),			--��ȸ��
	fb_ref number(5),			--�׷��ȣ
	fb_lef number(5),			--�۷���
	fb_step number(5)			--��¼���
);
CREATE SEQUENCE FREE_SEQ;

create table qnaboard			--QnA�Խ���
(
	qna_num number(5) primary key,	--�۹�ȣ PK
	mem_num number(5) REFERENCES MEMBER(MEM_NUM),--�ۼ���(ȸ����ȣ) FK
	qna_title varchar2(100),		--������
	qna_content varchar2(4000),		--�۳���
	qna_date	date,			--�ۼ���
	qna_hit number(5),			--��ȸ��
	qna_ref number(5),		--�׷��ȣ
	qna_lev number(5),		--�۷���
	qna_step number(5)		--��¼���
);
CREATE SEQUENCE QNA_SEQ;

create table mem_att			--ȸ���⼮
(	
	matt_num number(5) primary key, 	--ȸ���⼮��ȣPK
	matt_date date,			--�⼮�� 
	mem_num number(5) REFERENCES MEMBER(MEM_NUM),--ȸ����ȣ FK	
	ct_code number(5) REFERENCES CENTER(CT_CODE) --�����ڵ� FK			--�����ڵ�
);
CREATE SEQUENCE MATT_SEQ;

create table registration			--�������
(
	rg_num number(5) primary key,	--��Ϲ�ȣ
	mem_num number(5) REFERENCES MEMBER(MEM_NUM),--ȸ����ȣ FK
	rg_type varchar2(20),		--�������
	rg_price number,		--��ϰ���
	locker_price number(30) DEFAULT 0,	--��Ŀ����
	wear_price number(30) DEFAULT 0	--�������
);
CREATE SEQUENCE REGI_SEQ;

create table trainer				--��������
(
	tr_num number(5) primary key,	--�����ȣ PK
	stf_num number(5) REFERENCES STAFF(STF_NUM), --��������ȣ FK
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
	mem_num number(5) REFERENCES MEMBER(MEM_NUM), --ȸ����ȣFK
	tt_num number(5) REFERENCES TIMETABLE(TT_NUM), --�ð���ȣFK
	tr_num number(5) REFERENCES TRAINER(TR_NUM), --�����ȣFK
	ct_code number(5) REFERENCES CENTER(CT_CODE)  --�����ڵ�FK
);
CREATE SEQUENCE PTS_SEQ;

create table pt_log				--�����
(
	ptl_num number(5) primary key,	--������ȣ PK
	ptl_content varchar2(4000),		--��������
	pts_num number(5) REFERENCES PT_SCHEDULE(PTS_NUM) --PT�����ٹ�ȣ FK
);
CREATE SEQUENCE PTL_SEQ;

create table medicalcheck			--�Ƿ�����
(
	md_num number(5) primary key,	--md��ȣ PK
	mem_num number(5) REFERENCES MEMBER(MEM_NUM), --ȸ����ȣ FK
	relative varchar2(50),   		-- ���������
	absolute varchar2(50),		-- ����������
	par_q varchar2(50)			-- ��������
);
CREATE SEQUENCE MD_SEQ;

create table sales				--����
(	
	sal_num number(5) primary key,	--�����ȣ PK
	sal_money number,		--����ݾ�	
	ct_code number(5)	REFERENCES CENTER(CT_CODE) --�����ڵ� FK
);
CREATE SEQUENCE SALES_SEQ;

create table stf_att				--�����⼮
(
	Satt_num number(5) primary key, 	--�����⼮��ȣPK
	satt_date date,			--�⼮�� 
	stf_num number(5) REFERENCES STAFF(STF_NUM), --������ȣ FK
	ct_code number(5)			--�����ڵ�
);
CREATE SEQUENCE SATT_SEQ;

create table payment			--����
(
	pay_num number(5) primary key,	--���޹�ȣ PK
	pay_tot number,		--�����հ�
	pay_date date,			--���޳�¥
	satt_num number(5) REFERENCES STF_ATT(SATT_NUM) --�⼮�� FK
);
CREATE SEQUENCE PAY_SEQ;

create table notice				--��������	
(
	nt_num number(5) primary key,	--�۹�ȣ PK
	stf_num number(5) REFERENCES STAFF(STF_NUM), --������ ��ȣ FK
	nt_title varchar2(100),			--������
	nt_content varchar2(4000),		--�۳���
	nt_date date,			--�ۼ���
	nt_hit number(5)			--��ȸ��
);
CREATE SEQUENCE NOTICE_SEQ;
insert into notice values(notice_seq.nextval,'1','���������Դϴ�','�ܿ��������',sysdate,0);
insert into notice values(notice_seq.nextval,'2','���������Դϴ�','�������',sysdate,0);
insert into notice values(notice_seq.nextval,'3','���������Դϴ�','��Ŀ������',sysdate,0);


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
	tr_num number(5) REFERENCES TRAINER(TR_NUM), --�����ȣ FK
	ct_code number(5) REFERENCES CENTER(CT_CODE) --�����ڵ� FK
);
CREATE SEQUENCE GX_SEQ;

create table event				--�̺�Ʈ
(
	ev_num number(5) primary key,	--�̺�Ʈ��ȣ PK
	ev_title varchar2(10),		--�̺�Ʈ����
	stf_num number(5) REFERENCES STAFF(STF_NUM), --�̺�Ʈ�ۼ��� FK
	ev_content varchar2(4000),		--�̺�Ʈ����
	re_writer varchar2(50),		--����ۼ���
	re_content varchar2(1000),		--��۳���
	re_ref number(5),			--�׷��ȣ
	re_step number(5)			--�����¼���
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
	mem_num number(5) REFERENCES MEMBER(MEM_NUM),
	sv_agree varchar2(10) CHECK(SV_AGREE IN ('YES','NO'))

);
CREATE SEQUENCE SV_SEQ;

create table pt_register
(
	ptr_num number(5) primary key, --ȸ����ϳѹ�	
	tr_num number(5) REFERENCES TRAINER(TR_NUM), --Ʈ���̳� ����
	rg_num number(5) REFERENCES REGISTRATION(RG_NUM), --ȸ�� ����
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
	ct_code number(5), --�����ڵ�
	gx_exercise varchar2(20), -- gx�
	gx_day varchar2(50), -- ������/ȭ��
	gx_time varchar2(50), -- �ð�
	rg_num number(5) REFERENCES REGISTRATION(RG_NUM) --ȸ�� ����
);
commit;

CREATE SEQUENCE GX_SEQ;

--------------------------------------------------------
--�������� �߰��ٶ� �ɼ� ��)
--ALTER TABLE GROUPS
--ADD CONSTRAINTS FK_GROUPS_LEADER FOREIGN KEY(id)
--REFERENCES MEMBER(ID);
--DEFAULT : ���� �������������� ������ ���� ���� �ϴ� ��
--CHECK : ���ǿ� �´� �����͸� �Էµǵ��� ������ �ο��� ��������(��, ������ �ش�Ǵ� �÷��� ������ �� �ִ������� 100���̸�, 100������ ���� �����ʹ� �Է� ���ϵ��� ������ �ɾ�� �Ǵ� ������ ��쿣 ���� ���� �Է��� �����ϵ��� ��.)
