package fitness.dto;

import java.sql.Date;

public class AttListDto {
	private int num;
	private String name;
	private int reg_code;
	private int ct_code;
	private Date att_date;
	public AttListDto(){}
	public AttListDto(int num, String name, int reg_code, int ct_code, Date att_date) {
		super();
		this.num = num;
		this.name = name;
		this.reg_code = reg_code;
		this.ct_code = ct_code;
		this.att_date = att_date;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getReg_code() {
		return reg_code;
	}
	public void setReg_code(int reg_code) {
		this.reg_code = reg_code;
	}
	public int getCt_code() {
		return ct_code;
	}
	public void setCt_code(int ct_code) {
		this.ct_code = ct_code;
	}
	public Date getAtt_date() {
		return att_date;
	}
	public void setAtt_date(Date att_date) {
		this.att_date = att_date;
	}
	@Override
	public String toString() {
		return "AttListDto [num=" + num + ", name=" + name + ", reg_code=" + reg_code + ", ct_code=" + ct_code
				+ ", att_date=" + att_date + "]";
	}
	
	
}
