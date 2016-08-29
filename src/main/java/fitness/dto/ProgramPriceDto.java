package fitness.dto;

public class ProgramPriceDto {
	private int pro_num;//프로그램번호
	private String pro_code;//프로그램코드
	private String pro_name;//프로그램이름 및 등록개월수
	private int pro_price;//프로그램가격
	
	public ProgramPriceDto(){}

	public ProgramPriceDto(int pro_num, String pro_code, String pro_name, int pro_price) {
		super();
		this.pro_num = pro_num;
		this.pro_code = pro_code;
		this.pro_name = pro_name;
		this.pro_price = pro_price;
	}

	public int getPro_num() {
		return pro_num;
	}

	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}

	public String getPro_code() {
		return pro_code;
	}

	public void setPro_code(String pro_code) {
		this.pro_code = pro_code;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public int getPro_price() {
		return pro_price;
	}

	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}

	@Override
	public String toString() {
		return "ProgramPriceDto [pro_num=" + pro_num + ", pro_code=" + pro_code + ", pro_name=" + pro_name
				+ ", pro_price=" + pro_price + "]";
	}
	
	
	
	
}
