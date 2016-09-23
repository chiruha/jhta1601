package fitness.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import fitness.dto.CenterDto;
import fitness.dto.SalesSelectDto;
import fitness.service.CenterService;
import fitness.service.centerSalesSelectService;

@Controller
public class CenterSalesCalculateController {
	@Autowired private centerSalesSelectService service;
	@Autowired private CenterService centerservice;//지점목록 뽑아오기
	//--------------------| 지점 매출계산하기 페이지로 가기 |--------------------//
	@RequestMapping(value="/incomeInsert",method=RequestMethod.GET)
	public String salesInsertForm(){
		return ".sales.centerIncomeInsert";
	}
	//------------------|지점 List 뽑아서 selectBox에 넣기(테이블명: center)|------------------//
	@RequestMapping(value="/salesCenterList/xml",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String salesCenterList(){
		List<CenterDto> ctlist=centerservice.listService();
		StringBuffer br=new StringBuffer();
		br.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		br.append("<ctlist>");
		for(CenterDto dto:ctlist){
			br.append("<ct>");
			br.append("<ctcode>"+dto.getCt_code()+"</ctcode>");
			br.append("<ctname>"+dto.getCt_name()+"</ctname>");
			br.append("</ct>");
		}
		br.append("</ctlist>");
		System.out.println("Ctlist: "+br.toString());
		return br.toString();
	}
	//------------------|지점별 매출 검색하기(테이블명: member&registration join해서)|------------------//
	@RequestMapping(value="/salesSelect/xml",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String monthSelectSales(HttpServletRequest req,Model model){
		String searchMonth=req.getParameter("searchMonth");
		String centerList=req.getParameter("centerList");
		System.out.println("검색조건 date: "+searchMonth);
		System.out.println("검색조건 center: "+centerList);
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("searchMonth", searchMonth);
		map.put("centerList", centerList);
		List<SalesSelectDto> list=service.monthSelectSales(map);
		
		System.out.println("검색어 보기: "+list);
		int totProgram=0;
		int totLocker=0;
		int totWear=0;
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<getSales>");
		for(SalesSelectDto dto:list){
			totProgram+=dto.getRg_price();
			totLocker+=dto.getLocker_price();
			totWear+=dto.getWear_price();
			sb.append("<result>");
			sb.append("<mem_num>"+dto.getMem_num()+"</mem_num>");
			sb.append("<ct_code>"+dto.getCt_code()+"</ct_code>");
			sb.append("<rg_num>"+dto.getRg_num()+"</rg_num>");
			sb.append("<rg_price>"+dto.getRg_price()+"</rg_price>");
			sb.append("<locker_price>"+dto.getLocker_price()+"</locker_price>");
			sb.append("<wear_price>"+dto.getWear_price()+"</wear_price>");
			sb.append("<rg_type>"+dto.getRg_type()+"</rg_type>");
			sb.append("<signdate>"+dto.getSigndate()+"</signdate>");
			
			sb.append("</result>");
		}
		
		System.out.println("totProgram: "+totProgram);
		System.out.println("totLocker: "+totLocker);
		System.out.println("totWEar: "+totWear);
		sb.append("<sum>");
		sb.append("<searchMonth>"+searchMonth+"</searchMonth>");
		sb.append("<totProgram>"+totProgram+"</totProgram>");
		sb.append("<totLocker>"+totLocker+"</totLocker>");
		sb.append("<totWear>"+totWear+"</totWear>");
		sb.append("</sum>");
		sb.append("</getSales>");
		System.out.println("toString(): "+sb.toString());
		return sb.toString();
	}
}
