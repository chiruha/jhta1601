package fitness.dto;

import java.sql.Date;

public class ProperiodDto {
	private int properiod_num;
	private int mem_num;
	private int pro_signmonth;//등록개월수
	private Date pro_regdate;//운동시작일
	private Date pro_expiration;//운동만료일
	
	public ProperiodDto() {}

	public ProperiodDto(int properiod_num, int mem_num, int pro_signmonth, Date pro_regdate, Date pro_expiration) {
		super();
		this.properiod_num = properiod_num;
		this.mem_num = mem_num;
		this.pro_signmonth = pro_signmonth;
		this.pro_regdate = pro_regdate;
		this.pro_expiration = pro_expiration;
	}

	public int getProperiod_num() {
		return properiod_num;
	}

	public void setProperiod_num(int properiod_num) {
		this.properiod_num = properiod_num;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public int getPro_signmonth() {
		return pro_signmonth;
	}

	public void setPro_signmonth(int pro_signmonth) {
		this.pro_signmonth = pro_signmonth;
	}

	public Date getPro_regdate() {
		return pro_regdate;
	}

	public void setPro_regdate(Date pro_regdate) {
		this.pro_regdate = pro_regdate;
	}

	public Date getPro_expiration() {
		return pro_expiration;
	}

	public void setPro_expiration(Date pro_expiration) {
		this.pro_expiration = pro_expiration;
	}

	@Override
	public String toString() {
		return "\n ProperiodDto [properiod_num=" + properiod_num + ", mem_num=" + mem_num + ", pro_signmonth="
				+ pro_signmonth + ", pro_regdate=" + pro_regdate + ", pro_expiration=" + pro_expiration + "]";
	}
	
	
}
