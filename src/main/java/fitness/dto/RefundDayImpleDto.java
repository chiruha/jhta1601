package fitness.dto;

public class RefundDayImpleDto {
	private int mem_num;
	private int ptday;
	private int gxday;
	private int spsday;
	private int sgxday;
	
	public RefundDayImpleDto() {}

	public RefundDayImpleDto(int mem_num, int ptday, int gxday, int spsday, int sgxday) {
		super();
		this.mem_num = mem_num;
		this.ptday = ptday;
		this.gxday = gxday;
		this.spsday = spsday;
		this.sgxday = sgxday;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public int getPtday() {
		return ptday;
	}

	public void setPtday(int ptday) {
		this.ptday = ptday;
	}

	public int getGxday() {
		return gxday;
	}

	public void setGxday(int gxday) {
		this.gxday = gxday;
	}

	public int getSpsday() {
		return spsday;
	}

	public void setSpsday(int spsday) {
		this.spsday = spsday;
	}

	public int getSgxday() {
		return sgxday;
	}

	public void setSgxday(int sgxday) {
		this.sgxday = sgxday;
	}

	@Override
	public String toString() {
		return "RefundDayImple [mem_num=" + mem_num + ", ptday=" + ptday + ", gxday=" + gxday + ", spsday=" + spsday
				+ ", sgxday=" + sgxday + "]";
	}
	
	
	
	
}

