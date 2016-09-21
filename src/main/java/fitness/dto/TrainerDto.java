package fitness.dto;

public class TrainerDto {
	private int tr_num;
	private int stf_num;
	private String tr_career;
	private String tr_intro;
	private String stf_name;
	private int ct_code;
	private String ct_name;
	private String pos_code;
	private String pos_name;
	public TrainerDto() {	}
	
	public TrainerDto(int tr_num, int stf_num, String tr_career, String tr_intro, String stf_name, int ct_code,
			String ct_name, String pos_code, String pos_name) {
		super();
		this.tr_num = tr_num;
		this.stf_num = stf_num;
		this.tr_career = tr_career;
		this.tr_intro = tr_intro;
		this.stf_name = stf_name;
		this.ct_code = ct_code;
		this.ct_name = ct_name;
		this.pos_code = pos_code;
		this.pos_name = pos_name;
	}

	public TrainerDto(int tr_num, int stf_num, String tr_career, String tr_intro) {
		super();
		this.tr_num = tr_num;
		this.stf_num = stf_num;
		this.tr_career = tr_career;
		this.tr_intro = tr_intro;
	}
	public int getTr_num() {
		return tr_num;
	}
	public void setTr_num(int tr_num) {
		this.tr_num = tr_num;
	}
	public int getStf_num() {
		return stf_num;
	}
	public void setStf_num(int stf_num) {
		this.stf_num = stf_num;
	}
	public String getTr_career() {
		return tr_career;
	}
	public void setTr_career(String tr_career) {
		this.tr_career = tr_career;
	}
	public String getTr_intro() {
		return tr_intro;
	}
	public void setTr_intro(String tr_intro) {
		this.tr_intro = tr_intro;
	}

	public String getStf_name() {
		return stf_name;
	}

	public void setStf_name(String stf_name) {
		this.stf_name = stf_name;
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

	@Override
	public String toString() {
		return "TrainerDto [tr_num=" + tr_num + ", stf_num=" + stf_num + ", tr_career=" + tr_career + ", tr_intro="
				+ tr_intro + ", stf_name=" + stf_name + ", ct_code=" + ct_code + ", ct_name=" + ct_name + ", pos_code="
				+ pos_code + ", pos_name=" + pos_name + "]";
	}

	
}
