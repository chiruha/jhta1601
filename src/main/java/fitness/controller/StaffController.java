package fitness.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import fitness.dto.CenterDto;
import fitness.dto.PositionDto;
import fitness.dto.StaffDto;
import fitness.service.CenterService;
import fitness.service.PositionService;
import fitness.service.StaffService;

@Controller
public class StaffController {
	@Autowired private StaffService service;
	@Autowired private CenterService cts;
	@Autowired private PositionService pos;
	@RequestMapping(value="/stfinsert",method= RequestMethod.GET)
	public String insert(HttpSession session){
		List<CenterDto> ctlist=cts.listService();
		List<PositionDto>poslist=pos.listService();
		System.out.println(poslist);
		session.setAttribute("poslist", poslist);
		session.setAttribute("ctlist", ctlist);
		return ".staff.StfInsertView";
	}
	@RequestMapping(value="/stfinsert",method= RequestMethod.POST)
	public ModelAndView insert(StaffDto dto, HttpSession session){
		ModelAndView mv=new ModelAndView(".staff.ResultView");
		try{
			session.setAttribute("result", "직원 등록 성공!");
			System.out.println(dto.toString());
		}catch(Exception e){
			System.out.println(e.getMessage());
			session.setAttribute("result", "직원 등록 실패!");
		}
		return mv;
	}
}
