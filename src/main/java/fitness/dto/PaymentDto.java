package fitness.dto;

import java.sql.Date;

public class PaymentDto {
	private int pay_num;
	private int pay_tot;
	private Date date;
	private String satt_num;
	public PaymentDto() {	}
	public PaymentDto(int pay_num, int pay_tot, Date date, String satt_num) {
		super();
		this.pay_num = pay_num;
		this.pay_tot = pay_tot;
		this.date = date;
		this.satt_num = satt_num;
	}
	public int getPay_num() {
		return pay_num;
	}
	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}
	public int getPay_tot() {
		return pay_tot;
	}
	public void setPay_tot(int pay_tot) {
		this.pay_tot = pay_tot;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getSatt_num() {
		return satt_num;
	}
	public void setSatt_num(String satt_num) {
		this.satt_num = satt_num;
	}
	@Override
	public String toString() {
		return "PaymentDto [pay_num=" + pay_num + ", pay_tot=" + pay_tot + ", date=" + date + ", satt_num=" + satt_num
				+ "]";
	}
	
}
