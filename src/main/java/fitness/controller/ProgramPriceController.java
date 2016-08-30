package fitness.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import fitness.dto.MemberDto;
import fitness.dto.ProgramPriceDto;
import fitness.dto.PtPriceDto;
import fitness.service.ProgramPriceService;

@Controller
public class ProgramPriceController {
	@Autowired private ProgramPriceService service;
	//------------------|단과과목 select(테이블명: programprice)|------------------//
	@RequestMapping(value="/list/xml",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String getNameList(){
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		List<ProgramPriceDto> list=service.list(map);
		
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<proname>");
		for(ProgramPriceDto dto:list){
			sb.append("<pro>");
			sb.append("<pro_num>"+dto.getPro_num()+"</pro_num>");
			sb.append("<pro_code>"+dto.getPro_code()+"</pro_code>");
			sb.append("<pro_name>"+dto.getPro_name()+"</pro_name>");
			sb.append("<pro_price>"+dto.getPro_price()+"</pro_price>");
			sb.append("</pro>");
		}
		sb.append("</proname>");
		System.out.println("ddd:" + sb.toString());
		return sb.toString();
	}
	
	@RequestMapping(value="/proprice/xml",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String proPrice(String pro_name){//select박스에서 프로그램 선택하면 input박스에 가격넣기
		System.out.println("컨트롤러까지 오나??"+pro_name);
		ProgramPriceDto dto=service.proPirce(pro_name);
		
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<proprice>");
		sb.append("<pro_num>"+dto.getPro_num()+"</pro_num>");
		sb.append("<pro_code>"+dto.getPro_code()+"</pro_code>");
		sb.append("<pro_name>"+dto.getPro_name()+"</pro_name>");
		sb.append("<pro_price>"+dto.getPro_price()+"</pro_price>");
		sb.append("</proprice>");
		System.out.println("proprice:" + sb.toString());
		return sb.toString();
		
	}
		
	//------------------|pt과목 select(테이블명: ptprice)|------------------//
	@RequestMapping(value="/ptlist/xml",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String getPtNameList(){
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		List<PtPriceDto> list=service.ptlist(map);
		
		StringBuffer br=new StringBuffer();
		br.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		br.append("<ptname>");
		for(PtPriceDto dto:list){
			br.append("<pt>");
			br.append("<pt_num>"+dto.getPt_num()+"</pt_num>");
			br.append("<pt_code>"+dto.getPt_code()+"</pt_code>");
			br.append("<pt_month>"+dto.getPt_month()+"</pt_month>");
			br.append("<pt_cnt>"+dto.getPt_cnt()+"</pt_cnt>");
			br.append("<pt_price>"+dto.getPt_price()+"</pt_price>");
			br.append("</pt>");
		}
		br.append("</ptname>");
		System.out.println("ptpt: "+br.toString());
		return br.toString();
	}
	@RequestMapping(value="/ptprice/xml",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String ptPrice(String pt_month){//select박스에서 프로그램 선택하면 input박스에 가격넣기
		System.out.println("pt가격 컨트롤러: "+pt_month);
		PtPriceDto dto=service.ptPrice(pt_month);
		System.out.println("pt dto: "+dto);
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<ptprice>");
		sb.append("<pt_num>"+dto.getPt_num() +"</pt_num>");
		sb.append("<pt_code>"+dto.getPt_code()+"</pt_code>");
		sb.append("<pt_month>"+dto.getPt_month()+"</pt_month>");
		sb.append("<pt_price>"+dto.getPt_price()+"</pt_price>");
		sb.append("<pt_cnt>"+dto.getPt_cnt()+"</pt_cnt>");
		sb.append("</ptprice>");
		System.out.println("ptprice:" + sb.toString());
		return sb.toString();
	}
}
