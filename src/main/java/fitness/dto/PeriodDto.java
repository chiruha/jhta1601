package fitness.dto;

import java.sql.Date;

public class PeriodDto {
	private int pri_num;
	private Date pri_start;
	private Date pri_end;
	private Date pri_left;
	private Date today;
	private int rg_num;
	public PeriodDto() {}
	public PeriodDto(int pri_num, Date pri_start, Date pri_end, Date pri_left, Date today, int rg_num) {
		super();
		this.pri_num = pri_num;
		this.pri_start = pri_start;
		this.pri_end = pri_end;
		this.pri_left = pri_left;
		this.today = today;
		this.rg_num = rg_num;
	}
	public int getPri_num() {
		return pri_num;
	}
	public void setPri_num(int pri_num) {
		this.pri_num = pri_num;
	}
	public Date getPri_start() {
		return pri_start;
	}
	public void setPri_start(Date pri_start) {
		this.pri_start = pri_start;
	}
	public Date getPri_end() {
		return pri_end;
	}
	public void setPri_end(Date pri_end) {
		this.pri_end = pri_end;
	}
	public Date getPri_left() {
		return pri_left;
	}
	public void setPri_left(Date pri_left) {
		this.pri_left = pri_left;
	}
	public Date getToday() {
		return today;
	}
	public void setToday(Date today) {
		this.today = today;
	}
	public int getRg_num() {
		return rg_num;
	}
	public void setRg_num(int rg_num) {
		this.rg_num = rg_num;
	}
	@Override
	public String toString() {
		return "\n PeriodDto [pri_num=" + pri_num + ", pri_start=" + pri_start + ", pri_end=" + pri_end + ", pri_left="
				+ pri_left + ", today=" + today + ", rg_num=" + rg_num + "]";
	}
	
}
