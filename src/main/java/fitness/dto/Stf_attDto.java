package fitness.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class Stf_attDto {
	private int satt_num;
	private Timestamp in_date;
	private Timestamp out_date;
	private int work_time;
	private int stf_num;
	private String stf_name;
	private String stf_phone;
	private int reg_code;
	private String reg_name;
	private int ct_code;
	private String ct_name;
	public Stf_attDto() {	}

	public Stf_attDto(int satt_num, Timestamp in_date, Timestamp out_date, int work_time, int stf_num, String stf_name,
			String stf_phone, int reg_code, String reg_name, int ct_code, String ct_name) {
		super();
		this.satt_num = satt_num;
		this.in_date = in_date;
		this.out_date = out_date;
		this.work_time = work_time;
		this.stf_num = stf_num;
		this.stf_name = stf_name;
		this.stf_phone = stf_phone;
		this.reg_code = reg_code;
		this.reg_name = reg_name;
		this.ct_code = ct_code;
		this.ct_name = ct_name;
	}

	public int getSatt_num() {
		return satt_num;
	}

	public void setSatt_num(int satt_num) {
		this.satt_num = satt_num;
	}

	public Timestamp getIn_date() {
		return in_date;
	}

	public void setIn_date(Timestamp in_date) {
		this.in_date = in_date;
	}

	public Timestamp getOut_date() {
		return out_date;
	}

	public void setOut_date(Timestamp out_date) {
		this.out_date = out_date;
	}

	public int getWork_time() {
		return work_time;
	}

	public void setWork_time(int work_time) {
		this.work_time = work_time;
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

	public int getReg_code() {
		return reg_code;
	}

	public void setReg_code(int reg_code) {
		this.reg_code = reg_code;
	}

	public String getReg_name() {
		return reg_name;
	}

	public void setReg_name(String reg_name) {
		this.reg_name = reg_name;
	}

	public int getCt_code() {
		return ct_code;
	}

	public void setCt_code(int ct_code) {
		this.ct_code = ct_code;
	}

	public String getCt_name() {
		return ct_name;
	}

	public void setCt_name(String ct_name) {
		this.ct_name = ct_name;
	}

	@Override
	public String toString() {
		return "Stf_attDto [satt_num=" + satt_num + ", in_date=" + in_date + ", out_date=" + out_date + ", work_time="
				+ work_time + ", stf_num=" + stf_num + ", stf_name=" + stf_name + ", stf_phone=" + stf_phone
				+ ", reg_code=" + reg_code + ", reg_name=" + reg_name + ", ct_code=" + ct_code + ", ct_name=" + ct_name
				+ "]";
	}

	
	
}
