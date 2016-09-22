package fitness.dto;

public class RefundDay {
	private int mem_num;
	private int rg_num;
	private int totregimoney;
	private int ptgxoneday;
	private int pttoday;
	private int gxtoday;
	private int ptday;
	private int gxday;
	
	public RefundDay() {}

	public RefundDay(int mem_num, int rg_num, int totregimoney, int ptgxoneday, int pttoday, int gxtoday, int ptday,
			int gxday) {
		super();
		this.mem_num = mem_num;
		this.rg_num = rg_num;
		this.totregimoney = totregimoney;
		this.ptgxoneday = ptgxoneday;
		this.pttoday = pttoday;
		this.gxtoday = gxtoday;
		this.ptday = ptday;
		this.gxday = gxday;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public int getRg_num() {
		return rg_num;
	}

	public void setRg_num(int rg_num) {
		this.rg_num = rg_num;
	}

	public int getTotregimoney() {
		return totregimoney;
	}

	public void setTotregimoney(int totregimoney) {
		this.totregimoney = totregimoney;
	}

	public int getPtgxoneday() {
		return ptgxoneday;
	}

	public void setPtgxoneday(int ptgxoneday) {
		this.ptgxoneday = ptgxoneday;
	}

	public int getPttoday() {
		return pttoday;
	}

	public void setPttoday(int pttoday) {
		this.pttoday = pttoday;
	}

	public int getGxtoday() {
		return gxtoday;
	}

	public void setGxtoday(int gxtoday) {
		this.gxtoday = gxtoday;
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

	@Override
	public String toString() {
		return "RefundDay [mem_num=" + mem_num + ", rg_num=" + rg_num + ", totregimoney=" + totregimoney
				+ ", ptgxoneday=" + ptgxoneday + ", pttoday=" + pttoday + ", gxtoday=" + gxtoday + ", ptday=" + ptday
				+ ", gxday=" + gxday + "]";
	}
	
	
}

