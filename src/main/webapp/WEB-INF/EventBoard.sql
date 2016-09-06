drop sequence eventcomm_seq;
drop sequence event_seq;
drop table eventcomments;
drop table event;

create table event(
	ev_num number(20) primary key, --�̺�Ʈ��ȣ
	ev_title varchar2(20), --�̺�Ʈ����
	ev_picture varchar2(1000) not null, --�̺�Ʈ����
	ev_content varchar2(4000), --�̺�Ʈ����
	stf_num number(20) REFERENCES STAFF(STF_NUM), --�̺�Ʈ�ۼ��� FK
	ev_date date not null --�̺�Ʈ�ۼ���
);
CREATE SEQUENCE EVENT_SEQ; 

create table EventComments
(
 comm_num number(20) primary key, --�ڸ�Ʈ��ȣ
 ev_num number(20) references event(ev_num), --�̺�Ʈ��ȣFK
 mem_num number(20) references member(mem_num), --����ۼ���FK
 comments varchar2(100), --��۳���
 comm_date date --����ۼ���
);
CREATE SEQUENCE eventcomm_SEQ;