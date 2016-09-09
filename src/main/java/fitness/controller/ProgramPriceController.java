package fitness.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import fitness.dto.MemberDto;
import fitness.dto.ProgramPriceDto;
import fitness.dto.PtPriceDto;
import fitness.service.MemberService;
import fitness.service.ProgramPriceService;
import page.util.PageUtil;

@Controller
public class ProgramPriceController {
	@Autowired private ProgramPriceService service;
	@Autowired private MemberService memservice;
	//------------------|ȸ����ȣ �˻��ϱ�(���̺��: member)|------------------//
	@RequestMapping(value="/memlist/xml",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String getMemnum(HttpServletRequest request,Model model,@RequestParam(value="pageNum",defaultValue="1") int pageNum){
		String memSearch=request.getParameter("memSearch");
		String keyword=request.getParameter("keyword");
		System.out.println("�˻��� search : "+memSearch);
		System.out.println("�˻��� keyword : "+keyword);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("memSearch", memSearch);
		map.put("keyword", keyword);
		int totalRowCount=memservice.getMemSearchCount(map);
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 5, 5);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		System.out.println("��ü���� ����"+totalRowCount);
		List<MemberDto> list=service.memNum(map);

		System.out.println("�˻��� ���� : "+list);
	
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
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
		for(MemberDto dto:list){
			sb.append("<mem>");
			sb.append("<mem_num>"+dto.getMem_num()+"</mem_num>");
			sb.append("<mem_name>"+dto.getMem_name()+"</mem_name>");
			sb.append("<mem_phone>"+dto.getMem_phone()+"</mem_phone>");
			sb.append("</mem>");
		}
		
		sb.append("</getmem>");
		System.out.println("toString(): "+sb.toString());
		return sb.toString();
	}
	
	//------------------|�ܰ����� select(���̺��: programprice)|------------------//
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
			sb.append("<pro_signmonth>"+dto.getPro_signmonth()+"</pro_signmonth>");
			sb.append("<pro_price>"+dto.getPro_price()+"</pro_price>");
			sb.append("</pro>");
		}
		sb.append("</proname>");
		System.out.println("ddd:" + sb.toString());
		return sb.toString();
	}
	
	@RequestMapping(value="/proprice/xml",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String proPrice(String pro_name){//select�ڽ����� ���α׷� �����ϸ� input�ڽ��� ���ݳֱ�
		System.out.println("��Ʈ�ѷ����� ����??"+pro_name);
		ProgramPriceDto dto=service.proPirce(pro_name);
		
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<proprice>");
		sb.append("<pro_num>"+dto.getPro_num()+"</pro_num>");
		sb.append("<pro_code>"+dto.getPro_code()+"</pro_code>");
		sb.append("<pro_name>"+dto.getPro_name()+"</pro_name>");
		sb.append("<pro_signmonth>"+dto.getPro_signmonth()+"</pro_signmonth>");
		sb.append("<pro_price>"+dto.getPro_price()+"</pro_price>");
		sb.append("</proprice>");
		System.out.println("proprice:" + sb.toString());
		return sb.toString();
		
	}
		
	//------------------|pt���� select(���̺��: ptprice)|------------------//
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
			br.append("<pt_name>"+dto.getPt_name()+"</pt_name>");
			br.append("<ptr_count>"+dto.getPtr_count() +"</ptr_count>");
			br.append("<pt_signmonth>"+dto.getPt_signmonth()+"</pt_signmonth>");
			br.append("<pt_price>"+dto.getPt_price()+"</pt_price>");
			br.append("</pt>");
		}
		br.append("</ptname>");
		System.out.println("ptpt: "+br.toString());
		return br.toString();
	}
	@RequestMapping(value="/ptprice/xml",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String ptPrice(String pt_name){//select�ڽ����� ���α׷� �����ϸ� input�ڽ��� ���ݳֱ�
		System.out.println("pt���� ��Ʈ�ѷ�: "+pt_name);
		PtPriceDto dto=service.ptPrice(pt_name);
		System.out.println("pt dto: "+dto);
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<ptprice>");
		sb.append("<pt_num>"+dto.getPt_num() +"</pt_num>");
		sb.append("<pt_code>"+dto.getPt_code()+"</pt_code>");
		sb.append("<pt_name>"+dto.getPt_name()+"</pt_name>");
		sb.append("<pt_price>"+dto.getPt_price()+"</pt_price>");
		sb.append("<pt_signmonth>"+dto.getPt_signmonth()+"</pt_signmonth>");
		sb.append("<ptr_count>"+dto.getPtr_count()+"</ptr_count>");
		sb.append("</ptprice>");
		System.out.println("ptprice:" + sb.toString());
		return sb.toString();
	}
}
