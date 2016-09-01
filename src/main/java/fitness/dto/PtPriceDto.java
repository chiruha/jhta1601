package fitness.dto;

public class PtPriceDto {
	private int pt_num;//pt프로그램 번호
	private String pt_code;//pt프로그램 코드
	private String pt_month;//등록개월 및 주 몇회
	private int ptr_count;//pt횟수
	private int pt_signmonth;//pt등록개월 수
	private int pt_price;//pt가격
	
	public PtPriceDto(){}

	public PtPriceDto(int pt_num, String pt_code, String pt_month, int ptr_count, int pt_signmonth, int pt_price) {
		super();
		this.pt_num = pt_num;
		this.pt_code = pt_code;
		this.pt_month = pt_month;
		this.ptr_count = ptr_count;
		this.pt_signmonth = pt_signmonth;
		this.pt_price = pt_price;
	}

	public int getPt_num() {
		return pt_num;
	}

	public void setPt_num(int pt_num) {
		this.pt_num = pt_num;
	}

	public String getPt_code() {
		return pt_code;
	}

	public void setPt_code(String pt_code) {
		this.pt_code = pt_code;
	}

	public String getPt_month() {
		return pt_month;
	}

	public void setPt_month(String pt_month) {
		this.pt_month = pt_month;
	}

	public int getPtr_count() {
		return ptr_count;
	}

	public void setPtr_count(int ptr_count) {
		this.ptr_count = ptr_count;
	}

	public int getPt_signmonth() {
		return pt_signmonth;
	}

	public void setPt_signmonth(int pt_signmonth) {
		this.pt_signmonth = pt_signmonth;
	}

	public int getPt_price() {
		return pt_price;
	}

	public void setPt_price(int pt_price) {
		this.pt_price = pt_price;
	}

	@Override
	public String toString() {
		return "\n PtPriceDto [pt_num=" + pt_num + ", pt_code=" + pt_code + ", pt_month=" + pt_month + ", ptr_count="
				+ ptr_count + ", pt_signmonth=" + pt_signmonth + ", pt_price=" + pt_price + "]";
	}

	
}
