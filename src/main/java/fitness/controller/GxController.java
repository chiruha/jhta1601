package fitness.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import fitness.dto.CenterDto;
import fitness.dto.GxregisterDto;
import fitness.dto.PtregisterDto;

import fitness.service.CenterService;
import fitness.service.PtregisterService;
import fitness.service.gxregisterService;


@Controller
public class GxController {
	@Autowired private gxregisterService service;
	@Autowired private CenterService cts;
	
	@RequestMapping(value="/gxinsert",method=RequestMethod.GET)
	public String insert(HttpSession session){
		List<CenterDto> ctlist=cts.listService();
		session.setAttribute("ctlist",ctlist);
		return ".exercise.GxRegisterView";
	}
	
	@RequestMapping(value="/gxinsert",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public Object insert(GxregisterDto dto){
		System.out.println("gxinsert µµÂø");		
		dto.setRg_num(1);
		System.out.println("dto"+dto);
		//service.insert(dto);
		GxregisterDto gxdto=null;
		try{
			gxdto=service.detail(1);
			System.out.println("gxdto"+gxdto);
		
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
		return gxdto;		
		
		
		

		
	}
}

















