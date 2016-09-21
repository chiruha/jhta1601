package fitness.dto;

import java.sql.Date;

public class PaymentDto {
	private int pay_num;
	private int stf_num;
	private int time_sum;
	private int pay_tot;
	private Date pay_date;
	public PaymentDto() {	}
	public PaymentDto(int pay_num, int stf_num, int time_sum, int pay_tot, Date pay_date) {
		super();
		this.pay_num = pay_num;
		this.stf_num = stf_num;
		this.time_sum = time_sum;
		this.pay_tot = pay_tot;
		this.pay_date = pay_date;
	}
	public int getPay_num() {
		return pay_num;
	}
	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}
	public int getStf_num() {
		return stf_num;
	}
	public void setStf_num(int stf_num) {
		this.stf_num = stf_num;
	}
	public int getTime_sum() {
		return time_sum;
	}
	public void setTime_sum(int time_sum) {
		this.time_sum = time_sum;
	}
	public int getPay_tot() {
		return pay_tot;
	}
	public void setPay_tot(int pay_tot) {
		this.pay_tot = pay_tot;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	@Override
	public String toString() {
		return "PaymentDto [pay_num=" + pay_num + ", stf_num=" + stf_num + ", time_sum=" + time_sum + ", pay_tot="
				+ pay_tot + ", pay_date=" + pay_date + "]";
	}
	
	
}
