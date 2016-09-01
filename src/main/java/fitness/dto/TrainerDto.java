package fitness.dto;

public class TrainerDto {
	private int tr_num;
	private int stf_num;
	private String tr_career;
	private String tr_intro;
	public TrainerDto() {	}
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
	@Override
	public String toString() {
		return "\n TrainerDto [tr_num=" + tr_num + ", stf_num=" + stf_num + ", tr_career=" + tr_career + ", tr_intro="
				+ tr_intro + "]";
	}
	
}
