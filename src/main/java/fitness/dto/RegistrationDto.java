package fitness.dto;

public class RegistrationDto {
	private  int rg_num;
	private int mem_num;
	private String rg_type;//�������(1.�ܰ�����, 2.PT, 3.��������)
	private int rg_price;//���α׷�����
	private int locker_price;//��ī����
	private int wear_price;//�������
	private String mem_name;
	public RegistrationDto() {}
	
	public RegistrationDto(int rg_num, int mem_num, String rg_type, int rg_price, int locker_price, int wear_price,
			String mem_name) {
		super();
		this.rg_num = rg_num;
		this.mem_num = mem_num;
		this.rg_type = rg_type;
		this.rg_price = rg_price;
		this.locker_price = locker_price;
		this.wear_price = wear_price;
		this.mem_name = mem_name;
	}

	public RegistrationDto(int rg_num, int mem_num, String rg_type, int rg_price, int locker_price, int wear_price) {
		super();
		this.rg_num = rg_num;
		this.mem_num = mem_num;
		this.rg_type = rg_type;
		this.rg_price = rg_price;
		this.locker_price = locker_price;
		this.wear_price = wear_price;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
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
