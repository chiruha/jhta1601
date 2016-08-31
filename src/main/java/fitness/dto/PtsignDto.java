package fitness.dto;

import java.sql.Date;

public class PtsignDto {
	private int ptsign_num; //pt등록번호
	private int mem_num; //회원번호
	private String pt_code; //프로그램코드
	private int ptr_count; //pt횟수
	
	public PtsignDto(){}

	public PtsignDto(int ptsign_num, int mem_num, String pt_code, int ptr_count) {
		super();
		this.ptsign_num = ptsign_num;
		this.mem_num = mem_num;
		this.pt_code = pt_code;
		this.ptr_count = ptr_count;
	}

	public int getPtsign_num() {
		return ptsign_num;
	}

	public void setPtsign_num(int ptsign_num) {
		this.ptsign_num = ptsign_num;
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

	@Override
	public String toString() {
		return "PtsignDto [ptsign_num=" + ptsign_num + ", mem_num=" + mem_num + ", pt_code=" + pt_code + ", ptr_count="
				+ ptr_count + "]";
	}

	
}
