package fitness.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import fitness.dto.PaymentDto;
import fitness.dto.PositionDto;
import fitness.dto.StaffDto;
import fitness.service.PaymentService;
import fitness.service.PositionService;
import fitness.service.StaffService;
import page.util.PageUtil;

@Controller
public class PaymentController {
	@Autowired private PaymentService ps;
	@Autowired private StaffService sts;
	@Autowired private PositionService pos;
	@RequestMapping(value="/wsum", produces="application/xml;charset=utf-8")
	@ResponseBody
	public String getWSum(@RequestParam(value="stf_num", defaultValue="0") int stf_num, HttpServletRequest request){
		String start_date=request.getParameter("start_date");
		System.out.println("sdate : "+start_date+", stf_num : "+stf_num);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("stf_num", stf_num);
		map.put("start_date", start_date);
		StringBuffer sb=new StringBuffer();
		int wsum=ps.spayService(map);
		System.out.println("wsum : "+wsum);
		sb.append("<?xml version=\"\1.0\" encoding=\"UTF-8\"?>");
		sb.append("<wsum>"+wsum+"</wsum>");
		
		return sb.toString();
	}
	@RequestMapping("/payinsert")
	public String insert(HttpSession session,PaymentDto dto){
		System.out.println(dto.toString()+", dto"+dto.getPay_tot());
		return ".payment.PayInsertView";
	}
	@RequestMapping(value="/xmlslist",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String getMemnum(HttpServletRequest request,@RequestParam(value="pageNum",defaultValue="1") int pageNum){
		String stype=request.getParameter("ptype");
		String pkeyword=request.getParameter("pkeyword");
		System.out.println("stype : "+stype+"pkeyword : "+pkeyword);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("stype", stype);
		map.put("keyword", pkeyword);
		int totalRowCount=sts.getStfCount(map);
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 10, 5);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<StaffDto> slist=sts.listService(map);

		System.out.println("slist : "+slist);
	
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<staffs>");
		sb.append("<paging>");
		sb.append("<ptype>"+stype+"</ptype>");
		sb.append("<pkeyword>"+pkeyword+"</pkeyword>");
		sb.append("<getPageNum>"+pu.getPageNum()+"</getPageNum>");
		sb.append("<getTotalRowCount>"+pu.getTotalRowCount()+"</getTotalRowCount>");
		sb.append("<getRowBlockCount>"+pu.getRowBlockCount()+"</getRowBlockCount>");
		sb.append("<getPageBlockCount>"+pu.getPageBlockCount()+"</getPageBlockCount>");
		sb.append("<getStartPageNum>"+pu.getStartPageNum()+"</getStartPageNum>");
		sb.append("<getEndPageNum>"+pu.getEndPageNum()+"</getEndPageNum>");
		sb.append("<getTotalPageCount>"+pu.getTotalPageCount()+"</getTotalPageCount>");
		sb.append("</paging>");
		for(StaffDto sdto:slist){
			PositionDto pdto=pos.detailService(sdto.getPos_code());
			System.out.println(pos.toString());
			sb.append("<staff>");
			sb.append("<stf_num>"+sdto.getStf_num()+"</stf_num>");
			sb.append("<stf_name>"+sdto.getStf_name()+"</stf_name>");
			sb.append("<stf_phone>"+sdto.getStf_phone()+"</stf_phone>");
			sb.append("<pos_name>"+pdto.getPos_name()+"</pos_name>");
			sb.append("</staff>");
		}
		
		sb.append("</staffs>");
		System.out.println("xml : "+sb.toString());
		return sb.toString();
	}
	
}
