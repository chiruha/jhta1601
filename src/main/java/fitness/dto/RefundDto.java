package fitness.dto;

import java.sql.Date;

public class RefundDto {
	private int rf_num;
	private int rg_num;
	private Date rf_left;
	private int pri_num;
	public RefundDto() {}
	public RefundDto(int rf_num, int rg_num, Date rf_left, int pri_num) {
		super();
		this.rf_num = rf_num;
		this.rg_num = rg_num;
		this.rf_left = rf_left;
		this.pri_num = pri_num;
	}
	public int getRf_num() {
		return rf_num;
	}
	public void setRf_num(int rf_num) {
		this.rf_num = rf_num;
	}
	public int getRg_num() {
		return rg_num;
	}
	public void setRg_num(int rg_num) {
		this.rg_num = rg_num;
	}
	public Date getRf_left() {
		return rf_left;
	}
	public void setRf_left(Date rf_left) {
		this.rf_left = rf_left;
	}
	public int getPri_num() {
		return pri_num;
	}
	public void setPri_num(int pri_num) {
		this.pri_num = pri_num;
	}
	@Override
	public String toString() {
		return "RefundDto [rf_num=" + rf_num + ", rg_num=" + rg_num + ", rf_left=" + rf_left + ", pri_num=" + pri_num
				+ "]";
	}
	
}
