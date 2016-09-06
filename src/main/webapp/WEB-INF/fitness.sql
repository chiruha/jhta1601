--- 삭제 명령어 만들기 -- TOAD 에서 F9 로 실행 후 명령어 복사해서 F5 로 실행 
SELECT  'DROP TABLE ' || object_name || ' CASCADE CONSTRAINTS;'
  FROM    user_objects
WHERE   object_type = 'TABLE';

SELECT  'DROP SEQUENCE ' || object_name ||';'
  FROM    user_objects
WHERE   object_type = 'SEQUENCE';

--테이블초기화----------------------------
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

--제약조건은 대문자로 표시해둠 최종수정함!!

drop sequence SV_SEQ;	-- 설문지 시퀀스
drop sequence EVENT_SEQ;	-- EVENT 시퀀스
drop sequence GX_SEQ; 	-- GX스케줄 시퀀스
drop sequence NOTICE_SEQ; 	-- 공지 시퀀스
drop sequence PAY_SEQ; 	-- 월급 시퀀스
drop sequence SATT_SEQ;	-- 직원출석 시퀀스 (staff attendance)
drop sequence SALES_SEQ;	-- 매출 시퀀스
drop sequence MD_SEQ;	-- 의료정보 시퀀스
drop sequence PTL_SEQ;	-- PT일지 시퀀스
drop sequence PTS_SEQ;	-- PT스케줄 시퀀스
drop sequence TT_SEQ;	-- 시간표 시퀀스
drop sequence TR_SEQ;	-- 트레이너 시퀀스
drop sequence RF_SEQ;	-- 환불 시퀀스
drop sequence REGI_SEQ;	-- 등록 시퀀스
drop sequence MATT_SEQ;	-- 회원출석 시퀀스 (member attendance)
drop sequence QNA_SEQ;	-- QnA 시퀀스
drop sequence FREE_SEQ;	-- 자유게시판 시퀀스
drop sequence STAFF_SEQ;	-- 직원 시퀀스
drop sequence DEPT_SEQ;	-- 부서 시퀀스
drop sequence MEM_SEQ;	-- 회원 시퀀스
drop sequence CT_SEQ;	-- 지점 시퀀스
drop sequence PTR_SEQ; -- pt등록
drop sequence GX_SEQ; -- pt등록

-------------------------------------------
create table center				--지점정보
(
	ct_code number(5) primary key,	--지점코드 PK
	ct_name varchar2(100),		--지점이름
	ct_tel varchar2(30),			--지점전화
	ct_addr varchar2(1000),		--지점주소
	ct_intro varchar2(4000)		--지점소개
);
CREATE SEQUENCE CT_SEQ;
insert into center values(ct_seq.nextval,'화정지점','031-111-1234','화정역','훌륭한 트레이너');
insert into center values(ct_seq.nextval,'종로지점','02-222-2224','종로3가역','종로 트레이너');
insert into center values(ct_seq.nextval,'본점','02-333-4444','종로3가역','종로 트레이너');
--화정지점 ct_code 1등록

create table member 			--회원정보
(
	mem_num number(5) primary key,	--회원번호 PK
	mem_name varchar2(50) not null,	--회원이름
	mem_phone varchar2(50) not null,	--전화번호
	mem_addr varchar2(100) not null,	--회원주소
	mem_email varchar2(50) not null,	--이메일
	mem_age	number(5) not null,	--회원나이
	mem_gen varchar2(10) not null CHECK ( MEM_GEN IN ('남', '여')),	--회원성별
	mem_birth date not null,		--생년월일
	regdate date not null,		--가입일
	mem_picture varchar2(1000) not null,	--사진파일
	ct_code number(5)	REFERENCES CENTER(CT_CODE) --지점코드 FK
);
CREATE SEQUENCE MEM_SEQ;

create table department			--부서정보
(
	dept_code number(5) primary key,	--부서코드PK
	dept_name varchar2(50)		--부서이름
);
CREATE SEQUENCE DEPT_SEQ;
insert into department values(dept_seq.nextval,'경영관리부');
insert into department values(dept_seq.nextval,'PT부');
insert into department values(dept_seq.nextval,'GX부');

create table position			--직급정보
(
	pos_code varchar2(20) primary key,	--직급코드 PK
	pos_name varchar2(50),		--직급이름
	dept_code number(5) REFERENCES DEPARTMENT(DEPT_CODE) --부서코드 FK
);
INSERT INTO position VALUES('A','대표이사',1);
INSERT INTO position VALUES('B','PT부장',2);
INSERT INTO position VALUES('C','GX부장',3);
INSERT INTO position VALUES('D','PT직원',2);
INSERT INTO position VALUES('E','GX직원',3);

