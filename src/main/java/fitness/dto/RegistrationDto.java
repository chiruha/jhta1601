package fitness.dto;

import java.sql.Date;

public class RegistrationDto {
	private  int rg_num;
	private int mem_num;
	private String rg_type;//등록유형(1.단과과목, 2.PT, 3.여러과목)
	private int rg_price;//프로그램가격
	private int locker_price;//락카가격
	private int wear_price;//운동복가격
	private Date signdate;//프로그램등록날짜(환불계산 시 필요)
	
	public RegistrationDto() {}
	
	public RegistrationDto(int rg_num, int mem_num, String rg_type, int rg_price, int locker_price, int wear_price,
			Date signdate) {
		super();
		this.rg_num = rg_num;
		this.mem_num = mem_num;
		this.rg_type = rg_type;
		this.rg_price = rg_price;
		this.locker_price = locker_price;
		this.wear_price = wear_price;
		this.signdate = signdate;
	}

	@Override
	public String toString() {
		return "RegistrationDto [rg_num=" + rg_num + ", mem_num=" + mem_num + ", rg_type=" + rg_type + ", rg_price="
				+ rg_price + ", locker_price=" + locker_price + ", wear_price=" + wear_price + ", signdate=" + signdate
				+ "]";
	}

	public int getRg_num() {
		return rg_num;
	}

	public void setRg_num(int rg_num) {
		this.rg_num = rg_num;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public String getRg_type() {
		return rg_type;
	}

	public void setRg_type(String rg_type) {
		this.rg_type = rg_type;
	}

	public int getRg_price() {
		return rg_price;
	}

	public void setRg_price(int rg_price) {
		this.rg_price = rg_price;
	}

	public int getLocker_price() {
		return locker_price;
	}

	public void setLocker_price(int locker_price) {
		this.locker_price = locker_price;
	}

	public int getWear_price() {
		return wear_price;
	}

	public void setWear_price(int wear_price) {
		this.wear_price = wear_price;
	}

	public Date getSigndate() {
		return signdate;
	}

	public void setSigndate(Date signdate) {
		this.signdate = signdate;
	}
	
	
}
