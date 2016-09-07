package fitness.dto;

public class GxsubjectDto {
	private String gx_code;
	private String gx_name;
	
	public GxsubjectDto() {}

	public GxsubjectDto(String gx_code, String gx_name) {
		super();
		this.gx_code = gx_code;
		this.gx_name = gx_name;
	}

	public String getGx_code() {
		return gx_code;
	}

	public void setGx_code(String gx_code) {
		this.gx_code = gx_code;
	}

	public String getGx_name() {
		return gx_name;
	}

	public void setGx_name(String gx_name) {
		this.gx_name = gx_name;
	}

	@Override
	public String toString() {
		return "gxsubjectDto [gx_code=" + gx_code + ", gx_name=" + gx_name + "]";
	}

}