create table staff				--스태프
(
	stf_num number(5) primary key,	--스태프번호 PK
	stf_name varchar2(50),		--스태프이름
	stf_phone varchar2(50),		--스태프전화
	stf_date date DEFAULT SYSDATE,	--스태프등록일
	stf_picture varchar2(1000),		--스태프사진
	pos_code varchar2(20) REFERENCES POSITION(POS_CODE),	--직급코드 FK
	ct_code number(5) DEFAULT 0 REFERENCES CENTER(CT_CODE) --지점코드 FK
);
CREATE SEQUENCE STAFF_SEQ;
insert into staff values(staff_seq.nextval,'STF_KIM','011',sysdate,'kim.jpg','A',2);
insert into staff values(staff_seq.nextval,'STF_LEE','017',sysdate,'lee.jpg','B',2);
insert into staff values(staff_seq.nextval,'STF_MOON','019',sysdate,'moon.jpg','C',);


create table freeboard			--자유게시판
( 
	fb_num number(5) primary key,	--글번호 PK
	mem_num number(5) REFERENCES MEMBER(MEM_NUM),--작성자 FK
	fb_title varchar2(100),		--글제목
	fb_content varchar2(4000),		--글내용
	fb_date date,			--작성일
	fb_hit number(5),			--조회수
	fb_ref number(5),			--그룹번호
	fb_lef number(5),			--글레벨
	fb_step number(5)			--출력순서
);
CREATE SEQUENCE FREE_SEQ;

create table qnaboard			--QnA게시판
(
	qna_num number(5) primary key,	--글번호 PK
	mem_num number(5) REFERENCES MEMBER(MEM_NUM),--작성자(회원번호) FK
	qna_title varchar2(100),		--글제목
	qna_content varchar2(4000),		--글내용
	qna_date	date,			--작성일
	qna_hit number(5),			--조회수
	qna_ref number(5),		--그룹번호
	qna_lev number(5),		--글레벨
	qna_step number(5)		--출력순서
);
CREATE SEQUENCE QNA_SEQ;

create table mem_att			--회원출석
(	
	matt_num number(5) primary key, 	--회원출석번호PK
	matt_date date,			--출석일 
	mem_num number(5) REFERENCES MEMBER(MEM_NUM),--회원번호 FK	
	ct_code number(5) REFERENCES CENTER(CT_CODE) --지점코드 FK			--지점코드
);
CREATE SEQUENCE MATT_SEQ;

create table registration			--등록정보
(
	rg_num number(5) primary key,	--등록번호
	mem_num number(5) REFERENCES MEMBER(MEM_NUM),--회원번호 FK
	rg_type varchar2(20),		--등록종류
	rg_price number,		--등록가격
	locker_price number(30) DEFAULT 0,	--락커가격
	wear_price number(30) DEFAULT 0	--운동복가격
);
CREATE SEQUENCE REGI_SEQ;

create table trainer				--강사정보
(
	tr_num number(5) primary key,	--강사번호 PK
	stf_num number(5) REFERENCES STAFF(STF_NUM), --스태프번호 FK
	tr_career varchar2(4000),		--강사경력
	tr_intro varchar2(4000)		--강사소개
);
CREATE SEQUENCE TR_SEQ;

create table timetable			--강의시간
(
	tt_num number(5) primary key,	--시간번호 PK
	tt01 varchar2(50),			--1교시
	tt02 varchar2(50),			--2교시			
	tt03 varchar2(50),			--3교시
	tt04 varchar2(50),			--4교시
	tt05 varchar2(50),			--5교시
	tt06 varchar2(50)			--6교시
);
CREATE  SEQUENCE TT_SEQ;

create table pt_schedule				--PT스케줄
(
	pts_num number(5) primary key,	--PT스케줄번호 PK
	pts_start date,			--PT시작일
	pts_end date,			--PT만료일
	mem_num number(5) REFERENCES MEMBER(MEM_NUM), --회원번호FK
	tt_num number(5) REFERENCES TIMETABLE(TT_NUM), --시간번호FK
	tr_num number(5) REFERENCES TRAINER(TR_NUM), --강사번호FK
	ct_code number(5) REFERENCES CENTER(CT_CODE)  --지점코드FK
);
CREATE SEQUENCE PTS_SEQ;

create table pt_log				--운동일지
(
	ptl_num number(5) primary key,	--일지번호 PK
	ptl_content varchar2(4000),		--일지내용
	pts_num number(5) REFERENCES PT_SCHEDULE(PTS_NUM) --PT스케줄번호 FK
);
CREATE SEQUENCE PTL_SEQ;

create table medicalcheck			--의료정보
(
	md_num number(5) primary key,	--md번호 PK
	mem_num number(5) REFERENCES MEMBER(MEM_NUM), --회원번호 FK
	relative varchar2(50),   		-- 상대적정보
	absolute varchar2(50),		-- 절대적정보
	par_q varchar2(50)			-- 질문응답
);
CREATE SEQUENCE MD_SEQ;

