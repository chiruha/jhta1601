package fitness.dto;

import java.sql.Date;

public class EventCommentsDto {
	private int comm_num;//코멘트번호
	private int ev_num;//이벤트번호 REFERENCES event(ev_num) --FK
	private int mem_num;//회원이름 REFERENCES member(mem_num) --FK
	private String comments;//코멘트내용
	private Date comm_date;//작성일
	private int comm_ref;
	private int comm_lev;
	private int comm_step;
	
	public EventCommentsDto(){}

	public EventCommentsDto(int comm_num, int ev_num, int mem_num, String comments, Date comm_date, int comm_ref,
			int comm_lev, int comm_step) {
		super();
		this.comm_num = comm_num;
		this.ev_num = ev_num;
		this.mem_num = mem_num;
		this.comments = comments;
		this.comm_date = comm_date;
		this.comm_ref = comm_ref;
		this.comm_lev = comm_lev;
		this.comm_step = comm_step;
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

	public Date getComm_date() {
		return comm_date;
	}

	public void setComm_date(Date comm_date) {
		this.comm_date = comm_date;
	}

	public int getComm_ref() {
		return comm_ref;
	}

	public void setComm_ref(int comm_ref) {
		this.comm_ref = comm_ref;
	}

	public int getComm_lev() {
		return comm_lev;
	}

	public void setComm_lev(int comm_lev) {
		this.comm_lev = comm_lev;
	}

	public int getComm_step() {
		return comm_step;
	}

	public void setComm_step(int comm_step) {
		this.comm_step = comm_step;
	}

	@Override
	public String toString() {
		return "EventCommentsDto [comm_num=" + comm_num + ", ev_num=" + ev_num + ", mem_num=" + mem_num + ", comments="
				+ comments + ", comm_date=" + comm_date + ", comm_ref=" + comm_ref + ", comm_lev=" + comm_lev
				+ ", comm_step=" + comm_step + "]";
	}
	
}
