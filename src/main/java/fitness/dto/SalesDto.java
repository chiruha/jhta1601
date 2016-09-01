package fitness.dto;

public class SalesDto {
	private int sal_num;
	private int sal_money;
	private int ct_code;
	public SalesDto() {}
	public SalesDto(int sal_num, int sal_money, int ct_code) {
		super();
		this.sal_num = sal_num;
		this.sal_money = sal_money;
		this.ct_code = ct_code;
	}
	public int getSal_num() {
		return sal_num;
	}
	public void setSal_num(int sal_num) {
		this.sal_num = sal_num;
	}
	public int getSal_money() {
		return sal_money;
	}
	public void setSal_money(int sal_money) {
		this.sal_money = sal_money;
	}
	public int getCt_code() {
		return ct_code;
	}
	public void setCt_code(int ct_code) {
		this.ct_code = ct_code;
	}
	@Override
	public String toString() {
		return "\n SalesDto [sal_num=" + sal_num + ", sal_money=" + sal_money + ", ct_code=" + ct_code + "]";
	}
	
}
