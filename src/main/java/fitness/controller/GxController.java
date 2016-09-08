package fitness.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import fitness.dto.CenterDto;

import fitness.dto.GxregisterDto;
import fitness.dto.GxsubjectDto;
import fitness.service.CenterService;
import fitness.service.RegistrationService;
import fitness.service.gxregisterService;


@Controller
public class GxController {
	@Autowired private gxregisterService service;
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

	@RequestMapping(value="/gxMent",method=RequestMethod.POST)
	public String gxmentmove(HttpServletRequest request,GxregisterDto gxdto,HttpSession session){
		System.out.println("gxMent µµÂø");
		
		int snum = (Integer) session.getAttribute("snum");
		gxdto.setStf_num(snum);		
		System.out.println("gxdto:"+gxdto);
		
		service.insert(gxdto);		
		
		return "redirect:/gxRegisterView";
	}
	@RequestMapping(value="/gxRegisterView")
	public String gxRegisterView(ModelMap modelMap){
		
		GxregisterDto gxlist = service.gxlist();
		System.out.println("gxlist:"+gxlist);
		modelMap.addAttribute("gxlist",gxlist);
		
		return ".exercise.GxRegisterView";
	}
	
	
	
	
}

















