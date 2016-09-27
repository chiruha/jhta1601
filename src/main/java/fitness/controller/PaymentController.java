package fitness.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
		try{
			System.out.println("payinsert : "+dto.toString()+", dto"+dto.getPay_tot());
				if(dto.getPay_tot()>0){
					ps.insertService(dto);
					session.setAttribute("result", "월급지급 완료");
					return ".staff.ResultView";
				}
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return ".payment.PayInsertView";
	}
	@RequestMapping(value="/xmlslist",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String stflist(HttpServletRequest request,@RequestParam(value="pageNum",defaultValue="1") int pageNum){
		String stype=request.getParameter("ptype");
		String pkeyword=request.getParameter("pkeyword");
		System.out.println("xmlslist stype : "+stype+", pkeyword : "+pkeyword);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("stype", stype);
		map.put("keyword", pkeyword);
		int totalRowCount=sts.getStfCount(map);
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 5, 5);
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

	@RequestMapping(value="/xmlpay",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String paycul(@RequestParam(value="stf_num",defaultValue="0") int stf_num, HttpServletRequest request,
			@RequestParam(value="start_date",defaultValue="0") String start_date){
		HashMap<String, Object> map=new HashMap<String, Object>();
		StringBuffer sb=new StringBuffer();
		try{
				map.put("start_date", start_date);
				map.put("stf_num", stf_num);
				int wsum=ps.spayService(map);
				System.out.println("payCtr num : "+stf_num +", date : "+start_date+", spay : "+wsum);
				StaffDto sdto=sts.detailService(stf_num);
				PositionDto pdto=pos.detailService(sdto.getPos_code());
				String pc=pdto.getPos_code();
				int rpay=0;
				int tpay=0;
				int pay_tot=0;
				if(pc.equals("A")) {rpay=5000000; pay_tot=rpay;}
				if(pc.equals("B")) {rpay=4000000; pay_tot=rpay;}
				if(pc.equals("C")||pc.equals("D")) {rpay=3000000; pay_tot=rpay;}
				if(pc.equals("E")||pc.equals("I")||pc.equals("K")) {rpay=2000000; pay_tot=rpay;}
				if(pc.equals("F1")) {tpay=35000; pay_tot=tpay*wsum;}
				if(pc.equals("F2")) {tpay=40000; pay_tot=tpay*wsum;}
				if(pc.equals("G1")) {rpay=1500000; tpay=5000; pay_tot=rpay+tpay*wsum;}
				if(pc.equals("G2")) {rpay=2000000; tpay=5000;	pay_tot=rpay+tpay*wsum;}
				if(pc.equals("H")||pc.equals("L")) {rpay=150; pay_tot=rpay;}
				if(pc.equals("J")) {rpay=80; pay_tot=rpay;}
				sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
				sb.append("<cul>");
				sb.append("<stf_num>"+sdto.getStf_num()+"</stf_num>");
				sb.append("<stf_name>"+sdto.getStf_name()+"</stf_name>");
				sb.append("<stf_phone>"+sdto.getStf_phone()+"</stf_phone>");
				sb.append("<pos_name>"+pdto.getPos_name()+"</pos_name>");
				sb.append("<pos_code>"+pdto.getPos_code()+"</pos_code>");
				sb.append("<wsum>"+wsum+"</wsum>");
				sb.append("<rpay>"+rpay+"</rpay>");
				sb.append("<tpay>"+tpay+"</tpay>");
				sb.append("<pay_tot>"+pay_tot+"</pay_tot>");
				sb.append("</cul>");
		
				System.out.println("cul : "+sb.toString());
		}catch(Exception e){
			request.setAttribute("emsg", "해당 기간에 조회된 정보가 없습니다, 다시 조회하세요!");
			System.out.println("오류 : "+e.getMessage()+" sb : "+sb.toString());
		}
		return sb.toString();
		
	}
	@RequestMapping("/paylist")
	public String paylist( HttpServletRequest request,@RequestParam(value="pageNum",defaultValue="1") int pageNum,
		HttpSession session){
		Date today=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
		String start_date=sdf.format(today);
		String date=request.getParameter("start_date");
		if(date!=null&&date!="") start_date=date;
		String ptype=request.getParameter("ptype");
		String pkeyword=request.getParameter("pkeyword");
		String stf_num=request.getParameter("stf_num");
		HashMap<String, Object>map=new HashMap<String, Object>();
		map.put("stf_num", stf_num);
		map.put("ptype", ptype);
		map.put("keyword", pkeyword);
		map.put("start_date", start_date);
		int totalRowCount=ps.payCnt(map);
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 10, 5);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<PaymentDto> paylist=ps.payList(map);
		System.out.println("stf_num : "+stf_num+", ptype : "+ptype+", key : "+pkeyword);
		System.out.println("paylist : "+paylist);
		session.setAttribute("ptype", ptype);
		session.setAttribute("pkeyword", pkeyword);
		session.setAttribute("pstf_num", stf_num);
		session.setAttribute("start_date", start_date);
		session.setAttribute("paylist", paylist);
		session.setAttribute("pu", pu);
		
		return ".payment.PayListView";
	}
	
	
}
