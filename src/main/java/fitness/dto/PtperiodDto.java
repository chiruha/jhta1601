package fitness.dto;

import java.sql.Date;

public class PtperiodDto {
	private int ptperiod_num;
	private int rg_num;//등록번호 references registration(rg_num)
	private int mem_num;
	private int pt_signmonth;//등록개월수
	private Date ptr_initdate;//운동시작일
	private Date pt_expiration;//운동만료일
	
	public PtperiodDto() {}

	public PtperiodDto(int ptperiod_num, int rg_num, int mem_num, int pt_signmonth, Date ptr_initdate,
			Date pt_expiration) {
		super();
		this.ptperiod_num = ptperiod_num;
		this.rg_num = rg_num;
		this.mem_num = mem_num;
		this.pt_signmonth = pt_signmonth;
		this.ptr_initdate = ptr_initdate;
		this.pt_expiration = pt_expiration;
	}

	public int getPtperiod_num() {
		return ptperiod_num;
	}

	public void setPtperiod_num(int ptperiod_num) {
		this.ptperiod_num = ptperiod_num;
	}

	public int getRg_num() {
		return rg_num;
	}

	public void setRg_num(int rg_num) {
		this.rg_num = rg_num;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public int getPt_signmonth() {
		return pt_signmonth;
	}

	public void setPt_signmonth(int pt_signmonth) {
		this.pt_signmonth = pt_signmonth;
	}

	public Date getPtr_initdate() {
		return ptr_initdate;
	}

	public void setPtr_initdate(Date ptr_initdate) {
		this.ptr_initdate = ptr_initdate;
	}

	public Date getPt_expiration() {
		return pt_expiration;
	}

	public void setPt_expiration(Date pt_expiration) {
		this.pt_expiration = pt_expiration;
	}

	@Override
	public String toString() {
		return "PtperiodDto [ptperiod_num=" + ptperiod_num + ", rg_num=" + rg_num + ", mem_num=" + mem_num
				+ ", pt_signmonth=" + pt_signmonth + ", ptr_initdate=" + ptr_initdate + ", pt_expiration="
				+ pt_expiration + "]";
	}

	
}
