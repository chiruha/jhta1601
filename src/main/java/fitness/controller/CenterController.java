package fitness.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
			session.setAttribute("result", "�������� �߰� �Ϸ�!");
		}catch(Exception e){
			System.out.println(e.getMessage());
			session.setAttribute("result", "�������� �߰� ����!"); 
		}
		return ".staff.ResultView";
	}
	
	@RequestMapping(value="/ctlist", produces="application/xml;charset=utf-8")
	@ResponseBody  // ���ϵ� ��(String)�� �������� �ƴ� ajax�� ���� �������� ó���ϰ� ����� �ִ� ��
	public String getCtName(){
		ArrayList<CenterDto> clist=(ArrayList<CenterDto>) service.listService();
		System.out.println(clist);
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<centers>");
		for(CenterDto dto : clist){
			sb.append("<center>");
			sb.append("<ctcode>"+dto.getCt_code()+"</ctcode>");
			sb.append("<ctname>"+dto.getCt_name()+"</ctname>");
			sb.append("</center>");
		}
		sb.append("</centers>");
		return sb.toString();
	}
	
	
}
