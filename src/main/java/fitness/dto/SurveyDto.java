package fitness.dto;

public class SurveyDto {
	private int sv_num;
	private String sv_route;
	private String sv_anamnesis;
	private String sv_lifestyle;
	private String sv_goal;
	private String sv_memo;
	private int mem_num;
	private String sv_agree;
	
	public SurveyDto() {}
	
	public SurveyDto(int sv_num, String sv_route, String sv_anamnesis, String sv_lifestyle, String sv_goal,
			String sv_memo, int mem_num, String sv_agree) {
		super();
		this.sv_num = sv_num;
		this.sv_route = sv_route;
		this.sv_anamnesis = sv_anamnesis;
		this.sv_lifestyle = sv_lifestyle;
		this.sv_goal = sv_goal;
		this.sv_memo = sv_memo;
		this.mem_num = mem_num;
		this.sv_agree = sv_agree;
	}

	public int getSv_num() {
		return sv_num;
	}

	public void setSv_num(int sv_num) {
		this.sv_num = sv_num;
	}

	public String getSv_route() {
		return sv_route;
	}

	public void setSv_route(String sv_route) {
		this.sv_route = sv_route;
	}

	public String getSv_anamnesis() {
		return sv_anamnesis;
	}

	public void setSv_anamnesis(String sv_anamnesis) {
		this.sv_anamnesis = sv_anamnesis;
	}

	public String getSv_lifestyle() {
		return sv_lifestyle;
	}

	public void setSv_lifestyle(String sv_lifestyle) {
		this.sv_lifestyle = sv_lifestyle;
	}

	public String getSv_goal() {
		return sv_goal;
	}

	public void setSv_goal(String sv_goal) {
		this.sv_goal = sv_goal;
	}

	public String getSv_memo() {
		return sv_memo;
	}

	public void setSv_memo(String sv_memo) {
		this.sv_memo = sv_memo;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public String getSv_agree() {
		return sv_agree;
	}

	public void setSv_agree(String sv_agree) {
		this.sv_agree = sv_agree;
	}

	@Override
	public String toString() {
		return "SurveyDto [sv_num=" + sv_num + ", sv_route=" + sv_route + ", sv_anamnesis=" + sv_anamnesis
				+ ", sv_lifestyle=" + sv_lifestyle + ", sv_goal=" + sv_goal + ", sv_memo=" + sv_memo + ", mem_num="
				+ mem_num + ", sv_agree=" + sv_agree + "]";
	}
	
}
