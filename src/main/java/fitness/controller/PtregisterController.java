package fitness.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fitness.service.PtregisterService;


@Controller
public class PtregisterController {
	@Autowired private PtregisterService service;
	
	@RequestMapping(value="/ptrinsert",method=RequestMethod.GET)
	public String insert(){
		return ".pt.PtRegisterView";
	}
}

















