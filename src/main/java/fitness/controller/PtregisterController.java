package fitness.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import fitness.service.PtregisterService;


@Controller
public class PtregisterController {
	@Autowired private PtregisterService service;
	
	@RequestMapping(value="/ptrinsert",method=RequestMethod.GET)
	public String insert(){
		return ".pt.PtRegisterView";
	}
	
	@RequestMapping(value="/ptrinsert",method=RequestMethod.POST)
	@ResponseBody
	public String insert(String ptr_initdate,String ptr_time,String ptr_count){
		System.out.println("여기오나");
		System.out.println(ptr_initdate);
		return ".pt.PtRegisterView";
	}
}

















