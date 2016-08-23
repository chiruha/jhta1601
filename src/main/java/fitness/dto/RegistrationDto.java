package fitness.dto;

public class RegistrationDto {
	private  int rg_num;
	private int mem_num;
	private String rg_type;
	private int rg_price;
	private int locker_price;
	private int wear_price;
	public RegistrationDto() {	}
	public RegistrationDto(int rg_num, int mem_num, String rg_type, int rg_price, int locker_price, int wear_price) {
		super();
		this.rg_num = rg_num;
		this.mem_num = mem_num;
		this.rg_type = rg_type;
		this.rg_price = rg_price;
		this.locker_price = locker_price;
		this.wear_price = wear_price;
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
	@Override
	public String toString() {
		return "RegistrationDto [rg_num=" + rg_num + ", mem_num=" + mem_num + ", rg_type=" + rg_type + ", rg_price="
				+ rg_price + ", locker_price=" + locker_price + ", wear_price=" + wear_price + "]";
	}
	
}
