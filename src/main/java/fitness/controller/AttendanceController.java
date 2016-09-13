package fitness.controller;

import java.util.List;

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

@Controller
public class AttendanceController {
	@Autowired private Stf_attService ss;
	@Autowired private Mem_attService ms;
	@Autowired private CenterService cs;
	HttpSession session;
	
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
	public String MlistAll(){
		try{
			int snum=(Integer)session.getAttribute("mnum");
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return ".attendance.AttListView";
	}
	@RequestMapping("/mlistOne")
	public String MlistOne(){
		try{
			int snum=(Integer)session.getAttribute("mnum");
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return ".attendance.AttListView";
	}
	@RequestMapping("/slistAll")
	public String SlistAll(){
		try{
			int snum=(Integer)session.getAttribute("mnum");
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return ".attendance.AttListView";
	}
	@RequestMapping("/slistOne")
	public String SlistOne(){
		try{
			int snum=(Integer)session.getAttribute("snum");
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return ".attendance.AttListView";
	}
}
