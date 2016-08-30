package fitness.dto;
/*
 PT + 헬스 = (헬스등록코드 * 0.1%) + PT등록코드
 PT + GX = (GX등록코드  * 0.1%) + PT등록코드
 PT + 헬스 + GX = {(헬스 + GX등록코드) * 0.1%} + PT등록코드  
 */
public class MultiPriceDto {
	private String pro_code; //프로그램코드
	private int pro_price;//프로그램가격
	private String pt_code;//pt프로그램 코드
	private int pt_price;//pt가격
	
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
