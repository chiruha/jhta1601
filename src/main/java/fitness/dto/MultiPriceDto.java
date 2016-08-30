package fitness.dto;
/*
 PT + �ｺ = (�ｺ����ڵ� * 0.1%) + PT����ڵ�
 PT + GX = (GX����ڵ�  * 0.1%) + PT����ڵ�
 PT + �ｺ + GX = {(�ｺ + GX����ڵ�) * 0.1%} + PT����ڵ�  
 */
public class MultiPriceDto {
	private String pro_code; //���α׷��ڵ�
	private int pro_price;//���α׷�����
	private String pt_code;//pt���α׷� �ڵ�
	private int pt_price;//pt����
	
	public MultiPriceDto() {}

	public MultiPriceDto(String pro_code, int pro_price, String pt_code, int pt_price) {
		super();
		this.pro_code = pro_code;
		this.pro_price = pro_price;
		this.pt_code = pt_code;
		this.pt_price = pt_price;
	}

	public String getPro_code() {
		return pro_code;
	}

	public void setPro_code(String pro_code) {
		this.pro_code = pro_code;
	}

	public int getPro_price() {
		return pro_price;
	}

	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}

	public String getPt_code() {
		return pt_code;
	}

	public void setPt_code(String pt_code) {
		this.pt_code = pt_code;
	}

	public int getPt_price() {
		return pt_price;
	}

	public void setPt_price(int pt_price) {
		this.pt_price = pt_price;
	}
	
	
}
