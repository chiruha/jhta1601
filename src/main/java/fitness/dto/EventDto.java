package fitness.dto;

import java.sql.Date;

public class EventDto {
	private int ev_num;//이벤트번호
	private String ev_title;//이벤트제목
	private String ev_picture;//이벤트사진
	private String ev_content;//이벤트내용
	private int stf_num;//이벤트작성자(직원만)
	private Date ev_date;//작성일
	
	public EventDto() {}

	public EventDto(int ev_num, String ev_title, String ev_picture, String ev_content, int stf_num, Date ev_date) {
		super();
		this.ev_num = ev_num;
		this.ev_title = ev_title;
		this.ev_picture = ev_picture;
		this.ev_content = ev_content;
		this.stf_num = stf_num;
		this.ev_date = ev_date;
	}

	public int getEv_num() {
		return ev_num;
	}

	public void setEv_num(int ev_num) {
		this.ev_num = ev_num;
	}

	public String getEv_title() {
		return ev_title;
	}

	public void setEv_title(String ev_title) {
		this.ev_title = ev_title;
	}

	public String getEv_picture() {
		return ev_picture;
	}

	public void setEv_picture(String ev_picture) {
		this.ev_picture = ev_picture;
	}

	public String getEv_content() {
		return ev_content;
	}

	public void setEv_content(String ev_content) {
		this.ev_content = ev_content;
	}

	public int getStf_num() {
		return stf_num;
	}

	public void setStf_num(int stf_num) {
		this.stf_num = stf_num;
	}

	public Date getEv_date() {
		return ev_date;
	}

	public void setEv_date(Date ev_date) {
		this.ev_date = ev_date;
	}

	@Override
	public String toString() {
		return "EventDto [ev_num=" + ev_num + ", ev_title=" + ev_title + ", ev_picture=" + ev_picture + ", ev_content="
				+ ev_content + ", stf_num=" + stf_num + ", ev_date=" + ev_date + "]";
	}
	
}
/*
create table event(
	ev_num number(20) primary key,
	ev_title varchar2(20),
	ev_picture varchar2(1000) not null,
	ev_content varchar2(4000),
	stf_num number(20) REFERENCES STAFF(STF_NUM), --이벤트작성자 FK
	ev_date date not null
);
CREATE SEQUENCE EVENT_SEQ; 
 */ 
