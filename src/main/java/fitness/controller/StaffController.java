package fitness.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import fitness.dto.StaffDto;
import fitness.service.StaffService;

@Controller
public class StaffController {
	@Autowired private StaffService service;
	@RequestMapping(value="/stfinsert",method= RequestMethod.GET)
	public String insert(){
		return ".staff.StfInsertView";
	}
	@RequestMapping(value="/stfinsert",method= RequestMethod.POST)
	public ModelAndView insert(StaffDto dto){
		ModelAndView mv=new ModelAndView(".staff.ResultView");
		
		return mv;
	}
}
