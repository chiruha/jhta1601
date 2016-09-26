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
import fitness.dto.RegistrationDto;
import fitness.dto.StaffDto;
import fitness.dto.TrainerDto;
import fitness.dto.PtrMemDto;
import fitness.service.CenterService;
import fitness.service.PtregisterService;
import fitness.service.RegistrationService;
import fitness.service.StaffService;
import fitness.service.TrainerService;
import fitness.service.GxregisterService;

@Controller
public class PtregisterController {
	@Autowired
	private PtregisterService service;
	@Autowired
	private CenterService cts;
	@Autowired
	private TrainerService trservice;
	@Autowired
	private RegistrationService regiservice;
	@Autowired
	private GxregisterService gxservice;

	@RequestMapping(value = "/ptrinsert", method = RequestMethod.GET)
	public String insert(HttpSession session) {
		List<CenterDto> ctlist = cts.listService();
		session.setAttribute("ctlist", ctlist);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<TrainerDto> stlist = trservice.listService(map);
		System.out.println("stlist" + stlist);
		session.setAttribute("stlist", stlist);
		
		return ".exercise.PtRegisterView";
	}

	@RequestMapping(value = "/MemPTscOkView", method = RequestMethod.GET)
	public String memptscOkviewmove(HttpSession session) {
		System.out.println("MemPTscOkView도착");
		int mnum = (Integer) session.getAttribute("mnum");

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mem_num", mnum);
		List<PtrMemDto> list = service.ptmemOkService(map);
		System.out.println("map" + map);

		session.setAttribute("list", list);

		System.out.println("list:" + list);

		return ".exercise.MemPTscOkView";
	}

	@RequestMapping(value = "/PTscOkView", method = RequestMethod.GET)
	public String ptscOkviewmove(HttpSession session) {
		System.out.println("ptscOkviewmove도착");
		int snum = (Integer) session.getAttribute("snum");
		System.out.println("snum:" + snum);

		int ttr_num = trservice.detail2Service(snum).getTr_num();
		System.out.println("ttr_num:" + ttr_num);
		int tr_num = service.ptr_numinfo(ttr_num).getTr_num();
		System.out.println("tr_num:" + tr_num);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("tr_num", tr_num);
		List<PtregisterDto> list = service.ptOkService(map);
		System.out.println(map);

		session.setAttribute("list", list);
		System.out.println(list);
		return ".exercise.PTscOkView";
	}

	@RequestMapping(value = "/PTokmResult", method = RequestMethod.POST)
	public String ptokmresult(HttpServletRequest request, PtregisterDto dto) {
		String pokm = request.getParameter("okm");
		String ptr_num = request.getParameter("ptr_num");
		System.out.println("trainer 전송결과:" + pokm + "," + ptr_num);

		dto.setPtr_num(Integer.parseInt(ptr_num));
		dto.setPtr_ok(pokm);
		System.out.println("ok" + dto.getPtr_ok());
		System.out.println("num" + dto.getPtr_num());
		service.ptrOkupdate(dto);
		System.out.println("수정된 dto" + dto);
		return "redirect:/PTscOkView";
	}

	@RequestMapping(value="/ptrinsert",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public Object insert(PtregisterDto dto,HttpSession session){		
		System.out.println("ptrinsert 도착"+dto.toString());
		
		System.out.println(session.getAttribute("mnum"));
		int mnum= (Integer) session.getAttribute("mnum");
		System.out.println("mnum"+mnum);
		System.out.println("dto"+dto);
			
		
		int rg_num = service.regi_info(mnum).getRg_num(); //두가지 정보를 받아서 처리해야한다.		
		System.out.println("rg_num:"+rg_num);		
		dto.setRg_num(rg_num);		
		
		Integer ptr_count=service.ptrcount(rg_num);
		dto.setPtr_count(ptr_count);
		if(ptr_count==null){
			System.out.println("값이 0임");
			int n=9999;
			
			return n;
			
		}
		service.insert(dto);
		List<PtregisterDto> ptrlist=service.ptr_rg_numinfo(Integer.toString(rg_num));
		String ptr_ok =null;
		for(int i=0; i<ptrlist.size(); i++){
			 ptr_ok =ptrlist.get(i).getPtr_ok();
		}
		
		System.out.println("ptr_count:"+ptr_count);		
		dto.setPtr_count(ptr_count);		
		System.out.println("ptr_ok:"+ptr_ok);		
		
		System.out.println("dto.getRg_num():"+dto.getRg_num()+"|"+"rg_num:"+rg_num);
		
		if(dto.getRg_num()!=rg_num){
			service.insert(dto);	
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
				
		}else if(ptr_ok.equals("승인취소")){
			System.out.println("승인 삭제");
			int ptr_num = dto.getPtr_num();
			service.ptDelete(ptr_num);
			
			System.out.println("ptr_num"+ptr_num);
			
			service.insert(dto);	
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
				
		}else{
			System.out.println("똑같은 값이 있음");
			int maxnum=service.ptmaxNum();
			service.ptDelete(maxnum);
			PtregisterDto ptrdto = new PtregisterDto();
			try{				
				System.out.println("ptrdto"+ptrdto);			  
			}catch(Exception e){
				System.out.println(e.getMessage());
			}
			
			return   ptrdto;
		}
		

		
	}

}
