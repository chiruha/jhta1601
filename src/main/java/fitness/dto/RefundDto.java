package fitness.dto;



public class RefundDto {
	private int refund_num;
	private int mem_num;
	private int refund_date;
	private int rg_num;
	private int ct_code;
	private String rg_type;
	private int refund_price;
	
	public RefundDto() {}

	public RefundDto(int refund_num, int mem_num, int refund_date, int rg_num, int ct_code, String rg_type,
			int refund_price) {
		super();
		this.refund_num = refund_num;
		this.mem_num = mem_num;
		this.refund_date = refund_date;
		this.rg_num = rg_num;
		this.ct_code = ct_code;
		this.rg_type = rg_type;
		this.refund_price = refund_price;
	}

	public int getRefund_num() {
		return refund_num;
	}

	public void setRefund_num(int refund_num) {
		this.refund_num = refund_num;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public int getRefund_date() {
		return refund_date;
	}

	public void setRefund_date(int refund_date) {
		this.refund_date = refund_date;
	}

	public int getRg_num() {
		return rg_num;
	}

	public void setRg_num(int rg_num) {
		this.rg_num = rg_num;
	}

	public int getCt_code() {
		return ct_code;
	}

	public void setCt_code(int ct_code) {
		this.ct_code = ct_code;
	}

	public String getRg_type() {
		return rg_type;
	}

	public void setRg_type(String rg_type) {
		this.rg_type = rg_type;
	}

	public int getRefund_price() {
		return refund_price;
	}

	public void setRefund_price(int refund_price) {
		this.refund_price = refund_price;
	}

	@Override
	public String toString() {
		return "RefundDto [refund_num=" + refund_num + ", mem_num=" + mem_num + ", refund_date=" + refund_date
				+ ", rg_num=" + rg_num + ", ct_code=" + ct_code + ", rg_type=" + rg_type + ", refund_price="
				+ refund_price + "]";
	}
	
	

}
