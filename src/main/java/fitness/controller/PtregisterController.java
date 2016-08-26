package fitness.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import fitness.dto.CenterDto;
import fitness.dto.PtregisterDto;
import fitness.service.CenterService;
import fitness.service.PtregisterService;


@Controller
public class PtregisterController {
	@Autowired private PtregisterService service;
	@Autowired private CenterService cts;
	
	@RequestMapping(value="/ptrinsert",method=RequestMethod.GET)
	public String insert(HttpSession session){
		List<CenterDto> ctlist=cts.listService();
		session.setAttribute("ctlist",ctlist);
		return ".exercise.PtRegisterView";
	}
	
	@RequestMapping(value="/ptrinsert",method=RequestMethod.POST)
	@ResponseBody
	public String insert(String ptr_initdate,String ptr_time,String ct_code){
		
		System.out.println("����"+ct_code);
		//PtregisterDto dto = new PtregisterDto(0, null, ptr_initdate, ptr_time, ptr_count,ct_code,null);
		return ".exercise.PtRegisterView";
	}
}

















