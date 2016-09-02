package fitness.dto;

import java.sql.Date;

public class ProsignDto {
	private int prosign_num; //단과과목등록 번호
	private int rg_num;//등록번호 references registration(rg_num)
	private int mem_num; //회원번호
	private String pro_code; //프로그램번호
	private int properiod_num;
	private int pro_signmonth;//등록개월수
	private Date pro_regdate;//운동시작일
	private Date pro_expiration;//운동만료일
	private int pro_num;//프로그램번호
	private String pro_name;//프로그램이름 및 등록개월수
	private int pro_price;//프로그램가격
	
	
	public ProsignDto(){}

	public ProsignDto(int prosign_num, int rg_num, int mem_num, String pro_name,String pro_code) {
		super();
		this.prosign_num = prosign_num;
		this.rg_num = rg_num;
		this.mem_num = mem_num;
		this.pro_name = pro_name;
		this.pro_code = pro_code;
	}
	
	public ProsignDto(int prosign_num, int rg_num, int mem_num, String pro_code, int properiod_num, int pro_signmonth,
			Date pro_regdate, Date pro_expiration) {
		super();
		this.prosign_num = prosign_num;
		this.rg_num = rg_num;
		this.mem_num = mem_num;
		this.pro_code = pro_code;
		this.properiod_num = properiod_num;
		this.pro_signmonth = pro_signmonth;
		this.pro_regdate = pro_regdate;
		this.pro_expiration = pro_expiration;
	}
	
	public ProsignDto(int prosign_num, int rg_num, int mem_num, String pro_code, int properiod_num, int pro_signmonth,
			Date pro_regdate, Date pro_expiration, int pro_num, String pro_name, int pro_price) {
		super();
		this.prosign_num = prosign_num;
		this.rg_num = rg_num;
		this.mem_num = mem_num;
		this.pro_code = pro_code;
		this.properiod_num = properiod_num;
		this.pro_signmonth = pro_signmonth;
		this.pro_regdate = pro_regdate;
		this.pro_expiration = pro_expiration;
		this.pro_num = pro_num;
		this.pro_name = pro_name;
		this.pro_price = pro_price;
	}

	public int getProsign_num() {
		return prosign_num;
	}

	public void setProsign_num(int prosign_num) {
		this.prosign_num = prosign_num;
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

	public String getPro_code() {
		return pro_code;
	}

	public void setPro_code(String pro_code) {
		this.pro_code = pro_code;
	}

	@Override
	public String toString() {
		return "ProsignDto [prosign_num=" + prosign_num + ", rg_num=" + rg_num + ", mem_num=" + mem_num + ", pro_code="
				+ pro_code + "]";
	}

	public int getProperiod_num() {
		return properiod_num;
	}

	public void setProperiod_num(int properiod_num) {
		this.properiod_num = properiod_num;
	}

	public int getPro_signmonth() {
		return pro_signmonth;
	}

	public void setPro_signmonth(int pro_signmonth) {
		this.pro_signmonth = pro_signmonth;
	}

	public Date getPro_regdate() {
		return pro_regdate;
	}

	public void setPro_regdate(Date pro_regdate) {
		this.pro_regdate = pro_regdate;
	}

	public Date getPro_expiration() {
		return pro_expiration;
	}

	public void setPro_expiration(Date pro_expiration) {
		this.pro_expiration = pro_expiration;
	}

	public int getPro_num() {
		return pro_num;
	}

	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
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
	
	
}
