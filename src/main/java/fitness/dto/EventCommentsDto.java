package fitness.dto;

import com.sun.jmx.snmp.Timestamp;

public class EventCommentsDto {
	private int comm_num;//코멘트번호
	private int ev_num;//이벤트번호 REFERENCES event(ev_num) --FK
	private int mem_num;//회원이름 REFERENCES member(mem_num) --FK
	private String comments;//코멘트내용
	private Timestamp comm_date;//작성일
	
	public EventCommentsDto(){}

	public EventCommentsDto(int comm_num, int ev_num, int mem_num, String comments, Timestamp comm_date) {
		super();
		this.comm_num = comm_num;
		this.ev_num = ev_num;
		this.mem_num = mem_num;
		this.comments = comments;
		this.comm_date = comm_date;
	}

	public int getComm_num() {
		return comm_num;
	}

	public void setComm_num(int comm_num) {
		this.comm_num = comm_num;
	}

	public int getEv_num() {
		return ev_num;
	}

	public void setEv_num(int ev_num) {
		this.ev_num = ev_num;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Timestamp getComm_date() {
		return comm_date;
	}

	public void setComm_date(Timestamp comm_date) {
		this.comm_date = comm_date;
	}

	@Override
	public String toString() {
		return "EventCommentsDto [comm_num=" + comm_num + ", ev_num=" + ev_num + ", mem_num=" + mem_num + ", comments="
				+ comments + ", comm_date=" + comm_date + "]";
	}
	
/*
create table EventComments
(
 comm_num number(20) primary key,
 ev_num number(20) references event(ev_num),
 mem_num number(20) references member(mem_num),
 comments varchar2(100),
 comm_date date
);
CREATE SEQUENCE eventcomm_SEQ;

*/
}
