package fitness.controller;

import java.math.BigDecimal;
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
	/*
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String loginForm(){
		return ".login.login";
	}
	*/
	@RequestMapping(value="/login")
	public String login(HttpServletRequest req ){
		String mem_name=req.getParameter("mem_name");
		String mem_phone=req.getParameter("mem_phone");
		String adminCheck=req.getParameter("adminCheck");
		//String stf_name=req.getParameter("stf_name");
		//String stf_phone=req.getParameter("stf_phone");
		System.out.println("üũ�� �Ѿ����?: "+adminCheck);
		if(adminCheck==null){
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("mem_name", mem_name);//id����
			map.put("mem_phone", mem_phone);//pwd����
			
			HashMap<String, Object> user=service.loginMem(map);
			if(user==null){
				req.setAttribute("errMsg", "�̸� �� ��ȭ��ȣ ����ġ!");
				return ".bootmain";//�α����������� �̵�
			}else{
				HttpSession session=req.getSession();//���Ǿ�����
				System.out.println("session������?"+session);
				session.setAttribute("mnum", ((BigDecimal)user.get("MEM_NUM")).intValue());//��ȣ�̾ƿ���
				session.setAttribute("memnum", mem_name);
				
				System.out.println("�������?"+ mem_name);
				return ".bootmain";//���ΰ���
			}
		}else{
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("stf_name", mem_name);
			map.put("stf_phone", mem_phone);
			
			HashMap<String, Object> user=service.loginAdmin(map);
			if(user==null){
				req.setAttribute("errMsg", "���̵� �� ��� ����ġ");
				return ".bootmain";
			}else{
				HttpSession session=req.getSession();//���Ǿ�����
				System.out.println("Admin session������?"+session);
<<<<<<< HEAD
				session.setAttribute("snum", ((BigDecimal)user.get("STF_NUM")).intValue());//��ȣ�̾ƿ���
=======
				session.setAttribute("snum", ((BigDecimal)user.get("STF_NUM")).intValue());
>>>>>>> ec8353cc3638cf1cf0f866f4ae0ac9fb1542b423
				session.setAttribute("memnum", mem_name);
				System.out.println("Admin �������?"+ mem_phone);
				System.out.println("�� �̾ƺ���!!"+user.get("STF_NUM"));
				return ".bootmain";//���ΰ���
			}
		}
		
	}
	@RequestMapping(value="/logout")
	public String logout(HttpSession session){
		session.invalidate();
		return ".bootmain";//�α����������� �̵�
	}
}
