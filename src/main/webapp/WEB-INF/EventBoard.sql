drop sequence eventcomm_seq;
drop sequence event_seq;
drop table eventcomments;
drop table event;

create table event(
	ev_num number(20) primary key, --이벤트번호
	ev_title varchar2(20), --이벤트제목
	ev_picture varchar2(1000) not null, --이벤트사진
	ev_content varchar2(4000), --이벤트내용
	stf_num number(20) REFERENCES STAFF(STF_NUM), --이벤트작성자 FK
	ev_date date not null --이벤트작성일
);
CREATE SEQUENCE EVENT_SEQ; 

create table EventComments
(
 comm_num number(20) primary key, --코멘트번호
 ev_num number(20) references event(ev_num), --이벤트번호FK
 mem_num number(20) references member(mem_num), --댓글작성자FK
 comments varchar2(100), --댓글내용
 comm_date date --댓글작성일
);
CREATE SEQUENCE eventcomm_SEQ;