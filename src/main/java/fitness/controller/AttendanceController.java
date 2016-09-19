package fitness.controller;

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
import fitness.service.Stf_attService;
import page.util.PageUtil;

@Controller
public class AttendanceController {
	@Autowired private Stf_attService ss;
	@Autowired private Mem_attService ms;
	@Autowired private CenterService cs;
	
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
				Mem_attDto mdto=new Mem_attDto(0, null, null, 0, mnum, null, null, ct_code, null);
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
		try{
			String ct_code=request.getParameter("ct_code");
			String mem_name=request.getParameter("mem_name");
			String mem_phone=request.getParameter("mem_phone");
			String matt_keyword=request.getParameter("matt_keyword");
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("ct_code", ct_code);
			map.put("mem_name", mem_name);
			map.put("mem_phone", mem_phone);
			map.put("matt_keyword", matt_keyword);
			int totalRowCount=ms.mattCnt(map);
			PageUtil pu=new PageUtil(pageNum, totalRowCount,10,5);
			map.put("startRow", pu.getStartRow());
			map.put("endRow", pu.getEndRow());
			List<Mem_attDto> mattlist=ms.listService(map);
			session.setAttribute("mattlist", mattlist);
			System.out.println("mattlist컨트롤 :"+mattlist);
			session.setAttribute("pu", pu);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return ".attendance.MAttListView";
	}
	
	@RequestMapping("/slistAll")
	public String SlistAll(	HttpSession session,@RequestParam(value="pageNum", defaultValue="1") int pageNum,HttpServletRequest request){
		String type=request.getParameter("type");
		String satt_keyword=request.getParameter("satt_keyword");
		System.out.println("(att) type: "+type+", 검색어: "+satt_keyword);
		try{
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("type", type);
			map.put("satt_keyword", satt_keyword);
			int totalRowCount=ss.sattCnt(map);
			System.out.println("sattCnt : "+totalRowCount);
			PageUtil pu=new PageUtil(pageNum, totalRowCount,10,5);
			map.put("startRow", pu.getStartRow());
			map.put("endRow", pu.getEndRow());
			List<Stf_attDto> sattlist=ss.listService(map);
			session.setAttribute("sattlist", sattlist);
			System.out.println("sattlist컨트롤 :"+sattlist);
			System.out.println(pu.toString());
			session.setAttribute("type", type); 
			session.setAttribute("satt_keyword", satt_keyword);
			session.setAttribute("pu", pu);
		}catch(Exception e){
			System.out.println("오류 : "+e.getMessage());
		}
		return ".attendance.SAttListView";
	}

	@RequestMapping("/sattupdate")
	public String outdate(@RequestParam(value="satt_num", defaultValue="0") int satt_num){
		System.out.println("sattup : "+satt_num);
		try{
			ss.updateService(satt_num);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return "forward: slistAll";
	}
	
}
