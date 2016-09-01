package fitness.dto;

public class PositionDto {
	private String pos_code;
	private String pos_name;
	private int dept_code;
	
	public PositionDto(){}
	
	public PositionDto(String pos_code, String pos_name, int dept_code) {
		super();
		this.pos_code = pos_code;
		this.pos_name = pos_name;
		this.dept_code = dept_code;
	}
	public String getPos_code() {
		return pos_code;
	}
	public void setPos_code(String pos_code) {
		this.pos_code = pos_code;
	}
	public String getPos_name() {
		return pos_name;
	}
	public void setPos_name(String pos_name) {
		this.pos_name = pos_name;
	}
	public int getDept_code() {
		return dept_code;
	}
	public void setDept_code(int dept_code) {
		this.dept_code = dept_code;
	}
	@Override
	public String toString() {
		return "\n PositionDto [pos_code=" + pos_code + ", pos_name=" + pos_name + ", dept_code=" + dept_code + "]";
	}
	
}
