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
		String mem_name=req.getParameter("mem_name");
		String mem_phone=req.getParameter("mem_phone");
		String adminCheck=req.getParameter("adminCheck");
		//String stf_name=req.getParameter("stf_name");
		//String stf_phone=req.getParameter("stf_phone");
		System.out.println("체크값 넘어오나?: "+adminCheck);
		if(adminCheck==null){
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("mem_name", mem_name);//id역할
			map.put("mem_phone", mem_phone);//pwd역할
			
			HashMap<String, Object> user=service.loginMem(map);
			if(user==null){
				req.setAttribute("errMsg", "아이디 및 비번 불일치!");
				return ".login.login";//로그인페이지로 이동
			}else{
				HttpSession session=req.getSession();//세션얻어오기
				//System.out.println("session나오나?"+session);
				session.setAttribute("memnum", mem_name);
				//System.out.println("담아졌나?"+ mem_num);
				return "redirect:/";//메인가기
			}
		}else{
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("stf_name", mem_name);
			map.put("stf_phone", mem_phone);
			
			HashMap<String, Object> user=service.loginAdmin(map);
			if(user==null){
				req.setAttribute("errMsg", "아이디 및 비번 불일치");
				return ".login.login";
			}else{
				HttpSession session=req.getSession();//세션얻어오기
				System.out.println("Admin session나오나?"+session);
				session.setAttribute("memnum", mem_name);
				System.out.println("Admin 담아졌나?"+ mem_phone);
				return "redirect:/";//메인가기
			}
		}
		
	}
	@RequestMapping(value="/logout")
	public String logout(HttpSession session){
		session.invalidate();
		return ".main";//로그인페이지로 이동
	}
}
