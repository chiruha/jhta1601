package fitness.dto;

public class GxregisterDto {
	private int gx_num;
	private int ct_code;
	private String gx_exercise;
	private String gx_day;
	private String gx_time;
	private int rg_num;
	
	public GxregisterDto() {}

	public GxregisterDto(int gx_num, int ct_code, String gx_exercise, String gx_day, String gx_time, int rg_num) {
		super();
		this.gx_num = gx_num;
		this.ct_code = ct_code;
		this.gx_exercise = gx_exercise;
		this.gx_day = gx_day;
		this.gx_time = gx_time;
		this.rg_num = rg_num;
	}

	public int getGx_num() {
		return gx_num;
	}

	public void setGx_num(int gx_num) {
		this.gx_num = gx_num;
	}

	public int getCt_code() {
		return ct_code;
	}

	public void setCt_code(int ct_code) {
		this.ct_code = ct_code;
	}

	public String getGx_exercise() {
		return gx_exercise;
	}

	public void setGx_exercise(String gx_exercise) {
		this.gx_exercise = gx_exercise;
	}

	public String getGx_day() {
		return gx_day;
	}

	public void setGx_day(String gx_day) {
		this.gx_day = gx_day;
	}

	public String getGx_time() {
		return gx_time;
	}

	public void setGx_time(String gx_time) {
		this.gx_time = gx_time;
	}

	public int getRg_num() {
		return rg_num;
	}

	public void setRg_num(int rg_num) {
		this.rg_num = rg_num;
	}

	@Override
	public String toString() {
		return "\n GxregisterDto [gx_num=" + gx_num + ", ct_code=" + ct_code + ", gx_exercise=" + gx_exercise + ", gx_day="
				+ gx_day + ", gx_time=" + gx_time + ", rg_num=" + rg_num + "]";
	}
	
	
}
