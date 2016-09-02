package fitness.dto;

import java.sql.Date;

public class NoticeDto {
	private int nt_num;
	private int stf_num;
	private String nt_title;
	private String nt_content;
	private Date nt_date;
	private int nt_hit;
	private String stf_name;
	
	public NoticeDto(){}

	@Override
	public String toString() {
		return "NoticeDto [nt_num=" + nt_num + ", stf_num=" + stf_num + ", nt_title=" + nt_title + ", nt_content="
				+ nt_content + ", nt_date=" + nt_date + ", nt_hit=" + nt_hit + ", stf_name=" + stf_name + "]";
	}

	public NoticeDto(int nt_num, int stf_num, String nt_title, String nt_content, Date nt_date, int nt_hit,
			String stf_name) {
		super();
		this.nt_num = nt_num;
		this.stf_num = stf_num;
		this.nt_title = nt_title;
		this.nt_content = nt_content;
		this.nt_date = nt_date;
		this.nt_hit = nt_hit;
		this.stf_name = stf_name;
	}

	public int getNt_num() {
		return nt_num;
	}

	public void setNt_num(int nt_num) {
		this.nt_num = nt_num;
	}

	public int getStf_num() {
		return stf_num;
	}

	public void setStf_num(int stf_num) {
		this.stf_num = stf_num;
	}

	public String getNt_title() {
		return nt_title;
	}

	public void setNt_title(String nt_title) {
		this.nt_title = nt_title;
	}

	public String getNt_content() {
		return nt_content;
	}

	public void setNt_content(String nt_content) {
		this.nt_content = nt_content;
	}

	public Date getNt_date() {
		return nt_date;
	}

	public void setNt_date(Date nt_date) {
		this.nt_date = nt_date;
	}

	public int getNt_hit() {
		return nt_hit;
	}

	public void setNt_hit(int nt_hit) {
		this.nt_hit = nt_hit;
	}

	public String getStf_name() {
		return stf_name;
	}

	public void setStf_name(String stf_name) {
		this.stf_name = stf_name;
	}

}