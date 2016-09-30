package fitness.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import fitness.dto.CenterDto;

import fitness.dto.GxregisterDto;
import fitness.dto.GxsubjectDto;
import fitness.service.CenterService;

import fitness.service.GxregisterService;


@Controller
public class GxController {
	@Autowired private GxregisterService service;
	@Autowired private CenterService cts;
	
	
	@RequestMapping(value="/gxinsert",method=RequestMethod.GET)
	public String insert(HttpSession session ,HttpServletRequest request){
		List<CenterDto> ctlist=cts.listService();
		System.out.println("ctlist:"+ctlist);
		session.setAttribute("ctlist",ctlist);
		
		List<GxsubjectDto> gxlist= service.gxsubject();
		System.out.println("gxlist:"+gxlist);
		request.setAttribute("gxlist", gxlist);
		return ".exercise.gxMent";
	}

	@RequestMapping(value="/gxMent")
	public String gxmentmove(HttpServletRequest request,GxregisterDto gxdto,HttpSession session){
		System.out.println("gxMent 도착");		
		int snum = (Integer) session.getAttribute("snum");
		gxdto.setStf_num(snum);		
		System.out.println("gxdto:"+gxdto);
		String ct_name=gxdto.getCt_name();
		session.setAttribute("ct_name", ct_name);
		System.out.println(ct_name);
		
		ct_name=service.searchGx(ct_name);
		if(ct_name==null){
			service.insert(gxdto);
		}
				
		
		return "redirect:/gxRegisterView";
	}
	@RequestMapping(value="/gxRegisterView")
	public String gxRegisterView(ModelMap modelMap,HttpSession session,HttpServletRequest request,String ct_name){
		
		System.out.println("ct_name,,,,,,,,,,,,,");
		
	//	ct_name=(String)session.getAttribute("ct_name");
		List<CenterDto> ctlist=cts.listService();
		System.out.println("ctlist:"+ctlist);
		session.setAttribute("ctlist",ctlist);	
		GxregisterDto gxlist = null;
		if((String)session.getAttribute("ct_name")!=null ){
			ct_name=(String)session.getAttribute("ct_name");
			 gxlist = service.gxlist(ct_name);
		}else if(ct_name!=null){
			 gxlist = service.gxlist(ct_name);
		}else{
			ct_name = "화정지점";
			gxlist = service.gxlist(ct_name);
		}
		
		System.out.println("ct_name:"+ct_name);
		
		 
		System.out.println("gxlist:"+gxlist);
		modelMap.addAttribute("gxlist",gxlist);
		request.setAttribute("ct_name", ct_name);
		return ".exercise.GxRegisterView";
	}
	
	
	
	
}

















