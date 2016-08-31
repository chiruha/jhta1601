package fitness.dto;

import java.sql.Date;

public class ProsignDto {
	private int prosign_num; //�ܰ������� ��ȣ
	private int mem_num; //ȸ����ȣ
	private String pro_code; //���α׷���ȣ
	
	public ProsignDto(){}

	public ProsignDto(int prosign_num, int mem_num, String pro_code) {
		super();
		this.prosign_num = prosign_num;
		this.mem_num = mem_num;
		this.pro_code = pro_code;
	}

	public int getProsign_num() {
		return prosign_num;
	}

	public void setProsign_num(int prosign_num) {
		this.prosign_num = prosign_num;
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
		return "ProsignDto [prosign_num=" + prosign_num + ", mem_num=" + mem_num + ", pro_code=" + pro_code + "]";
	}

	
}
