package fitness.dto;

public class ProgramPriceDto {
	private int pro_num;//���α׷���ȣ
	private String pro_code;//���α׷��ڵ�
	private String pro_name;//���α׷��̸� �� ��ϰ�����
	private int pro_signmonth;//���α׷� ��ϰ�����
	private int pro_price;//���α׷�����
	
	public ProgramPriceDto(){}

	public ProgramPriceDto(int pro_num, String pro_code, String pro_name, int pro_signmonth, int pro_price) {
		super();
		this.pro_num = pro_num;
		this.pro_code = pro_code;
		this.pro_name = pro_name;
		this.pro_signmonth = pro_signmonth;
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

	public int getPro_signmonth() {
		return pro_signmonth;
	}

	public void setPro_signmonth(int pro_signmonth) {
		this.pro_signmonth = pro_signmonth;
	}

	public int getPro_price() {
		return pro_price;
	}

	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}

	@Override
	public String toString() {
		return "\n ProgramPriceDto [pro_num=" + pro_num + ", pro_code=" + pro_code + ", pro_name=" + pro_name
				+ ", pro_signmonth=" + pro_signmonth + ", pro_price=" + pro_price + "]";
	}

	
}
