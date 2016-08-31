package fitness.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fitness.service.LoginService;

@Controller
public class LoginController {
	@Autowired private LoginService service;
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String loginForm(){
		return ".login.login";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(HttpServletRequest req){
		int mem_num=Integer.parseInt(req.getParameter("mem_num"));
		String mem_phone=req.getParameter("mem_phone");
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("mem_num", mem_num);
		map.put("mem_phone", mem_phone);
		
		HashMap<String, Object> user=service.loginMem(map);
		if(user==null){
			req.setAttribute("errMsg", "아이디 및 비번 불일치!");
			return ".login.login";//로그인페이지로 이동
		}else{
			HttpSession session=req.getSession();//세션얻어오기
			session.setAttribute("mem_num", mem_num);
			return "FinalMain";//메인가기
		}
	}
	@RequestMapping(value="/logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "FinalMain";//메인가기
	}
}
