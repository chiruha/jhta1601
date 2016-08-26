package fitness.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fitness.dto.CenterDto;
import fitness.service.CenterService;

@Controller
public class CenterController {
	@Autowired CenterService service;
	@RequestMapping(value="/ctinsert", method=RequestMethod.GET)
	public String insert(){
		
		return ".staff.CtInsertView";
	}
	@RequestMapping(value="/ctinsert", method=RequestMethod.POST)
	public String insert(CenterDto dto, HttpSession session){
		System.out.println(dto.toString());
		try{
			service.insertService(dto);
			session.setAttribute("result", "지점정보 추가 완료!");
		}catch(Exception e){
			System.out.println(e.getMessage());
			session.setAttribute("result", "지점정보 추가 실패!");
		}
		
		return ".staff.ResultView";
	}
}
