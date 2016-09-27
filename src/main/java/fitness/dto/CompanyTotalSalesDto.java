package fitness.dto;

public class CompanyTotalSalesDto {
	private int comtotnum;
	private int salesincome;
	private int salesrefund;
	private int salestot;
	private int paytotal;
	private int comsalestot;
	private String comsales_date;
	
	public CompanyTotalSalesDto(int comtotnum, int salesincome, int salesrefund, int salestot, int paytotal,
			int comsalestot, String comsales_date) {
		super();
		this.comtotnum = comtotnum;
		this.salesincome = salesincome;
		this.salesrefund = salesrefund;
		this.salestot = salestot;
		this.paytotal = paytotal;
		this.comsalestot = comsalestot;
		this.comsales_date = comsales_date;
	}

	public int getComtotnum() {
		return comtotnum;
	}

	public void setComtotnum(int comtotnum) {
		this.comtotnum = comtotnum;
	}

	public int getSalesincome() {
		return salesincome;
	}

	public void setSalesincome(int salesincome) {
		this.salesincome = salesincome;
	}

	public int getSalesrefund() {
		return salesrefund;
	}

	public void setSalesrefund(int salesrefund) {
		this.salesrefund = salesrefund;
	}

	public int getSalestot() {
		return salestot;
	}

	public void setSalestot(int salestot) {
		this.salestot = salestot;
	}

	public int getPaytotal() {
		return paytotal;
	}

	public void setPaytotal(int paytotal) {
		this.paytotal = paytotal;
	}

	public int getComsalestot() {
		return comsalestot;
	}

	public void setComsalestot(int comsalestot) {
		this.comsalestot = comsalestot;
	}

	public String getComsales_date() {
		return comsales_date;
	}

	public void setComsales_date(String comsales_date) {
		this.comsales_date = comsales_date;
	}

	@Override
	public String toString() {
		return "CompanyTotalSalesDto [comtotnum=" + comtotnum + ", salesincome=" + salesincome + ", salesrefund="
				+ salesrefund + ", salestot=" + salestot + ", paytotal=" + paytotal + ", comsalestot=" + comsalestot
				+ ", comsales_date=" + comsales_date + "]";
	}
	
	
}
