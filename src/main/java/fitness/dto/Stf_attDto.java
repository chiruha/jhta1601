package fitness.dto;

import java.sql.Date;

public class Stf_attDto {
	private int stf_num;
	private String stf_name;
	private String stf_phone;
	private Date stf_date;
	private String stf_picture;
	private String pos_code;
	private int ct_code;
	public Stf_attDto() {	}
	public Stf_attDto(int stf_num, String stf_name, String stf_phone, Date stf_date, String stf_picture, String pos_code,
			int ct_code) {
		super();
		this.stf_num = stf_num;
		this.stf_name = stf_name;
		this.stf_phone = stf_phone;
		this.stf_date = stf_date;
		this.stf_picture = stf_picture;
		this.pos_code = pos_code;
		this.ct_code = ct_code;
	}
	public int getStf_num() {
		return stf_num;
	}
	public void setStf_num(int stf_num) {
		this.stf_num = stf_num;
	}
	public String getStf_name() {
		return stf_name;
	}
	public void setStf_name(String stf_name) {
		this.stf_name = stf_name;
	}
	public String getStf_phone() {
		return stf_phone;
	}
	public void setStf_phone(String stf_phone) {
		this.stf_phone = stf_phone;
	}
	public Date getStf_date() {
		return stf_date;
	}
	public void setStf_date(Date stf_date) {
		this.stf_date = stf_date;
	}
	public String getStf_picture() {
		return stf_picture;
	}
	public void setStf_picture(String stf_picture) {
		this.stf_picture = stf_picture;
	}
	public String getPos_code() {
		return pos_code;
	}
	public void setPos_code(String pos_code) {
		this.pos_code = pos_code;
	}
	public int getCt_code() {
		return ct_code;
	}
	public void setCt_code(int ct_code) {
		this.ct_code = ct_code;
	}
	@Override
	public String toString() {
		return "\n Stf_attDto [stf_num=" + stf_num + ", stf_name=" + stf_name + ", stf_phone=" + stf_phone + ", stf_date="
				+ stf_date + ", stf_picture=" + stf_picture + ", pos_code=" + pos_code + ", ct_code=" + ct_code + "]";
	}
	
	
}
