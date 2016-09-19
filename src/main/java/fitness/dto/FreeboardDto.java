package fitness.dto;

import java.sql.Date;

public class FreeboardDto {
	private int fb_num;  //글번호 
	private int mem_num; //작성자
	private String fb_title; //글제목
	private String fb_content; //글내용
	private Date fb_date; //글등록일
	private int fb_hit; //조회수
	private int fb_ref; //그룹번호
	private int fb_lev; //글레벨(새글인지,답글인지,답글의 답글인지
	private int fb_step; //출력순서
	private String mem_name;
	
	public FreeboardDto() {}

	public FreeboardDto(int fb_num, int fb_ref, int fb_lev, int fb_step){
		this.fb_num = fb_num;
		this.fb_ref = fb_ref;
		this.fb_lev = fb_lev;
		this.fb_step = fb_step;
	}
	
	@Override
	public String toString() {
		return "FreeboardDto [fb_num=" + fb_num + ", mem_num=" + mem_num + ", fb_title=" + fb_title + ", fb_content="
				+ fb_content + ", fb_date=" + fb_date + ", fb_hit=" + fb_hit + ", fb_ref=" + fb_ref + ", fb_lev="
				+ fb_lev + ", fb_step=" + fb_step + ", mem_name=" + mem_name + "]";
	}

	public FreeboardDto(int fb_num, int mem_num, String fb_title, String fb_content, Date fb_date, int fb_hit,
			int fb_ref, int fb_lev, int fb_step, String mem_name) {
		super();
		this.fb_num = fb_num;
		this.mem_num = mem_num;
		this.fb_title = fb_title;
		this.fb_content = fb_content;
		this.fb_date = fb_date;
		this.fb_hit = fb_hit;
		this.fb_ref = fb_ref;
		this.fb_lev = fb_lev;
		this.fb_step = fb_step;
		this.mem_name = mem_name;
	}

	public int getFb_num() {
		return fb_num;
	}

	public void setFb_num(int fb_num) {
		this.fb_num = fb_num;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public String getFb_title() {
		return fb_title;
	}

	public void setFb_title(String fb_title) {
		this.fb_title = fb_title;
	}

	public String getFb_content() {
		return fb_content;
	}

	public void setFb_content(String fb_content) {
		this.fb_content = fb_content;
	}

	public Date getFb_date() {
		return fb_date;
	}

	public void setFb_date(Date fb_date) {
		this.fb_date = fb_date;
	}

	public int getFb_hit() {
		return fb_hit;
	}

	public void setFb_hit(int fb_hit) {
		this.fb_hit = fb_hit;
	}

	public int getFb_ref() {
		return fb_ref;
	}

	public void setFb_ref(int fb_ref) {
		this.fb_ref = fb_ref;
	}

	public int getFb_lev() {
		return fb_lev;
	}
	public void setFb_lev(int fb_lev) {
		this.fb_lev = fb_lev;
	}

	public void setFb_lef(int fb_lev) {
		this.fb_lev = fb_lev;
	}

	public int getFb_step() {
		return fb_step;
	}

	public void setFb_step(int fb_step) {
		this.fb_step = fb_step;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

}