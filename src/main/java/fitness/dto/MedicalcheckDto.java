package fitness.dto;

public class MedicalcheckDto {
	private int md_num;
	private int mem_num;
	private String relative;
	private String absolute;
	private String par_q;
	
	public MedicalcheckDto() {}

	public MedicalcheckDto(int md_num, int mem_num, String relative, String absolute, String par_q) {
		super();
		this.md_num = md_num;
		this.mem_num = mem_num;
		this.relative = relative;
		this.absolute = absolute;
		this.par_q = par_q;
	}

	public int getMd_num() {
		return md_num;
	}

	public void setMd_num(int md_num) {
		this.md_num = md_num;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public String getRelative() {
		return relative;
	}

	public void setRelative(String relative) {
		this.relative = relative;
	}

	public String getAbsolute() {
		return absolute;
	}

	public void setAbsolute(String absolute) {
		this.absolute = absolute;
	}

	public String getPar_q() {
		return par_q;
	}

	public void setPar_q(String par_q) {
		this.par_q = par_q;
	}

	@Override
	public String toString() {
		return "\n MedicalcheckDto [md_num=" + md_num + ", mem_num=" + mem_num + ", relative=" + relative + ", absolute="
				+ absolute + ", par_q=" + par_q + "]";
	}
	
	
}
