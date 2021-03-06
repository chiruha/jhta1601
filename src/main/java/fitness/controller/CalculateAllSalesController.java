package fitness.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import fitness.dto.CenterTotalSalesDto;
import fitness.dto.IncomeDto;
import fitness.dto.RefundSeongjinDto;
import fitness.service.CalculateAllSalesService;

@Controller
public class CalculateAllSalesController {
	@Autowired CalculateAllSalesService service;
	//--------------------| 지점 매출계산하기 페이지로 가기 |--------------------//
	@RequestMapping(value="/centertotalsalesInsert",method=RequestMethod.GET)
	public String salesInsertForm(){
		return ".sales.calculateAllSales";
	}
	//------------------|지점별 수입 검색하기(테이블명: income)|------------------//
	@RequestMapping(value="/centerIncomeSelect/xml",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String centerIncomeSelect(String searchMonth,String centerList){
		System.out.println("검색조건 date: "+searchMonth);
		System.out.println("검색조건 center: "+centerList);
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("searchMonth", searchMonth);
		map.put("centerList", centerList);
		
		//int totProgram=0;
		//int totLocker=0;
		//int totWear=0;
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<getSales>");
		List<IncomeDto> list=service.centerIncomeSelect(map);
		
			//totProgram+=dto.getRg_price();
			//totLocker+=dto.getLocker_price();
			//totWear+=dto.getWear_price();
			
		for(IncomeDto dto:list){
			sb.append("<result>");
			sb.append("<getIncome_num>"+dto.getIncome_num()+"</getIncome_num>");
			sb.append("<getCt_code>"+dto.getCt_code()+"</getCt_code>");
			sb.append("<getTot_rg>"+dto.getTot_rg()+"</getTot_rg>");
			sb.append("<getTot_locker>"+dto.getTot_locker()+"</getTot_locker>");
			sb.append("<getTot_wear>"+dto.getTot_wear()+"</getTot_wear>");
			sb.append("<getTot_income>"+dto.getTot_income()+"</getTot_income>");
			sb.append("<getIncome_startdate>"+dto.getIncome_startdate()+"</getIncome_startdate>");
			sb.append("</result>");
		}
		
		
		//System.out.println("totProgram: "+totProgram);
		//System.out.println("totLocker: "+totLocker);
		//System.out.println("totWEar: "+totWear);
		//sb.append("<sum>");
		//sb.append("<searchMonth>"+searchMonth+"</searchMonth>");
		//sb.append("<totProgram>"+totProgram+"</totProgram>");
		//sb.append("<totLocker>"+totLocker+"</totLocker>");
		//sb.append("<totWear>"+totWear+"</totWear>");
		//sb.append("</sum>");
		
			sb.append("</getSales>");
		System.out.println("toString(): "+sb.toString());
		return sb.toString();
	}


	//------------------|지점별 환불 검색하기(테이블명: refund)|------------------//
		@RequestMapping(value="/centerRefundSelect/xml",produces="application/xml;charset=utf-8")
		@ResponseBody
		public String centerrefundselect(String searchMonth1,String centerList1){
			System.out.println("centerrefundselect 검색조건 date: "+searchMonth1);
			System.out.println("centerrefundselect 검색조건 center: "+centerList1);
			
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("searchMonth", searchMonth1);
			map.put("centerList", centerList1);
			
			//int totProgram=0;
			//int totLocker=0;
			//int totWear=0;
			StringBuffer sb=new StringBuffer();
			sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
			sb.append("<getRefund>");
			List<RefundSeongjinDto> list=service.centerrefundselect(map);
			
				//totProgram+=dto.getRg_price();
				//totLocker+=dto.getLocker_price();
				//totWear+=dto.getWear_price();
			System.out.println("환불리스트 ;;;;;;;"+list);
			for(RefundSeongjinDto dto:list){
				sb.append("<result>");
				sb.append("<getRefund_num>"+dto.getRefund_num()+"</getRefund_num>");
				sb.append("<getMem_num>"+dto.getMem_num()+"</getMem_num>");
				sb.append("<getRefund_date>"+dto.getRefund_date()+"</getRefund_date>");
				sb.append("<getRg_num>"+dto.getRg_num()+"</getRg_num>");
				sb.append("<getCt_code>"+dto.getCt_code()+"</getCt_code>");
				sb.append("<getRg_type>"+dto.getRg_type()+"</getRg_type>");
				sb.append("<getRefund_price>"+dto.getRefund_price()+"</getRefund_price>");
				sb.append("</result>");
			}
			
			
			//System.out.println("totProgram: "+totProgram);
			//System.out.println("totLocker: "+totLocker);
			//System.out.println("totWEar: "+totWear);
			//sb.append("<sum>");
			//sb.append("<searchMonth>"+searchMonth+"</searchMonth>");
			//sb.append("<totProgram>"+totProgram+"</totProgram>");
			//sb.append("<totLocker>"+totLocker+"</totLocker>");
			//sb.append("<totWear>"+totWear+"</totWear>");
			//sb.append("</sum>");
			
			sb.append("</getRefund>");
			System.out.println("toString(): "+sb.toString());
			return sb.toString();
		}
	//--------------------| 지점 매출계산 insert 하기 |--------------------//
	@RequestMapping(value="/totalSalesInsert",method=RequestMethod.POST)
	public String ctsInsert(CenterTotalSalesDto dto,HttpServletRequest req){
		int ct_code=Integer.parseInt(req.getParameter("ct_code"));
		int cts_income=Integer.parseInt(req.getParameter("cts_income"));
		int cts_refund=Integer.parseInt(req.getParameter("cts_refund"));
		int cts_totsales=Integer.parseInt(req.getParameter("cts_totsales"));
		String cts_date=req.getParameter("cts_date");
		System.out.println("매출계산 컨트롤러에 도착했나??"+ct_code+","+cts_income+","+cts_refund+","+cts_totsales+","+cts_date);
		System.out.println("매출계산 디티오 : "+dto);
		try{
			service.ctsInsert(new CenterTotalSalesDto(0, ct_code, cts_income, cts_refund, cts_totsales, cts_date));
			req.setAttribute("result", "지점별 월매출 계산 완료");
		}catch(Exception e){
			System.out.println(e.getMessage());
			req.setAttribute("result", "지점별 월매출 실패");	
		}
		return ".staff.ResultView";
	}	

}