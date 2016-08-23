package fitness.dto;

import java.sql.Date;

public class MemberDto {
	private int mem_num;
	private String mem_name;
	private String mem_phone;
	private String mem_addr;
	private String mem_email;
	private int mem_age;
	private String mem_gen;
	private String mem_birth;
	private Date regdate;
	private String mem_picture;
	private int ct_code;
	
	public MemberDto() {}

	public MemberDto(int mem_num, String mem_name, String mem_phone, String mem_addr, String mem_email, int mem_age,
			String mem_gen, String mem_birth, Date regdate, String mem_picture, int ct_code) {
		super();
		this.mem_num = mem_num;
		this.mem_name = mem_name;
		this.mem_phone = mem_phone;
		this.mem_addr = mem_addr;
		this.mem_email = mem_email;
		this.mem_age = mem_age;
		this.mem_gen = mem_gen;
		this.mem_birth = mem_birth;
		this.regdate = regdate;
		this.mem_picture = mem_picture;
		this.ct_code = ct_code;
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

	public String getMem_addr() {
		return mem_addr;
	}

	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public int getMem_age() {
		return mem_age;
	}

	public void setMem_age(int mem_age) {
		this.mem_age = mem_age;
	}

	public String getMem_gen() {
		return mem_gen;
	}

	public void setMem_gen(String mem_gen) {
		this.mem_gen = mem_gen;
	}

	public String getMem_birth() {
		return mem_birth;
	}

	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getMem_picture() {
		return mem_picture;
	}

	public void setMem_picture(String mem_picture) {
		this.mem_picture = mem_picture;
	}

	public int getCt_code() {
		return ct_code;
	}

	public void setCt_code(int ct_code) {
		this.ct_code = ct_code;
	}

	@Override
	public String toString() {
		return "MemberDto [mem_num=" + mem_num + ", mem_name=" + mem_name + ", mem_phone=" + mem_phone + ", mem_addr="
				+ mem_addr + ", mem_email=" + mem_email + ", mem_age=" + mem_age + ", mem_gen=" + mem_gen
				+ ", mem_birth=" + mem_birth + ", regdate=" + regdate + ", mem_picture=" + mem_picture + ", ct_code="
				+ ct_code + "]";
	}
	
	
}
