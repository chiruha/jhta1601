package fitness.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fitness.dto.AttListDto;
import fitness.dto.CenterDto;
import fitness.dto.Mem_attDto;
import fitness.dto.Stf_attDto;
import fitness.service.CenterService;
import fitness.service.Mem_attService;
import fitness.service.Stf_attService;
import page.util.PageUtil;

@Controller
public class AttendanceController {
	@Autowired private Stf_attService ss;
	@Autowired private Mem_attService ms;
	@Autowired private CenterService cs;
	HttpSession session;
	HttpServletRequest request;
	
	@RequestMapping("/attcheck")
	public String check(int num, String type){
		System.out.println("attCtr num : "+ num +", type : "+type);
		List<CenterDto> ctlist=cs.listService();
		session.setAttribute("ctlist", ctlist);
		return ".attendance.AttInsertView";
	}
	@RequestMapping("/attinsert")
	public String attinsert(@RequestParam(value="snum", defaultValue="0") int snum,
											@RequestParam(value="mnum", defaultValue="0") int mnum, 
											int ct_code){
		try{
			System.out.println("snum : "+snum+", mnum : "+mnum+", ct_code : "+ct_code);
			if(mnum>0){
				Mem_attDto mdto=new Mem_attDto(0, null, mnum, ct_code);
				ms.insertService(mdto);
			}else if(snum>0){
				Stf_attDto sdto=new Stf_attDto(0, null, snum, ct_code);
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
	public String MlistAll(@RequestParam(value="pageNum", defaultValue="1") int pageNum){
		try{
			String ct_code=request.getParameter("ct_code");
			String mem_name=request.getParameter("mem_name");
			String mem_phone=request.getParameter("mem_phone");
			String keyword=request.getParameter("keyword");
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("ct_code", ct_code);
			map.put("mem_name", mem_name);
			map.put("mem_phone", mem_phone);
			map.put("keyword", keyword);
			int totalRowCount=ms.mattCnt(map);
			PageUtil pu=new PageUtil(pageNum, totalRowCount,10,5);
			map.put("startRow", pu.getStartRow());
			map.put("endRow", pu.getEndRow());
			List<AttListDto> mattlist=ms.listService(map);
			session.setAttribute("mattlist", mattlist);
			System.out.println("mattlist컨트롤 :"+mattlist);
			session.setAttribute("pu", pu);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return ".attendance.MAttListView";
	}
	
	@RequestMapping("/slistAll")
	public String SlistAll(@RequestParam(value="pageNum", defaultValue="1") int pageNum){
		try{
			String ct_code=request.getParameter("ct_code");
			String stf_name=request.getParameter("stf_name");
			String stf_phone=request.getParameter("stf_phone");
			String keyword=request.getParameter("keyword");
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("ct_code", ct_code);
			map.put("stf_name", stf_name);
			map.put("stf_phone", stf_phone);
			map.put("keyword", keyword);
			int totalRowCount=ss.sattCnt(map);
			PageUtil pu=new PageUtil(pageNum, totalRowCount,10,5);
			map.put("startRow", pu.getStartRow());
			map.put("endRow", pu.getEndRow());
			List<AttListDto> sattlist=ss.listService(map);
			session.setAttribute("sattlist", sattlist);
			System.out.println("sattlist컨트롤 :"+sattlist);
			session.setAttribute("pu", pu);
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return ".attendance.SAttListView";
	}

}
