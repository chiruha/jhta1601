package fitness.dto;

import java.sql.Date;

public class PtsignDto {
	private int ptsign_num; //pt등록번호
	private int rg_num;//등록번호 references registration(rg_num)
	private int mem_num; //회원번호
	private String pt_code; //프로그램코드
	private String pt_name;
	private int ptr_count; //pt횟수
	private int ptperiod_num;
	private int pt_signmonth;//등록개월수
	private Date ptr_initdate;//운동시작일
	private Date pt_expiration;//운동만료일
	
	public PtsignDto(){}

	public PtsignDto(int ptsign_num, int rg_num, int mem_num, String pt_code, String pt_name, int ptr_count) {
		super();
		this.ptsign_num = ptsign_num;
		this.rg_num = rg_num;
		this.mem_num = mem_num;
		this.pt_code = pt_code;
		this.pt_name = pt_name;
		this.ptr_count = ptr_count;
	}

	public PtsignDto(int ptsign_num, int rg_num, int mem_num, String pt_code, String pt_name, int ptr_count,
			int ptperiod_num, int pt_signmonth, Date ptr_initdate, Date pt_expiration) {
		super();
		this.ptsign_num = ptsign_num;
		this.rg_num = rg_num;
		this.mem_num = mem_num;
		this.pt_code = pt_code;
		this.pt_name = pt_name;
		this.ptr_count = ptr_count;
		this.ptperiod_num = ptperiod_num;
		this.pt_signmonth = pt_signmonth;
		this.ptr_initdate = ptr_initdate;
		this.pt_expiration = pt_expiration;
	}

	public int getPtsign_num() {
		return ptsign_num;
	}

	public void setPtsign_num(int ptsign_num) {
		this.ptsign_num = ptsign_num;
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

	public String getPt_code() {
		return pt_code;
	}

	public void setPt_code(String pt_code) {
		this.pt_code = pt_code;
	}

	public int getPtr_count() {
		return ptr_count;
	}

	public void setPtr_count(int ptr_count) {
		this.ptr_count = ptr_count;
	}
	

	public int getPtperiod_num() {
		return ptperiod_num;
	}

	public void setPtperiod_num(int ptperiod_num) {
		this.ptperiod_num = ptperiod_num;
	}

	public int getPt_signmonth() {
		return pt_signmonth;
	}

	public void setPt_signmonth(int pt_signmonth) {
		this.pt_signmonth = pt_signmonth;
	}

	public Date getPtr_initdate() {
		return ptr_initdate;
	}

	public void setPtr_initdate(Date ptr_initdate) {
		this.ptr_initdate = ptr_initdate;
	}

	public Date getPt_expiration() {
		return pt_expiration;
	}

	public void setPt_expiration(Date pt_expiration) {
		this.pt_expiration = pt_expiration;
	}
	
	public String getPt_name() {
		return pt_name;
	}

	public void setPt_name(String pt_name) {
		this.pt_name = pt_name;
	}

	@Override
	public String toString() {
		return "PtsignDto [ptsign_num=" + ptsign_num + ", rg_num=" + rg_num + ", mem_num=" + mem_num + ", pt_code="
				+ pt_code + ", ptr_count=" + ptr_count + "]";
	}

	
}
