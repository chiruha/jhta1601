package fitness.controller;



import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import fitness.dto.CenterDto;
import fitness.dto.GxregisterDto;
import fitness.dto.PtregisterDto;
import fitness.dto.StaffDto;
import fitness.dto.ptrMemDto;
import fitness.service.CenterService;
import fitness.service.PtregisterService;
import fitness.service.RegistrationService;
import fitness.service.StaffService;
import fitness.service.TrainerService;
import fitness.service.gxregisterService;


@Controller
public class PtregisterController {
	@Autowired private PtregisterService service;
	@Autowired private CenterService cts;	
	@Autowired private TrainerService trservice;
	@Autowired private RegistrationService regiservice;
	@Autowired private StaffService staffservice;
	@Autowired private gxregisterService gxservice;
	
	@RequestMapping(value="/ptrinsert",method=RequestMethod.GET)
	public String insert(HttpSession session){
		List<CenterDto> ctlist=cts.listService();
		session.setAttribute("ctlist",ctlist);
		
		List<StaffDto> stlist= staffservice.ptstafflist();
		System.out.println("stlist"+stlist);
		session.setAttribute("stlist",stlist);
		return ".exercise.PtRegisterView";
	}
	
		
	@RequestMapping(value="/MemPTscOkView",method=RequestMethod.GET)
	public String memptscOkviewmove(HttpSession session){
		System.out.println("MemPTscOkView도착");
		int mnum = (Integer) session.getAttribute("mnum");		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mem_num", mnum);
		List<ptrMemDto> list = service.ptmemOkService(map);
		System.out.println("map"+map);		
		
		session.setAttribute("list", list);
		
		System.out.println("list:"+list);
		
		
		return ".exercise.MemPTscOkView";
	}
	
	@RequestMapping(value="/PTscOkView",method=RequestMethod.GET)
	public String ptscOkviewmove(HttpSession session){
		System.out.println("ptscOkviewmove도착");
		int mnum = (Integer) session.getAttribute("mnum");
		System.out.println("mnum:"+mnum);	
		
		int ttr_num=trservice.detail2Service(mnum).getTr_num();
		System.out.println("ttr_num:"+ttr_num);
		int tr_num = service.ptr_numinfo(ttr_num).getTr_num();
		System.out.println("tr_num:"+tr_num);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("tr_num", tr_num);
		List<PtregisterDto> list = service.ptOkService(map);
		System.out.println(map);
		
		session.setAttribute("list", list);		
		System.out.println(list);
		return ".exercise.PTscOkView";
	}
	
	@RequestMapping(value="/PTokmResult",method=RequestMethod.POST)
	public String ptokmresult(HttpServletRequest request,PtregisterDto dto){
		String pokm = request.getParameter("okm");
		String ptr_num = request.getParameter("ptr_num");
		System.out.println("trainer 전송결과:"+pokm+","+ptr_num);
		
		dto.setPtr_num(Integer.parseInt(ptr_num));
		dto.setPtr_ok(pokm);
		System.out.println("ok"+dto.getPtr_ok());
		System.out.println("num"+dto.getPtr_num());
		service.ptrOkupdate(dto);
		System.out.println("수정된 dto"+dto);
		return "redirect:/PTscOkView";
	}
	
	@RequestMapping(value="/ptrinsert",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public Object insert(PtregisterDto dto,HttpSession session){		
		System.out.println("ptrinsert 도착");
		
		System.out.println(session.getAttribute("mnum"));
		int mnum= (Integer) session.getAttribute("mnum");
		System.out.println("mnum"+mnum);
	//	System.out.println("mem_num"+session.getAttribute("mnum"));
		//멤버 정보 추출
		int rg_num=regiservice.ptRe(mnum).getRg_num();		
		System.out.println("rg_num:"+rg_num);		
		dto.setRg_num(rg_num);
		// 이용 dto
		System.out.println("dto"+dto);
		int gtr_num=dto.getTr_num();
		int tr_num=trservice.detail2Service(gtr_num).getTr_num();
		dto.setTr_num(tr_num);
		
		System.out.println("tr_num"+tr_num);
		
		service.insert(dto);
		//최종 dto
		System.out.println("dto결과"+dto);
	  
		PtregisterDto ptrdto =null;
		try{
			
			int maxnum=service.ptmaxNum();
			System.out.println(maxnum);
			ptrdto =  service.detailService(maxnum);
			System.out.println("ptrdto"+ptrdto);			  
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
		return   ptrdto;
	}
	
	
}

