create table sales				--매출
(	
	sal_num number(5) primary key,	--매출번호 PK
	sal_money number,		--매출금액	
	ct_code number(5)	REFERENCES CENTER(CT_CODE) --지점코드 FK
);
CREATE SEQUENCE SALES_SEQ;

create table stf_att				--직원출석
(
	Satt_num number(5) primary key, 	--직원출석번호PK
	satt_date date,			--출석일 
	stf_num number(5) REFERENCES STAFF(STF_NUM), --직원번호 FK
	ct_code number(5)			--지점코드
);
CREATE SEQUENCE SATT_SEQ;

create table payment			--월급
(
	pay_num number(5) primary key,	--월급번호 PK
	pay_tot number,		--월급합계
	pay_date date,			--지급날짜
	satt_num number(5) REFERENCES STF_ATT(SATT_NUM) --출석일 FK
);
CREATE SEQUENCE PAY_SEQ;

create table notice				--공지사항	
(
	nt_num number(5) primary key,	--글번호 PK
	stf_num number(5) REFERENCES STAFF(STF_NUM), --스태프 번호 FK
	nt_title varchar2(100),			--글제목
	nt_content varchar2(4000),		--글내용
	nt_date date,			--작성일
	nt_hit number(5)			--조회수
);
CREATE SEQUENCE NOTICE_SEQ;
insert into notice values(notice_seq.nextval,'1','공지사항입니다','겨울할인행사',sysdate,0);
insert into notice values(notice_seq.nextval,'2','공지사항입니다','운동복할인',sysdate,0);
insert into notice values(notice_seq.nextval,'3','공지사항입니다','락커룸할인',sysdate,0);


create table subject				--과목정보
(
	sb_code varchar2(20) primary key,	--과목코드 PK
	sb_name varchar2(20)		--과목이름
);

create table gx_schedule			--GX스케줄
(
	gx_num number(5) primary key,	--GX스케줄번호 PK
	sb_code varchar2(20) REFERENCES SUBJECT(SB_CODE), --과목코드 FK
	gx_start date,			--강의시작일
	gx_end date,			--강의만료일
	tt_num number(5) REFERENCES TIMETABLE(TT_NUM), --시간번호 FK
	tr_num number(5) REFERENCES TRAINER(TR_NUM), --강사번호 FK
	ct_code number(5) REFERENCES CENTER(CT_CODE) --지점코드 FK
);
CREATE SEQUENCE GX_SEQ;

create table event				--이벤트
(
	ev_num number(5) primary key,	--이벤트번호 PK
	ev_title varchar2(10),		--이벤트제목
	stf_num number(5) REFERENCES STAFF(STF_NUM), --이벤트작성자 FK
	ev_content varchar2(4000),		--이벤트내용
	re_writer varchar2(50),		--댓글작성자
	re_content varchar2(1000),		--댓글내용
	re_ref number(5),			--그룹번호
	re_step number(5)			--댓글출력순서
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
	ptr_num number(5) primary key, --회원등록넘버	
	tr_num number(5) REFERENCES TRAINER(TR_NUM), --트레이너 정보
	rg_num number(5) REFERENCES REGISTRATION(RG_NUM), --회원 정보
	ptr_initdate varchar2(50), --회원시작일
	ptr_time varchar2(50), --회원시간
	ptr_count number(3), --PT횟수
	ct_code number(5), --지점코드
	ptr_ok varchar2(15) DEFAULT '승인대기' CHECK ( PTR_OK IN ('승인','승인취소','승인대기')) --회원승인
);
CREATE SEQUENCE PTR_SEQ;

COMMIT;

create table gx_register
(
	gx_num number(5) primary key, --회원등록넘버		
	ct_code number(5), --지점코드
	gx_exercise varchar2(20), -- gx운동
	gx_day varchar2(50), -- 월수금/화목
	gx_time varchar2(50), -- 시간
	rg_num number(5) REFERENCES REGISTRATION(RG_NUM) --회원 정보
);
commit;

CREATE SEQUENCE GX_SEQ;

--------------------------------------------------------
--제약조건 추가줄때 옵션 예)
--ALTER TABLE GROUPS
--ADD CONSTRAINTS FK_GROUPS_LEADER FOREIGN KEY(id)
--REFERENCES MEMBER(ID);
--DEFAULT : 값을 지정하지않으면 저절로 값이 들어가게 하는 것
--CHECK : 조건에 맞는 데이터만 입력되도록 조건을 부여한 제약조건(예, 점수에 해당되는 컬럼을 저장할 때 최대점수가 100점이면, 100점보다 많은 데이터는 입력 못하도록 조건을 걸어놈 또는 성별의 경우엔 남과 여만 입력이 가능하도록 함.)
