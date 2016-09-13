package fitness.dto;

import java.sql.Date;

public class Stf_attDto {
	private int satt_num;
	private Date satt_date;
	private int stf_num;
	private int ct_code;
	public Stf_attDto() {	}
	public Stf_attDto(int satt_num, Date satt_date, int stf_num, int ct_code) {
		super();
		this.satt_num = satt_num;
		this.satt_date = satt_date;
		this.stf_num = stf_num;
		this.ct_code = ct_code;
	}
	public int getSatt_num() {
		return satt_num;
	}
	public void setSatt_num(int satt_num) {
		this.satt_num = satt_num;
	}
	public Date getSatt_date() {
		return satt_date;
	}
	public void setSatt_date(Date satt_date) {
		this.satt_date = satt_date;
	}
	public int getStf_num() {
		return stf_num;
	}
	public void setStf_num(int stf_num) {
		this.stf_num = stf_num;
	}
	public int getCt_code() {
		return ct_code;
	}
	public void setCt_code(int ct_code) {
		this.ct_code = ct_code;
	}
	@Override
	public String toString() {
		return "Stf_attDto [satt_num=" + satt_num + ", satt_date=" + satt_date + ", stf_num=" + stf_num + ", ct_code="
				+ ct_code + "]";
	}
	
	
}
