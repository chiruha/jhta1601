package fitness.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import fitness.dto.CenterDto;
import fitness.dto.NoticeDto;
import fitness.dto.PtregisterDto;
import fitness.service.CenterService;
import fitness.service.PtregisterService;
import fitness.service.RegistrationService;
import fitness.service.StaffService;


@Controller
public class PtregisterController {
	@Autowired private PtregisterService service;
	@Autowired private CenterService cts;
	@Autowired private RegistrationService reservice;
	
	
	@RequestMapping(value="/ptrinsert",method=RequestMethod.GET)
	public String insert(HttpSession session){
		List<CenterDto> ctlist=cts.listService();
		session.setAttribute("ctlist",ctlist);
		return ".exercise.PtRegisterView";
	}
	
	@RequestMapping(value="/ptrinsert",method=RequestMethod.POST)
	@ResponseBody
	public String insert(PtregisterDto dto){
		System.out.println("ptrinsert µµÂø");
		//int n=staffservice.detailService(1).getStf_num();
		//dto.setTr_num(n);
		//dto.setRg_num(1);
		System.out.println("dto"+dto);
		service.insert(dto);
		System.out.println("dto°á°ú"+dto);
		
		
		
		return ".exercise.PtRegisterView";
	}
	@RequestMapping(value = "/jsontest")
	public @ResponseBody Object jsonTest(){
		//CenterDto dto=new CenterDto(1, "ct_name", "ct_tel", "ct_addr", "ct_intro");
			HashMap<String,String> map=new HashMap<String, String>();
			map.put("id","aaaa");
			map.put("pwd","bbbb");
		return map;
		}
}

















