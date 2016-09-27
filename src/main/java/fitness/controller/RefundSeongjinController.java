package fitness.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import fitness.dto.MemberDto;
import fitness.dto.ProgramPriceDto;
import fitness.dto.ProsignDto;
import fitness.dto.PtPriceDto;
import fitness.dto.PtsignDto;
import fitness.dto.RefundSeongjinDto;
import fitness.dto.RegistrationDto;
import fitness.service.RefundSeongjinService;
import fitness.service.RegistrationService;
import page.util.PageUtil;

@Controller
public class RefundSeongjinController {
	@Autowired RefundSeongjinService service;
	@Autowired RegistrationService regiservice;
	
	//--------------------| 환불 등록 페이지로 가기 |--------------------//
	@RequestMapping(value="/SjRefundInsert",method=RequestMethod.GET)
	public String RefundSeongjinInsertForm(){
		return ".RefundSeongjin.SjRefundInsert";
	}
	//--------------------| 환불할 회원 검색하기 |--------------------//
	@RequestMapping(value="/regiRefundList/xml",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String getRefundList(HttpServletRequest req, Model model,@RequestParam(value="pageNum",defaultValue="1") int pageNum){
		String memSearch=req.getParameter("memSearch");
		String keyword=req.getParameter("keyword");
		System.out.println("검색한 search : "+memSearch);
		System.out.println("검색한 keyword : "+keyword);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("memSearch", memSearch);
		map.put("keyword", keyword);
		int totalRowCount=service.getMemSearchCount(map);
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 5, 5);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		System.out.println("전체글의 갯수"+totalRowCount);
		List<RegistrationDto> list=service.memRegiRefundSearch(map);
		System.out.println("검색한 list보기: "+list);
		
		StringBuffer sb=new StringBuffer();
		sb.append("<getmem>");
		sb.append("<paging>");
		sb.append("<memSearch>"+memSearch+"</memSearch>");
		sb.append("<keyword>"+keyword+"</keyword>");
		sb.append("<getPageNum>"+pu.getPageNum()+"</getPageNum>");
		sb.append("<getTotalRowCount>"+pu.getTotalRowCount()+"</getTotalRowCount>");
		sb.append("<getRowBlockCount>"+pu.getRowBlockCount()+"</getRowBlockCount>");
		sb.append("<getPageBlockCount>"+pu.getPageBlockCount()+"</getPageBlockCount>");
		sb.append("<getStartPageNum>"+pu.getStartPageNum()+"</getStartPageNum>");
		sb.append("<getEndPageNum>"+pu.getEndPageNum()+"</getEndPageNum>");
		sb.append("<getTotalPageCount>"+pu.getTotalPageCount()+"</getTotalPageCount>");
		sb.append("</paging>");
		for(RegistrationDto dto:list){
			sb.append("<regi>");
			sb.append("<rg_num>"+dto.getRg_num()+"</rg_num>");
			sb.append("<mem_num>"+dto.getMem_num()+"</mem_num>");
			sb.append("<rg_type>"+dto.getRg_type()+"</rg_type>");
			sb.append("<rg_price>"+dto.getRg_price()+"</rg_price>");
			sb.append("<locker_price>"+dto.getLocker_price()+"</locker_price>");
			sb.append("<wear_price>"+dto.getWear_price()+"</wear_price>");
			sb.append("<signdate>"+dto.getSigndate()+"</signdate>");
			//sb.append("<ct_code>"+dto.getCt_code()+"</ct_code>");
			sb.append("</regi>");
		}
		sb.append("</getmem>");
		System.out.println("toString(): "+sb.toString());
		return sb.toString();
	}
	//--------------------| 환불할 회원 등록지점정보 얻어오기  |--------------------//
	@RequestMapping(value="/regiRefundCenter/xml",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String regiRefundCenter(HttpServletRequest req){//페이징처리(count구하기)
		int mem_num=Integer.parseInt(req.getParameter("mem_num"));
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("mem_num",mem_num);
		MemberDto dto=service.regiRefundCenter(map);
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<ct>");
		sb.append("<ct_code>"+dto.getCt_code()+"</ct_code>");
		sb.append("</ct>");
		System.out.println("toString(): "+sb.toString());
		return sb.toString();
	}
	//------------------|단과과목회원 환불 select(테이블명: prosign/properiod/programprice)|------------------//
	@RequestMapping(value="/simpleSelect/xml",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String simpleSelect(HttpServletRequest req){
		int rg_num=Integer.parseInt(req.getParameter("rg_num"));
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("rg_num",rg_num);
		int simple_oneday=service.calculateSimpleOneday(map);
		int simple_remnant=service.calculateSimpleRemnant(map);
		ProsignDto dto=service.simpleSelect(map);//과목정보 select
		ProgramPriceDto dto2=service.simplePriceSelect(map);//가격정보 select
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<simple>");
		sb.append("<simple_remnant>"+simple_remnant+"</simple_remnant>");
		sb.append("<simple_oneday>"+simple_oneday+"</simple_oneday>");
		sb.append("<rg_num>"+dto.getRg_num()+"</rg_num>");
		sb.append("<mem_num>"+dto.getMem_num()+"</mem_num>");
		sb.append("<pro_name>"+dto.getPro_name()+"</pro_name>");
		sb.append("<pro_code>"+dto.getPro_code()+"</pro_code>");
		sb.append("<pro_signmonth>"+dto.getPro_signmonth()+"</pro_signmonth>");
		sb.append("<pro_regdate>"+dto.getPro_regdate()+"</pro_regdate>");
		sb.append("<pro_expiration>"+dto.getPro_expiration()+"</pro_expiration>");
		sb.append("<pro_price>"+dto2.getPro_price()+"</pro_price>");
		sb.append("</simple>");
		System.out.println("toString(): "+sb.toString());
		return sb.toString();
	}
	//------------------|pt과목회원 환불 select(테이블명: ptsign/ptperiod/ptprice)|------------------//
	@RequestMapping(value="/ptSelect/xml",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String ptSelect(HttpServletRequest req){
		int rg_num=Integer.parseInt(req.getParameter("rg_num"));
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("rg_num",rg_num);
		int pt_oneday=service.calculatePtOneday(map);
		int pt_remnant=service.calculatePtRemnant(map);
		PtsignDto dto=service.ptSelect(map);
		PtPriceDto dto2=service.ptPriceSelect(map);
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<pt>");
		sb.append("<pt_oneday>"+pt_oneday+"</pt_oneday>");
		sb.append("<pt_remnant>"+pt_remnant+"</pt_remnant>");
		sb.append("<rg_num>"+dto.getRg_num()+"</rg_num>");
		sb.append("<mem_num>"+dto.getMem_num()+"</mem_num>");
		sb.append("<getPt_code>"+dto.getPt_code()+"</getPt_code>");
		sb.append("<getPt_name>"+dto.getPt_name()+"</getPt_name>");
		sb.append("<getPtr_count>"+dto.getPtr_count()+"</getPtr_count>");
		sb.append("<getPt_signmonth>"+dto.getPt_signmonth()+"</getPt_signmonth>");
		sb.append("<getPtr_initdate>"+dto.getPtr_initdate()+"</getPtr_initdate>");
		sb.append("<getPt_expiration>"+dto.getPt_expiration()+"</getPt_expiration>");
		sb.append("<pt_price>"+dto2.getPt_price()+"</pt_price>");
		sb.append("</pt>");
		System.out.println("toString(): "+sb.toString());
		return sb.toString();
	}
	//------------------|여러과목회원 환불 select(테이블명: prosign/properiod/programprice/ptsign/ptperiod/ptprice)|------------------//
	@RequestMapping(value="/multiSelect/xml",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String multiSelect(HttpServletRequest req){
		int rg_num=Integer.parseInt(req.getParameter("rg_num"));
		System.out.println("rgnum : "+rg_num);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("rg_num",rg_num);
		int simple_oneday=service.calculateSimpleOneday(map);
		int pt_oneday=service.calculatePtOneday(map);
		int simple_remnant=service.calculateSimpleRemnant(map);
		int pt_remnant=service.calculatePtRemnant(map);
		ProsignDto dto=service.simpleSelect(map);
		PtsignDto dto2=service.ptSelect(map);
		ProgramPriceDto dto3=service.simplePriceSelect(map);//단과가격정보 select
		PtPriceDto dto4=service.ptPriceSelect(map);//pt가격정보
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<multi>");
		sb.append("<rg_num>"+dto.getRg_num()+"</rg_num>");
		sb.append("<mem_num>"+dto.getMem_num()+"</mem_num>");
		sb.append("<rg_num>"+dto.getRg_num()+"</rg_num>");
		sb.append("<mem_num>"+dto.getMem_num()+"</mem_num>");
		sb.append("<pro_name>"+dto.getPro_name()+"</pro_name>");
		sb.append("<pro_code>"+dto.getPro_code()+"</pro_code>");
		sb.append("<pro_signmonth>"+dto.getPro_signmonth()+"</pro_signmonth>");
		sb.append("<pro_regdate>"+dto.getPro_regdate()+"</pro_regdate>");
		sb.append("<pro_expiration>"+dto.getPro_expiration()+"</pro_expiration>");
		sb.append("<getPt_code>"+dto2.getPt_code()+"</getPt_code>");
		sb.append("<getPt_name>"+dto2.getPt_name()+"</getPt_name>");
		sb.append("<getPtr_count>"+dto2.getPtr_count()+"</getPtr_count>");
		sb.append("<getPt_signmonth>"+dto2.getPt_signmonth()+"</getPt_signmonth>");
		sb.append("<getPtr_initdate>"+dto2.getPtr_initdate()+"</getPtr_initdate>");
		sb.append("<getPt_expiration>"+dto2.getPt_expiration()+"</getPt_expiration>");
		sb.append("<pro_price>"+dto3.getPro_price()+"</pro_price>");
		sb.append("<pt_price>"+dto4.getPt_price()+"</pt_price>");
		sb.append("<simple_oneday>"+simple_oneday+"</simple_oneday>");
		sb.append("<pt_oneday>"+pt_oneday+"</pt_oneday>");
		sb.append("<simple_remnant>"+simple_remnant+"</simple_remnant>");
		sb.append("<pt_remnant>"+pt_remnant+"</pt_remnant>");
		sb.append("</multi>");
		System.out.println("toString(): "+sb.toString());
		return sb.toString();
	}
	//--------------------| 환불 등록 |--------------------//
	@RequestMapping(value="/RefundSeongjinInsert",method=RequestMethod.POST)
	public String RefundSeongjinInsert(RefundSeongjinDto dto,HttpServletRequest req){
		System.out.println("환불 Controller 도착!!");
		int rg_num=Integer.parseInt(req.getParameter("rg_num"));
		String rg_type=req.getParameter("rg_type");
		System.out.println("rg_num: "+rg_num);
		System.out.println("rg_type: "+rg_type);
		try{
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("rg_num", rg_num);
			map.put("rg_type", rg_type);
			System.out.println("map: "+map.get("rg_num"));
			System.out.println("map: "+map.get("rg_type"));
			System.out.println("regi Map: "+map);
			if(rg_type.equals("단과과목")){
				regiservice.prosignDel(rg_num);
				regiservice.properiodDel(rg_num);
				regiservice.regiDel(rg_num);
			}else if(rg_type.equals("PT")){
				regiservice.ptsignDel(rg_num);
				regiservice.ptperiodDel(rg_num);
				regiservice.regiDel(rg_num);
			}else{
				regiservice.prosignDel(rg_num);
				regiservice.ptsignDel(rg_num);
				regiservice.properiodDel(rg_num);
				regiservice.ptperiodDel(rg_num);
				regiservice.regiDel(rg_num);
			}
			int n=service.refundSeongjinInsert(dto);
			System.out.println("환불테이블에 입력되나??: "+n);
			req.setAttribute("result", "환불 완료");	
		}catch(Exception e){
			System.out.println(e.getMessage());
			req.setAttribute("result", "환불 실패");	
		}
		return ".staff.ResultView";
	}
}
