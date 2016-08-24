package fitness.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import fitness.dto.MemberDto;
import fitness.service.MemberService;


@Controller
public class MemberController {
	@Autowired private MemberService service;
	@RequestMapping(value="/meminsert",method= RequestMethod.GET)
	public String insert(){
		return ".member.MemInsertView";
	}
	@RequestMapping(value="/meminsert",method= RequestMethod.POST)
	public ModelAndView insert(MemberDto dto){
		ModelAndView mv=new ModelAndView(".mem.ResultView");
		
		return mv;
	}
}
