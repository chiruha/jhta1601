package fitness.dto;

public class PtrMemDto {
	private String ptr_initdate;
	private String ptr_time;
	private int ptr_count;
	private String ptr_ok;
	private String mem_name;
	private String stf_name;
	
	public PtrMemDto() {}

	public PtrMemDto(String ptr_initdate, String ptr_time, int ptr_count, String ptr_ok, String mem_name,
			String stf_name) {
		super();
		this.ptr_initdate = ptr_initdate;
		this.ptr_time = ptr_time;
		this.ptr_count = ptr_count;
		this.ptr_ok = ptr_ok;
		this.mem_name = mem_name;
		this.stf_name = stf_name;
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

	public String getPtr_ok() {
		return ptr_ok;
	}

	public void setPtr_ok(String ptr_ok) {
		this.ptr_ok = ptr_ok;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getStf_name() {
		return stf_name;
	}

	public void setStf_name(String stf_name) {
		this.stf_name = stf_name;
	}

	@Override
	public String toString() {
		return "ptrMemDto [ptr_initdate=" + ptr_initdate + ", ptr_time=" + ptr_time + ", ptr_count=" + ptr_count
				+ ", ptr_ok=" + ptr_ok + ", mem_name=" + mem_name + ", stf_name=" + stf_name + "]";
	}
	
	
}
