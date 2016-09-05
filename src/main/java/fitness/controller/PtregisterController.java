package fitness.controller;


import java.util.HashMap;
import java.util.List;


import javax.servlet.http.HttpSession;


import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import fitness.dto.CenterDto;
import fitness.dto.PtperiodDto;
import fitness.dto.PtregisterDto;
import fitness.service.CenterService;
import fitness.service.PtregisterService;
import fitness.service.RegistrationService;

import fitness.service.TrainerService;


@Controller
public class PtregisterController {
	@Autowired private PtregisterService service;
	@Autowired private CenterService cts;
	@Autowired private RegistrationService reservice;
	@Autowired private TrainerService trservice;
	
	@RequestMapping(value="/ptrinsert",method=RequestMethod.GET)
	public String insert(HttpSession session){
		List<CenterDto> ctlist=cts.listService();
		session.setAttribute("ctlist",ctlist);
		return ".exercise.PtRegisterView";
	}
	
	@RequestMapping(value="/ptment",method=RequestMethod.GET)
	public String ptmentmove(){
		
		return ".exercise.PtMent";
	}
	
	@RequestMapping(value="/PTscOkView",method=RequestMethod.GET)
	public String ptscOkviewmove(HttpSession session){
		//int n=trservice.detailService(3).getTr_num();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("tr_num", 3);
		List<PtregisterDto> list = service.ptOkService(map);
		System.out.println(map);
		
		session.setAttribute("list", list);		
		System.out.println(list);
		return ".exercise.PTscOkView";
	}
	
	@RequestMapping(value="/ptrinsert",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public Object insert(PtregisterDto dto){		
		System.out.println("ptrinsert ����");
		System.out.println("trservice"+trservice);
		int n=trservice.detailService(6).getTr_num();
		System.out.println("n"+n);		
		dto.setTr_num(n);
		dto.setRg_num(1);		
		System.out.println("dto"+dto);
		service.insert(dto);
		System.out.println("dto���"+dto);	
		
		  PtregisterDto ptrdto =null;
		try{
			ptrdto =  service.detailService(4);
			System.out.println("ptrdto"+ptrdto);			  
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
		return   ptrdto;
	}
	
	
}

















