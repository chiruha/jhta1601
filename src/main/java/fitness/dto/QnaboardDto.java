package fitness.dto;

import java.sql.Date;

public class QnaboardDto {
	private int qna_num;
	private int mem_num;
	private int stf_num;
	private String qna_title;
	private String qna_content;
	private Date qna_date;
	private int qna_hit;
	private int qna_ref;
	private int qna_lev;
	private int qna_step;
	
	public QnaboardDto() {}
	
	public QnaboardDto(int qna_num, int qna_ref, int qna_lev, int qna_step){
		this.qna_num = qna_num;
		this.qna_ref = qna_ref;
		this.qna_lev = qna_lev;
		this.qna_step = qna_step;
	}

	public QnaboardDto(int qna_num, int mem_num, int stf_num, String qna_title, String qna_content, Date qna_date,
			int qna_hit, int qna_ref, int qna_lev, int qna_step) {
		super();
		this.qna_num = qna_num;
		this.mem_num = mem_num;
		this.stf_num = stf_num;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_date = qna_date;
		this.qna_hit = qna_hit;
		this.qna_ref = qna_ref;
		this.qna_lev = qna_lev;
		this.qna_step = qna_step;
	}

	public int getQna_num() {
		return qna_num;
	}

	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public int getStf_num() {
		return stf_num;
	}

	public void setStf_num(int stf_num) {
		this.stf_num = stf_num;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public Date getQna_date() {
		return qna_date;
	}

	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}

	public int getQna_hit() {
		return qna_hit;
	}

	public void setQna_hit(int qna_hit) {
		this.qna_hit = qna_hit;
	}

	public int getQna_ref() {
		return qna_ref;
	}

	public void setQna_ref(int qna_ref) {
		this.qna_ref = qna_ref;
	}

	public int getQna_lev() {
		return qna_lev;
	}

	public void setQna_lev(int qna_lev) {
		this.qna_lev = qna_lev;
	}

	public int getQna_step() {
		return qna_step;
	}

	public void setQna_step(int qna_step) {
		this.qna_step = qna_step;
	}

	@Override
	public String toString() {
		return "QnaboardDto [qna_num=" + qna_num + ", mem_num=" + mem_num + ", stf_num=" + stf_num + ", qna_title="
				+ qna_title + ", qna_content=" + qna_content + ", qna_date=" + qna_date + ", qna_hit=" + qna_hit
				+ ", qna_ref=" + qna_ref + ", qna_lev=" + qna_lev + ", qna_step=" + qna_step + "]";
	}
	
	
	
}
