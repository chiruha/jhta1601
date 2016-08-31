package fitness.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import fitness.dto.CenterDto;

import fitness.dto.GxregisterDto;
import fitness.dto.PtregisterDto;



import fitness.dto.GxregisterDto;




import fitness.service.CenterService;

import fitness.service.gxregisterService;


@Controller
public class GxController {
	@Autowired private gxregisterService service;
	@Autowired private CenterService cts;
	
	@RequestMapping(value="/gxinsert",method=RequestMethod.GET)
	public String insert(HttpSession session){
		List<CenterDto> ctlist=cts.listService();
		session.setAttribute("ctlist",ctlist);
		return ".exercise.GxRegisterView";
	}
	
	@RequestMapping(value="/gxinsert",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public Object insert(int[] ct_code,String[] gx_exercise,String[] gx_day,String[] gx_time,GxregisterDto dto){
		System.out.println("gxinsert µµÂø");		
/*		
		System.out.println("dto"+dto);
		service.insert(dto);
		GxregisterDto gxdto=null;
		try{
			gxdto=service.detail(1);
			System.out.println("gxdto"+gxdto);
		
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return gxdto;		
		
		*/
		
		ArrayList<GxregisterDto> list = new ArrayList<GxregisterDto>();
		for(int i=0; i<gx_exercise.length; i++){
			int ct_code1=ct_code[i];
			String gx_exercise1=gx_exercise[i];
			String gx_day1=gx_day[i];
			String gx_time1=gx_time[i];
			GxregisterDto gxdto=new GxregisterDto(0, ct_code1, gx_exercise1, gx_day1, gx_time1, 1);
			list.add(gxdto);
			System.out.println("gxdto"+gxdto);
			service.insert(gxdto);
		}
		
	/*	
		JSONArray arr = new JSONArray();
		for(GxregisterDto dto2:list){
			JSONObject jo=new JSONObject();
			jo.put("gx_num", dto2.getGx_num());
			jo.put("ct_code", dto2.getCt_code());
			jo.put("gx_exercise", dto2.getGx_exercise());
			jo.put("gx_day", dto2.getGx_day());
			jo.put("gx_time", dto2.getGx_time());
			jo.put("rg_num", dto2.getRg_num());
			arr.add(jo);
		}
		System.out.println("arr"+arr.toString());
		return arr.toString();*/
		return list;
		

		
	}
}

















