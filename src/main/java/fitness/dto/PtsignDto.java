package fitness.dto;

import java.sql.Date;

public class PtsignDto {
	private int ptsign_num; //pt��Ϲ�ȣ
	private int mem_num; //ȸ����ȣ
	private String pt_code; //���α׷��ڵ�
	private int ptr_count; //ptȽ��
	private Date pt_regdate; //pt�����
	
	public PtsignDto(){}

	public PtsignDto(int ptsign_num, int mem_num, String pt_code, int ptr_count, Date pt_regdate) {
		super();
		this.ptsign_num = ptsign_num;
		this.mem_num = mem_num;
		this.pt_code = pt_code;
		this.ptr_count = ptr_count;
		this.pt_regdate = pt_regdate;
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

	public Date getPt_regdate() {
		return pt_regdate;
	}

	public void setPt_regdate(Date pt_regdate) {
		this.pt_regdate = pt_regdate;
	}

	@Override
	public String toString() {
		return "PtsignDto [ptsign_num=" + ptsign_num + ", mem_num=" + mem_num + ", pt_code=" + pt_code + ", ptr_count="
				+ ptr_count + ", pt_regdate=" + pt_regdate + "]";
	}
	
}
