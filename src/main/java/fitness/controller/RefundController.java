package fitness.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import fitness.dto.MemberDto;
import fitness.dto.RefundDayImpleDto;
import fitness.dto.RefundDto;
import fitness.dto.RegistrationDto;
import fitness.dto.ptrMemDto;
import fitness.service.MemberService;
import fitness.service.RefundDayService;
import fitness.service.RefundService;
import fitness.service.RegistrationService;
import page.util.PageUtil;

@Controller
public class RefundController {
	@Autowired RefundDayService refundDayService;	
	@Autowired RefundService refundservice;
	@Autowired RegistrationService regiservice;
	
	@RequestMapping(value="/refundDay",method= RequestMethod.GET)
	public String refundDay(HttpSession session,HttpServletRequest request){
		System.out.println("refundDayµµÂø");
		
		/*
		int mem_num= (Integer) session.getAttribute("mnum");
		System.out.println("mem_num:"+mem_num);
		List<RegistrationDto> totregimoney =refundDayService.totregimoney(mem_num);		
		System.out.println("totregimoney"+totregimoney);
		request.setAttribute("totregimoney",totregimoney);
		*/
		return ".refund.refundView";
	}
	
	@RequestMapping(value="/refundDay",method= RequestMethod.POST)
	@ResponseBody
	public String refundDay(String refundname,@RequestParam(value="pageNum",defaultValue="1") int pageNum){
		System.out.println("refundDayµµÂøPOST");
		System.out.println("refundname"+refundname);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("refundname", refundname);		
		
		PageUtil pu=new PageUtil(pageNum, 10, 10, 10);
		
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		
		List<MemberDto> searchList=refundDayService.memNaSeList(map);
		System.out.println("°Ë»öÁ¶°Çº¸±â: "+searchList);
		
		JSONArray arr= new JSONArray();
		for(MemberDto dto:searchList){
			JSONObject jo= new JSONObject();
			jo.put("mem_num", dto.getMem_num());
			jo.put("mem_name", dto.getMem_name());
			jo.put("mem_phone", dto.getMem_phone());
			arr.add(jo);			
		}		
		
		
		
		return arr.toString();
	}
	
	@RequestMapping(value="/totregimoney",method= RequestMethod.POST)
	@ResponseBody
	public String totregimoney(int mem_num){
		System.out.println("totregimoneyµµÂøPOST");
		System.out.println("mem_num"+mem_num);
		 List<RegistrationDto> totregimoney = refundDayService.totregimoney(mem_num);
		 System.out.println("totregimoney"+totregimoney);
		
		 JSONArray tot = new JSONArray();
		 
		 for(RegistrationDto dto:totregimoney){
			 JSONObject jo=new JSONObject();
			 jo.put("rg_num", dto.getRg_num());
			 jo.put("mem_num", dto.getMem_num());
			 jo.put("rg_type", dto.getRg_type());
			 jo.put("rg_price", dto.getRg_price());
			 jo.put("locker_price", dto.getLocker_price());
			 jo.put("wear_price", dto.getWear_price());
			 tot.add(jo);
		 }	 	
	 
		return tot.toString();
	}
	
	@RequestMapping(value="/ptgxoneday",method= RequestMethod.POST)
	@ResponseBody
	public String ptgxoneday(int mem_num){
		System.out.println("ptgxonedayµµÂøPOST");
		System.out.println("mem_num"+mem_num);
		RefundDayImpleDto refundto=refundDayService.ptgxoneday(mem_num);
		System.out.println("refundto"+refundto);
		int mem_num1=refundto.getMem_num();
		int ptday=refundto.getPtday();
		int gxday = refundto.getGxday();
		int spsday = refundto.getSpsday();
		int sgxday = refundto.getSgxday();
		
		JSONArray totday= new JSONArray();
		RefundDayImpleDto dto = new RefundDayImpleDto(mem_num1, ptday, gxday, spsday, sgxday);
		System.out.println("dto:"+dto);		
		
		JSONObject jo=new JSONObject();
		jo.put("mem_num",  dto.getMem_num());
		jo.put("ptday",  dto.getPtday());
		jo.put("gxday",  dto.getGxday());
		jo.put("spsday",  dto.getSpsday());
		jo.put("sgxday",  dto.getSgxday());
		totday.add(jo);
		
		System.out.println("today:"+totday.toString());
		return totday.toString();
	}
	
	@RequestMapping(value="/ptgxmove1",method= {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String ptgxmove(int mem_num,int ptrefund,int gxrefund,RefundDto refundto){
		System.out.println("ptgxmoveµµÂøPOST");
		System.out.println("mem_num"+mem_num+"ptmove"+ptrefund+"gxrefund"+gxrefund);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mem_num", mem_num);		
		
		List<RegistrationDto> rglist = refundservice.refundrgnum(map);
		System.out.println("rglist:"+rglist);
		int str = 0;
		String str1 = "";
		String str2 = "";
		for(int i=0; i < rglist.size(); i++){
			 str = rglist.get(i).getRg_num();			 
			 str1=Integer.toString(str);			 
			 str2+= str1+" ";
		}	
		System.out.println("str2:"+str2);
		String str3 ="";
		String[] values = str2.split(" ",4);
		for(int x = 0; x < values.length; x++){
			str3+=values[x]+",";
			if(str3!="null"){
				refundto.setRg_numlist(str3);
			//	refundservice.regiInsert(refundto);
				break;
			}
		}		
		List<RefundDto> refundlist = refundservice.refundlist();
		 JSONArray tot = new JSONArray();
		 
		 for(RefundDto dto:refundlist){
			 System.out.println("refundlist:"+refundlist);
			 JSONObject jo=new JSONObject();
			 jo.put("rf_num", dto.getRf_num());
			 jo.put("rg_numlist", dto.getRg_numlist());
			 jo.put("rf_left", dto.getRf_left().toString());
			 jo.put("ptrefund", dto.getPtrefund());
			 jo.put("gxrefund", dto.getGxrefund());			 
			 tot.add(jo);
		 }	
		 	System.out.println("tot.toString():"+tot.toString());
			return tot.toString();
	}
	
	@RequestMapping(value="/ptgxmove2",method= {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String ptgxmove2(){
		System.out.println("ptgxmove2µµÂøPOST");
		List<RefundDto> refundlist = refundservice.refundlist();
		 JSONArray tot = new JSONArray();		 
		 for(RefundDto dto:refundlist){
			 System.out.println("refundlist:"+refundlist);
			 JSONObject jo=new JSONObject();
			 jo.put("rf_num", dto.getRf_num());
			 jo.put("rg_numlist", dto.getRg_numlist());
			 jo.put("rf_left", dto.getRf_left().toString());
			 jo.put("ptrefund", dto.getPtrefund());
			 jo.put("gxrefund", dto.getGxrefund());			 
			 tot.add(jo);
		 }	
		 	System.out.println("tot.toString():"+tot.toString());
			return tot.toString();
	}
	
}


























