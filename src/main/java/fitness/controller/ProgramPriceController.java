package fitness.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import fitness.dto.ProgramPriceDto;
import fitness.service.ProgramPriceService;

@Controller
public class ProgramPriceController {
	@Autowired private ProgramPriceService service;
	
	@RequestMapping(value="/list/xml",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String getNameList(){
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		List<ProgramPriceDto> list=service.list(map);
		
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<proname>");
		for(ProgramPriceDto dto:list){
			sb.append("<pro>");
			sb.append("<pro_num>"+dto.getPro_num()+"</pro_num>");
			sb.append("<pro_code>"+dto.getPro_code()+"</pro_code>");
			sb.append("<pro_name>"+dto.getPro_name()+"</pro_name>");
			sb.append("<pro_subname>"+dto.getPro_subname()+"</pro_subname>");
			sb.append("<pro_price>"+dto.getPro_price()+"</pro_price>");
			sb.append("</pro>");
		}
		sb.append("</proname>");
		System.out.println("ddd:" + sb.toString());
		return sb.toString();
	}
}
