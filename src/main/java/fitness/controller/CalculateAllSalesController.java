package fitness.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import fitness.dto.IncomeDto;
import fitness.service.CalculateAllSalesService;

@Controller
public class CalculateAllSalesController {
	@Autowired CalculateAllSalesService service;
	//--------------------| 지점 매출계산하기 페이지로 가기 |--------------------//
	@RequestMapping(value="/centertotalsalesInsert",method=RequestMethod.GET)
	public String salesInsertForm(){
		return ".sales.calculateAllSales";
	}
	//------------------|지점별 매출 검색하기(테이블명: member&registration join해서)|------------------//
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
	//------------------|지점별 매출 검색하기(테이블명: member&registration join해서)|------------------//
		@RequestMapping(value="/centerRefundSelect/xml",produces="application/xml;charset=utf-8")
		@ResponseBody
		public String centerRefundSelect(String searchMonth1,String centerList1){
			System.out.println("검색조건 date: "+searchMonth1);
			System.out.println("검색조건 center: "+centerList1);
			
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("searchMonth", searchMonth1);
			map.put("centerList", centerList1);
			
			//int totProgram=0;
			//int totLocker=0;
			//int totWear=0;
			StringBuffer sb=new StringBuffer();
			sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
			sb.append("<getSales>");
			//List<IncomeDto> list=service.centerIncomeSelect(map);
			
				//totProgram+=dto.getRg_price();
				//totLocker+=dto.getLocker_price();
				//totWear+=dto.getWear_price();
			/*
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
			*/
			sb.append("</getSales>");
			System.out.println("toString(): "+sb.toString());
			return sb.toString();
		}
}