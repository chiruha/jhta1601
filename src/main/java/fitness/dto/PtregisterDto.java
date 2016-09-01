package fitness.dto;

public class PtregisterDto {
	private int ptr_num;
	private int tr_num;
	private int rg_num;
	private String ptr_initdate;
	private String ptr_time;
	private int ptr_count;	
	private int ct_code;
	private String ptr_ok;
	private int mem_num;
	private String mem_name;
	
	public PtregisterDto() {}

	public PtregisterDto(int ptr_num, int tr_num, int rg_num, String ptr_initdate, String ptr_time, int ptr_count,
			int ct_code, String ptr_ok) {
		super();
		this.ptr_num = ptr_num;
		this.tr_num = tr_num;
		this.rg_num = rg_num;
		this.ptr_initdate = ptr_initdate;
		this.ptr_time = ptr_time;
		this.ptr_count = ptr_count;
		this.ct_code = ct_code;
		this.ptr_ok = ptr_ok;
	}

	public PtregisterDto(int ptr_num, int tr_num, int rg_num, String ptr_initdate, String ptr_time, int ptr_count,
			int ct_code, String ptr_ok, int mem_num, String mem_name) {
		super();
		this.ptr_num = ptr_num;
		this.tr_num = tr_num;
		this.rg_num = rg_num;
		this.ptr_initdate = ptr_initdate;
		this.ptr_time = ptr_time;
		this.ptr_count = ptr_count;
		this.ct_code = ct_code;
		this.ptr_ok = ptr_ok;
		this.mem_num = mem_num;
		this.mem_name = mem_name;
	}

	public int getPtr_num() {
		return ptr_num;
	}

	public void setPtr_num(int ptr_num) {
		this.ptr_num = ptr_num;
	}

	public int getTr_num() {
		return tr_num;
	}

	public void setTr_num(int tr_num) {
		this.tr_num = tr_num;
	}

	public int getRg_num() {
		return rg_num;
	}

	public void setRg_num(int rg_num) {
		this.rg_num = rg_num;
	}

	public String getPtr_initdate() {
		return ptr_initdate;
	}

	public void setPtr_initdate(String ptr_initdate) {
		this.ptr_initdate = ptr_initdate;
	}

	public String getPtr_time() {
		return ptr_time;
	}

	public void setPtr_time(String ptr_time) {
		this.ptr_time = ptr_time;
	}

	public int getPtr_count() {
		return ptr_count;
	}

	public void setPtr_count(int ptr_count) {
		this.ptr_count = ptr_count;
	}

	public int getCt_code() {
		return ct_code;
	}

	public void setCt_code(int ct_code) {
		this.ct_code = ct_code;
	}

	public String getPtr_ok() {
		return ptr_ok;
	}

	public void setPtr_ok(String ptr_ok) {
		this.ptr_ok = ptr_ok;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	@Override
	public String toString() {
		return "\n PtregisterDto [ptr_num=" + ptr_num + ", tr_num=" + tr_num + ", rg_num=" + rg_num + ", ptr_initdate="
				+ ptr_initdate + ", ptr_time=" + ptr_time + ", ptr_count=" + ptr_count + ", ct_code=" + ct_code
				+ ", ptr_ok=" + ptr_ok + ", mem_num=" + mem_num + ", mem_name=" + mem_name + "]";
	}

	
	
	
	

	
	

	
	
	
	
}
