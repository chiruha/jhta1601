package fitness.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.INTERNAL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import fitness.dto.MemberDto;


import fitness.dto.ProsignDto;
import fitness.dto.PtsignDto;
import fitness.dto.RegistrationDto;

import fitness.service.MemberService;


import fitness.service.RegistrationService;

/*
 * ������� ��Ʈ�ѷ��Դϴ�.
 * ���̺�� : registratioin
 * */
@Controller
public class RegistrationController {
	@Autowired private RegistrationService service;
	
	@RequestMapping(value="/regiInsert",method= RequestMethod.GET)
	public String insertForm(){
		return ".registration.registrationInsert";
	}
	//----------| �������(insert)(���̺��: registration,prosign,ptsign) |----------//	
	@RequestMapping(value="/regiInsert1", method=RequestMethod.POST)
	public String regiInsert(HttpServletRequest req){
		int mem_num=Integer.parseInt(req.getParameter("mem_num"));
		String rg_type=req.getParameter("rg_type");
		int rg_price=Integer.parseInt(req.getParameter("rg_price"));
		int locker_price=Integer.parseInt(req.getParameter("locker_price"));
		int wear_price=Integer.parseInt(req.getParameter("wear_price"));
		String pro_code=req.getParameter("pro_code");
		String pt_code=req.getParameter("pt_code");
		int ptr_count=Integer.parseInt(req.getParameter("ptr_count"));
		RegistrationDto dto1=new RegistrationDto(0, mem_num, rg_type, rg_price, locker_price, wear_price, null);
		
		try{
			System.out.println("regi��Ʈ�ѷ�: "+dto1.toString());
			service.regiInsert(dto1);//registration���̺� insert
			if(pro_code.equals("")){//pt���� ��û�� ���
				PtsignDto dto3=new PtsignDto(0, mem_num, pt_code, ptr_count, null);
				service.ptsignInsert(dto3);//ptsign���̺� insert
			}else if(pt_code.equals("")){//�ܰ����� ��û�� ���
				ProsignDto dto2=new ProsignDto(0, mem_num, pro_code, null);
				service.prosignInsert(dto2);//prosign���̺� insert
			}else{//���հ���(�ܰ�����+PT����)��û�� ���
				ProsignDto dto2=new ProsignDto(0, mem_num, pro_code, null);
				PtsignDto dto3=new PtsignDto(0, mem_num, pt_code, ptr_count, null);
				service.prosignInsert(dto2);//prosign���̺� insert
				service.ptsignInsert(dto3);//ptsign���̺� insert
			}
			return ".member.memSuccess";
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".member.memError";
		}
	}
	
	
}
