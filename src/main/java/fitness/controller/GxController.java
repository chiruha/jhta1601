package fitness.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	@Autowired private RegistrationService regiservice;
	
	@RequestMapping(value="/gxinsert",method=RequestMethod.GET)
	public String insert(HttpSession session){
		List<CenterDto> ctlist=cts.listService();
		session.setAttribute("ctlist",ctlist);
		return ".exercise.GxRegisterView";
	}

	@RequestMapping(value="/gxMent",method=RequestMethod.GET)
	public String ptmentmove(HttpServletRequest request){
		System.out.println("gxMent µµÂø");
		List<GxsubjectDto> gxlist= service.gxsubject();
		System.out.println("gxlist:"+gxlist);
		request.setAttribute("gxlist", gxlist);
	
		return ".exercise.gxMent";
	}
	
	@RequestMapping(value="/gxinsert",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public Object insert(int[] ct_code,String[] gx_exercise,String[] gx_day,String[] gx_time,GxregisterDto dto,HttpSession session){
		System.out.println("gxinsert µµÂø");		
		
		int mnum = (Integer) session.getAttribute("mnum");
		
		
	
		return null;		
	}
	
	
}

















