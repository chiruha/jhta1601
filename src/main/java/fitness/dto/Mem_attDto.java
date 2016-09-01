package fitness.dto;

import java.sql.Date;

public class Mem_attDto {
	private int matt_num;
	private Date matt_date;
	private int mem_num;
	private int ct_code;
	public Mem_attDto() {}
	public Mem_attDto(int matt_num, Date matt_date, int mem_num, int ct_code) {
		super();
		this.matt_num = matt_num;
		this.matt_date = matt_date;
		this.mem_num = mem_num;
		this.ct_code = ct_code;
	}
	public int getMatt_num() {
		return matt_num;
	}
	public void setMatt_num(int matt_num) {
		this.matt_num = matt_num;
	}
	public Date getMatt_date() {
		return matt_date;
	}
	public void setMatt_date(Date matt_date) {
		this.matt_date = matt_date;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getCt_code() {
		return ct_code;
	}
	public void setCt_code(int ct_code) {
		this.ct_code = ct_code;
	}
	@Override
	public String toString() {
		return "\n Mem_attDto [matt_num=" + matt_num + ", matt_date=" + matt_date + ", mem_num=" + mem_num + ", ct_code="
				+ ct_code + "]";
	}
	
}
