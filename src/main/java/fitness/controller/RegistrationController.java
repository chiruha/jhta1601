package fitness.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sun.xml.internal.ws.developer.MemberSubmissionEndpointReference;

import fitness.dto.MemberDto;
import fitness.service.MemberService;
import fitness.service.RegistrationService;

/*
 * 수강등록 컨트롤러입니다.
 * 테이블명 : registratioin
 * */
@Controller
public class RegistrationController {
	@Autowired private RegistrationService service;
	
	//----------| 회원번호검색하기 |----------/
	@RequestMapping("/searchMemNum")
	public ModelAndView searchMemNum(HttpServletRequest request,Model model){
		String keyword=request.getParameter("keyword");
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("keyword", keyword);
		List<MemberDto> searchMem=service.searchMemNum(map);
		System.out.println("검색회원보기: "+searchMem);
		ModelAndView mv=new ModelAndView();
		mv.addObject("searchMem",searchMem);
		mv.setViewName(".registration.registrationInsert");
		return mv;
	}	
	
	
	@RequestMapping(value="/registrationInsert",method= RequestMethod.GET)
	public String insertForm(){
		
		return ".registration.registrationInsert";
	}
}
