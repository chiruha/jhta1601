package fitness.dto;

import java.sql.Date;

public class IncomeDto {
	private int income_num;//���Թ�ȣ
	private int ct_code;
	private int tot_rg;
	private int tot_locker;
	private int tot_wear;
	private int tot_income;
	private Date income_startdate;
	private String income_startdate2;
	
	public IncomeDto(){}
	
	public IncomeDto(int income_num, int ct_code, int tot_rg, int tot_locker, int tot_wear, int tot_income,
			Date income_startdate) {
		super();
		this.income_num = income_num;
		this.ct_code = ct_code;
		this.tot_rg = tot_rg;
		this.tot_locker = tot_locker;
		this.tot_wear = tot_wear;
		this.tot_income = tot_income;
		this.income_startdate = income_startdate;
	}

	public IncomeDto(int i, int ct_code2, int tot_rg2, int tot_locker2, int tot_wear2, int tot_income2,
			String income_startdate2) {
		this.income_num = i;
		this.ct_code = ct_code2;
		this.tot_rg = tot_rg2;
		this.tot_locker = tot_locker2;
		this.tot_wear = tot_wear2;
		this.tot_income = tot_income2;
		this.income_startdate2 = income_startdate2;
	}

	
	
	public String getIncome_startdate2() {
		return income_startdate2;
	}

	public void setIncome_startdate2(String income_startdate2) {
		this.income_startdate2 = income_startdate2;
	}

	public int getIncome_num() {
		return income_num;
	}

	public void setIncome_num(int income_num) {
		this.income_num = income_num;
	}

	public int getCt_code() {
		return ct_code;
	}

	public void setCt_code(int ct_code) {
		this.ct_code = ct_code;
	}

	public int getTot_rg() {
		return tot_rg;
	}

	public void setTot_rg(int tot_rg) {
		this.tot_rg = tot_rg;
	}

	public int getTot_locker() {
		return tot_locker;
	}

	public void setTot_locker(int tot_locker) {
		this.tot_locker = tot_locker;
	}

	public int getTot_wear() {
		return tot_wear;
	}

	public void setTot_wear(int tot_wear) {
		this.tot_wear = tot_wear;
	}

	public int getTot_income() {
		return tot_income;
	}

	public void setTot_income(int tot_income) {
		this.tot_income = tot_income;
	}

	public Date getIncome_startdate() {
		return income_startdate;
	}

	public void setIncome_startdate(Date income_startdate) {
		this.income_startdate = income_startdate;
	}

	@Override
	public String toString() {
		return "IncomeDto [income_num=" + income_num + ", ct_code=" + ct_code + ", tot_rg=" + tot_rg + ", tot_locker="
				+ tot_locker + ", tot_wear=" + tot_wear + ", tot_income=" + tot_income + ", income_startdate="
				+ income_startdate + "]";
	}
	
	
}
