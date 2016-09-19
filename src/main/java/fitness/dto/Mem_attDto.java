package fitness.dto;

import java.sql.Timestamp;

public class Mem_attDto {
	private int matt_num;
	private Timestamp in_date;
	private Timestamp out_date;
	private int x_time;
	private int mem_num;
	private String mem_name;
	private String mem_phone;
	private int reg_code;
	private String reg_name;
	private int ct_code;
	private String ct_name;
	public Mem_attDto() {}
	public Mem_attDto(int matt_num, Timestamp in_date, Timestamp out_date, int x_time, int mem_num, String mem_name,
			String mem_phone, int reg_code, String reg_name, int ct_code, String ct_name) {
		super();
		this.matt_num = matt_num;
		this.in_date = in_date;
		this.out_date = out_date;
		this.x_time = x_time;
		this.mem_num = mem_num;
		this.mem_name = mem_name;
		this.mem_phone = mem_phone;
		this.reg_code = reg_code;
		this.reg_name = reg_name;
		this.ct_code = ct_code;
		this.ct_name = ct_name;
	}
	public int getMatt_num() {
		return matt_num;
	}
	public void setMatt_num(int matt_num) {
		this.matt_num = matt_num;
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
	public int getX_time() {
		return x_time;
	}
	public void setX_time(int x_time) {
		this.x_time = x_time;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
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
		return "Mem_attDto [matt_num=" + matt_num + ", in_date=" + in_date + ", out_date=" + out_date + ", x_time="
				+ x_time + ", mem_num=" + mem_num + ", mem_name=" + mem_name + ", mem_phone=" + mem_phone
				+ ", reg_code=" + reg_code + ", reg_name=" + reg_name + ", ct_code=" + ct_code + ", ct_name=" + ct_name
				+ "]";
	}
	
	
}
