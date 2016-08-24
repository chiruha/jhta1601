package fitness.dto;

public class PtregisterDto {
	private int ptr_num;
	private int tr_num;
	private String ptr_time;
	private String ptr_ok;
	
	public PtregisterDto() {}

	public PtregisterDto(int ptr_num, int tr_num, String ptr_time, String ptr_ok) {
		super();
		this.ptr_num = ptr_num;
		this.tr_num = tr_num;
		this.ptr_time = ptr_time;
		this.ptr_ok = ptr_ok;
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

	public String getPtr_time() {
		return ptr_time;
	}

	public void setPtr_time(String ptr_time) {
		this.ptr_time = ptr_time;
	}

	public String getPtr_ok() {
		return ptr_ok;
	}

	public void setPtr_ok(String ptr_ok) {
		this.ptr_ok = ptr_ok;
	}

	@Override
	public String toString() {
		return "PtregisterDto [ptr_num=" + ptr_num + ", tr_num=" + tr_num + ", ptr_time=" + ptr_time + ", ptr_ok="
				+ ptr_ok + "]";
	}
	
	
}
