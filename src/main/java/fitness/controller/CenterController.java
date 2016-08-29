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
			session.setAttribute("result", "지점정보 추가 완료!");
		}catch(Exception e){
			System.out.println(e.getMessage());
			session.setAttribute("result", "지점정보 추가 실패!"); 
		}
		return ".staff.ResultView";
	}
	
	@RequestMapping(value="/ctlist", produces="application/xml;charset=utf-8")
	@ResponseBody  // 리턴된 값(String)을 페이지가 아닌 ajax에 대한 응답으로 처리하게 만들어 주는 것
	public String getCtName(){
		System.out.println("getCenter 도착");
		ArrayList<CenterDto> clist=new ArrayList<CenterDto>();
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<centers>");
		for(CenterDto dto : clist){
			sb.append("<center>");
			sb.append("<code>"+dto.getCt_code()+"</code>");
			sb.append("<name>"+dto.getCt_name()+"</name>");
			sb.append("</center>");
		}
		sb.append("</centers>");
		
		return sb.toString();
	}
	
	
}
