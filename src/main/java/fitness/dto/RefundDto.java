package fitness.dto;

import java.sql.Date;

public class RefundDto {
	private int rf_num;
	private String rg_numlist;
	private Date rf_left;
	private int ptrefund;
	private int gxrefund;
	
	public RefundDto() {}

	public RefundDto(int rf_num, String rg_numlist, Date rf_left, int ptrefund, int gxrefund) {
		super();
		this.rf_num = rf_num;
		this.rg_numlist = rg_numlist;
		this.rf_left = rf_left;
		this.ptrefund = ptrefund;
		this.gxrefund = gxrefund;
	}

	public int getRf_num() {
		return rf_num;
	}

	public void setRf_num(int rf_num) {
		this.rf_num = rf_num;
	}

	public String getRg_numlist() {
		return rg_numlist;
	}

	public void setRg_numlist(String rg_numlist) {
		this.rg_numlist = rg_numlist;
	}

	public Date getRf_left() {
		return rf_left;
	}

	public void setRf_left(Date rf_left) {
		this.rf_left = rf_left;
	}

	public int getPtrefund() {
		return ptrefund;
	}

	public void setPtrefund(int ptrefund) {
		this.ptrefund = ptrefund;
	}

	public int getGxrefund() {
		return gxrefund;
	}

	public void setGxrefund(int gxrefund) {
		this.gxrefund = gxrefund;
	}

	@Override
	public String toString() {
		return "RefundDto [rf_num=" + rf_num + ", rg_numlist=" + rg_numlist + ", rf_left=" + rf_left + ", ptrefund="
				+ ptrefund + ", gxrefund=" + gxrefund + "]";
	}
	
	
	
	
	
	
	
	
}
