package fitness.dto;

import java.sql.Date;

public class FreeboardDto {
	private int fb_num;
	private int mem_num;
	private String fb_title;
	private Date fb_date;
	private int fb_hit;
	private int fb_ref;
	private int fb_lef;
	private int fb_step;
	
	public FreeboardDto() {}
	
	public FreeboardDto(int fb_num, int mem_num, String fb_title, Date fb_date, int fb_hit, int fb_ref, int fb_lef,
			int fb_step) {
		super();
		this.fb_num = fb_num;
		this.mem_num = mem_num;
		this.fb_title = fb_title;
		this.fb_date = fb_date;
		this.fb_hit = fb_hit;
		this.fb_ref = fb_ref;
		this.fb_lef = fb_lef;
		this.fb_step = fb_step;
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
	public int getFb_lef() {
		return fb_lef;
	}
	public void setFb_lef(int fb_lef) {
		this.fb_lef = fb_lef;
	}
	public int getFb_step() {
		return fb_step;
	}
	public void setFb_step(int fb_step) {
		this.fb_step = fb_step;
	}
	
}
