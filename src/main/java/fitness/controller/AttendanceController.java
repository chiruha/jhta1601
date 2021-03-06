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

import fitness.dto.CenterDto;
import fitness.dto.Mem_attDto;
import fitness.dto.Stf_attDto;
import fitness.service.CenterService;
import fitness.service.Mem_attService;
import fitness.service.PaymentService;
import fitness.service.Stf_attService;
import page.util.PageUtil;

@Controller
public class AttendanceController {
	@Autowired private Stf_attService ss;
	@Autowired private Mem_attService ms;
	@Autowired private CenterService cs;
	@Autowired private PaymentService ps;
	Date today=new Date();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
	
	@RequestMapping("/attcheck")
	public String check(int num, String type,	HttpSession session){
		System.out.println("attCtr num : "+ num +", type : "+type);
		List<CenterDto> ctlist=cs.listService();
		session.setAttribute("ctlist", ctlist);
		return ".attendance.AttInsertView";
	}
	@RequestMapping("/attinsert")
	public String attinsert(@RequestParam(value="snum", defaultValue="0") int snum,
											@RequestParam(value="mnum", defaultValue="0") int mnum, 
											int ct_code,	HttpSession session){
		try{
			System.out.println("snum : "+snum+", mnum : "+mnum+", ct_code : "+ct_code);
			if(mnum>0){
				Mem_attDto mdto=new Mem_attDto(0, null, null, 0, mnum, null, null, 0, null, ct_code, null);
				ms.insertService(mdto);
			}else if(snum>0){
				Stf_attDto sdto=new Stf_attDto(0, null, null, 0, snum, null, null, 0, null, ct_code, null);
				ss.insertService(sdto);
			}
			session.setAttribute("result", "출석 체크되셨습니다.");
		}catch(Exception e){
			System.out.println(e.getMessage());
			session.setAttribute("result", "출석 체크 실패");
		}
		return ".staff.ResultView";
	}
	
	
	@RequestMapping("/mlistAll")
	public String MlistAll(	HttpSession session,@RequestParam(value="pageNum", defaultValue="1") int pageNum,HttpServletRequest request){
		String mtype=request.getParameter("mtype");
		String matt_keyword=request.getParameter("matt_keyword");
		System.out.println("(matt) mtype: "+mtype+", 검색어: "+matt_keyword);
		try{
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("mtype", mtype);
			map.put("matt_keyword", matt_keyword);
			int totalRowCount=ms.mattCnt(map);
			System.out.println("mattCnt : "+totalRowCount);
			PageUtil pu=new PageUtil(pageNum, totalRowCount,10,5);
			map.put("startRow", pu.getStartRow());
			map.put("endRow", pu.getEndRow());
			List<Mem_attDto> mattlist=ms.listService(map);
			session.setAttribute("mattlist", mattlist);
			System.out.println("mattlist컨트롤 :"+mattlist);
			System.out.println(pu.toString());
			session.setAttribute("mtype",mtype); 
			session.setAttribute("matt_keyword", matt_keyword);
			session.setAttribute("pu", pu);
		}catch(Exception e){
			System.out.println("오류 : "+e.getMessage());
		}
		return ".attendance.MAttListView";
	}
	@RequestMapping("/mattupdate")
	public String mupdate(@RequestParam(value="matt_num", defaultValue="0") int matt_num){
		System.out.println("mattup : "+matt_num);
		try{
			ms.updateService(matt_num);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return "forward: mlistAll";
	}
	
	@RequestMapping("/slistAll")
	public String SlistAll(	HttpSession session,@RequestParam(value="pageNum", defaultValue="1") int pageNum,HttpServletRequest request){
		String stype=request.getParameter("stype");
		String satt_keyword=request.getParameter("satt_keyword");
		try{
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("stype", stype);
			map.put("satt_keyword", satt_keyword);
			int totalRowCount=ss.sattCnt(map);
			System.out.println("(satt) stype: "+stype+", 검색어: "+satt_keyword+", sattCnt : "+totalRowCount);
			PageUtil pu=new PageUtil(pageNum, totalRowCount,10,5);
			map.put("startRow", pu.getStartRow());
			map.put("endRow", pu.getEndRow());
			List<Stf_attDto> sattlist=ss.listService(map);
			session.setAttribute("sattlist", sattlist);
			System.out.println("sattlist컨트롤 :"+sattlist);
			System.out.println(pu.toString());
			session.setAttribute("stype",stype); 
			session.setAttribute("satt_keyword", satt_keyword);
			session.setAttribute("pu", pu);
		}catch(Exception e){
			System.out.println("오류 : "+e.getMessage());
		}
	
			return ".attendance.SAttListView";			
	}
	@RequestMapping("/sdetail")
	public String sdetail(@RequestParam(value="stf_num", defaultValue="0") int stf_num,HttpServletRequest request,
			@RequestParam(value="pageNum", defaultValue="1") int pageNum){
		try{
			String start_date=sdf.format(today);
			String date=request.getParameter("start_date");
			if(date!=null&&date!="") start_date=date;
			String dtype=request.getParameter("dtype");
			String datt_keyword=request.getParameter("datt_keyword");
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("start_date", start_date);
			map.put("stf_num", stf_num);
			map.put("stype", dtype);
			map.put("satt_keyword", datt_keyword);
			int totalRowCount=ss.sattCnt(map);
			System.out.println("(datt) dtype : "+dtype+", 검색어 : "+datt_keyword +", 날짜 : "+start_date);
			System.out.println("stf_num : "+stf_num+" sattCnt : "+totalRowCount);
			PageUtil pu=new PageUtil(pageNum, totalRowCount,10,5);
			map.put("startRow", pu.getStartRow());
			map.put("endRow", pu.getEndRow());
			List<Stf_attDto> dattlist=ss.detailService(map);
			int wsum=ps.spayService(map);
			request.setAttribute("dattlist", dattlist);
			System.out.println("dattlist컨트롤 :"+dattlist);
			System.out.println("pu : "+pu.toString());
			request.setAttribute("dstf_num", stf_num);
			request.setAttribute("ddate", start_date);
			request.setAttribute("dtype",dtype);
			request.setAttribute("wsum", wsum);
			request.setAttribute("datt_keyword", datt_keyword);
			request.setAttribute("pu", pu);
			ss.detailService(map);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return ".attendance.SDetailView";
	
		
	}
	@RequestMapping("/sattupdate")
	public String supdate(@RequestParam(value="satt_num", defaultValue="0") int satt_num){
		System.out.println("sattup : "+satt_num);
		try{
			ss.updateService(satt_num);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return "forward: slistAll";
	}
	
	
}
