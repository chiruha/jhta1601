package fitness.dto;

public class PtPriceDto {
	private int pt_num;//pt���α׷� ��ȣ
	private String pt_code;//pt���α׷� �ڵ�
	private String pt_month;//��ϰ��� �� �� ��ȸ
	private int pt_cnt;//ptȽ��
	private int pt_price;//pt����
	
	public PtPriceDto(){}
	
	public PtPriceDto(int pt_num, String pt_code, String pt_month, int pt_cnt, int pt_price) {
		super();
		this.pt_num = pt_num;
		this.pt_code = pt_code;
		this.pt_month = pt_month;
		this.pt_cnt = pt_cnt;
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

	public int getPt_cnt() {
		return pt_cnt;
	}

	public void setPt_cnt(int pt_cnt) {
		this.pt_cnt = pt_cnt;
	}

	public int getPt_price() {
		return pt_price;
	}

	public void setPt_price(int pt_price) {
		this.pt_price = pt_price;
	}

	@Override
	public String toString() {
		return "PtPriceDto [pt_num=" + pt_num + ", pt_code=" + pt_code + ", pt_month=" + pt_month + ", pt_cnt=" + pt_cnt
				+ ", pt_price=" + pt_price + "]";
	}
}
