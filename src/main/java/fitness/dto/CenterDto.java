package fitness.dto;

public class CenterDto {
	private int ct_code;
	private String ct_name;
	private String ct_tel;
	private String ct_addr;
	private String ct_intro;
	
	public CenterDto() {}
	
	public CenterDto(int ct_code, String ct_name, String ct_tel, String ct_addr, String ct_intro) {
		super();
		this.ct_code = ct_code;
		this.ct_name = ct_name;
		this.ct_tel = ct_tel;
		this.ct_addr = ct_addr;
		this.ct_intro = ct_intro;
	}
	public int getCt_code() {
		return ct_code;
	}
	public void setCt_code(int ct_code) {
		this.ct_code = ct_code;
	}
	public String getCt_name() {
		return ct_name;
	}
	public void setCt_name(String ct_name) {
		this.ct_name = ct_name;
	}
	public String getCt_tel() {
		return ct_tel;
	}
	public void setCt_tel(String ct_tel) {
		this.ct_tel = ct_tel;
	}
	public String getCt_addr() {
		return ct_addr;
	}
	public void setCt_addr(String ct_addr) {
		this.ct_addr = ct_addr;
	}
	public String getCt_intro() {
		return ct_intro;
	}
	public void setCt_intro(String ct_intro) {
		this.ct_intro = ct_intro;
	}
	@Override
	public String toString() {
		return "CenterDto [ct_code=" + ct_code + ", ct_name=" + ct_name + ", ct_tel=" + ct_tel + ", ct_addr=" + ct_addr
				+ ", ct_intro=" + ct_intro + "]";
	}
	
}
