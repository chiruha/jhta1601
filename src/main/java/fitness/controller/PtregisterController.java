package fitness.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
	@Autowired private StaffService staffservice;
	
	@RequestMapping(value="/ptrinsert",method=RequestMethod.GET)
	public String insert(HttpSession session){
		List<CenterDto> ctlist=cts.listService();
		session.setAttribute("ctlist",ctlist);
		return ".exercise.PtRegisterView";
	}
	
	@RequestMapping(value="/ptrinsert",method=RequestMethod.POST)
	@ResponseBody
	public String insert(PtregisterDto dto,NoticeDto ndto){		
		dto.setRg_num(1);
		service.insert(dto);
		
		
		
		return ".exercise.PtRegisterView";
	}
}

















