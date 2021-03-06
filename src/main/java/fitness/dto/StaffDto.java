package fitness.dto;

import java.sql.Date;

public class StaffDto {
	private int stf_num;
	private String stf_name;
	private String stf_phone;
	private Date stf_date;
	private String stf_picture;
	private String pos_code;
	private String pos_name;
	private int ct_code;
	private String ct_name;
	public StaffDto() {}

	
	public StaffDto(int stf_num, String stf_name, String stf_phone, Date stf_date, String stf_picture, String pos_code,
			String pos_name, int ct_code, String ct_name) {
		super();
		this.stf_num = stf_num;
		this.stf_name = stf_name;
		this.stf_phone = stf_phone;
		this.stf_date = stf_date;
		this.stf_picture = stf_picture;
		this.pos_code = pos_code;
		this.pos_name = pos_name;
		this.ct_code = ct_code;
		this.ct_name = ct_name;
	}


	public StaffDto(int stf_num, String stf_name, String stf_phone, Date stf_date, String stf_picture, String pos_code,
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

	public String getPos_name() {
		return pos_name;
	}


	public void setPos_name(String pos_name) {
		this.pos_name = pos_name;
	}


	public String getCt_name() {
		return ct_name;
	}


	public void setCt_name(String ct_name) {
		this.ct_name = ct_name;
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
		return "\n StaffDto [stf_num=" + stf_num + ", stf_name=" + stf_name + ", stf_phone=" + stf_phone + ", stf_date="
				+ stf_date + ", stf_picture=" + stf_picture + ", pos_code=" + pos_code + ", ct_code=" + ct_code + "]";
	}
	
	
}
