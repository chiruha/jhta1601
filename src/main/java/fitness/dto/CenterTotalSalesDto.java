package fitness.dto;

import java.sql.Date;

public class CenterTotalSalesDto {
	private int cts_num;
	private int ct_code;
	private int cts_income;//지점 월 총수입
	private int cts_refund;//지점 월 총환불
	private int cts_totsales;//지점 월매출 = 총수입-총환불
	private String cts_date;//계산기준일
	
	public CenterTotalSalesDto(){}

	public CenterTotalSalesDto(int cts_num, int ct_code, int cts_income, int cts_refund, int cts_totsales,
			String cts_date) {
		super();
		this.cts_num = cts_num;
		this.ct_code = ct_code;
		this.cts_income = cts_income;
		this.cts_refund = cts_refund;
		this.cts_totsales = cts_totsales;
		this.cts_date = cts_date;
	}

	public int getCts_num() {
		return cts_num;
	}

	public void setCts_num(int cts_num) {
		this.cts_num = cts_num;
	}

	public int getCt_code() {
		return ct_code;
	}

	public void setCt_code(int ct_code) {
		this.ct_code = ct_code;
	}

	public int getCts_income() {
		return cts_income;
	}

	public void setCts_income(int cts_income) {
		this.cts_income = cts_income;
	}

	public int getCts_refund() {
		return cts_refund;
	}

	public void setCts_refund(int cts_refund) {
		this.cts_refund = cts_refund;
	}

	public int getCts_totsales() {
		return cts_totsales;
	}

	public void setCts_totsales(int cts_totsales) {
		this.cts_totsales = cts_totsales;
	}

	public String getCts_date() {
		return cts_date;
	}

	public void setCts_date(String cts_date) {
		this.cts_date = cts_date;
	}

	@Override
	public String toString() {
		return "CenterTotalSalesDto [cts_num=" + cts_num + ", ct_code=" + ct_code + ", cts_income=" + cts_income
				+ ", cts_refund=" + cts_refund + ", cts_totsales=" + cts_totsales + ", cts_date=" + cts_date + "]";
	}
	
}
