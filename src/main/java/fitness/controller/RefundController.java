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

import fitness.dto.CenterDto;
import fitness.dto.MemberDto;
import fitness.dto.RefundDayImpleDto;
import fitness.dto.RefundDto;
import fitness.dto.RegistrationDto;
import fitness.dto.PtrMemDto;
import fitness.service.CenterService;
import fitness.service.MemberService;
import fitness.service.RefundDayService;
import fitness.service.RefundService;
import fitness.service.RegistrationService;
import page.util.PageUtil;

@Controller
public class RefundController {
	@Autowired private RefundDayService refundDayService;	
	@Autowired private RefundService refundservice;
	@Autowired private RegistrationService regiservice;
	@Autowired private CenterService cts;
	
	@RequestMapping(value="/refundDay",method= RequestMethod.GET)
	public String refundDay(HttpSession session,HttpServletRequest request){
		System.out.println("refundDayµµÂø");
		List<CenterDto> ctlist = cts.listService();
		session.setAttribute("ctlist", ctlist);
	
		System.out.println(ctlist);		
	
		return ".refund.refundView";
	}
	
	@RequestMapping(value="/refundDay",method= RequestMethod.POST)
	@ResponseBody
	public String refundDay(String refundname,@RequestParam(value="pageNum",defaultValue="1") int pageNum,HttpSession session){
		System.out.println("refundDayµµÂøPOST");
		System.out.println("refundname"+refundname);
		
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("refundname", refundname);		
		
		int memNaCount = refundservice.memNaCount(map); 
		
		PageUtil pu=new PageUtil(pageNum, memNaCount, 10, 10);
		
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		
		System.out.println("pu:"+pu+"|"+memNaCount);
		
		List<MemberDto> searchList=refundDayService.memNaSeList(map);
		System.out.println("°Ë»öÁ¶°Çº¸±â: "+searchList);
		
		JSONArray arr= new JSONArray();
		for(MemberDto dto:searchList){
			JSONObject jo= new JSONObject();
			jo.put("mem_num", dto.getMem_num());
			jo.put("mem_name", dto.getMem_name());
			jo.put("mem_phone", dto.getMem_phone());
			jo.put("ct_name", dto.getCt_name());
			
			arr.add(jo);			
		}		
		JSONObject page = new JSONObject();
		page.put("pageNum", pu.getPageNum());
		page.put("startPageNum", pu.getStartPageNum());
		page.put("endPageNum", pu.getPageNum());
		page.put("totalPageCount", memNaCount);
		
		JSONObject rr= new JSONObject();
		rr.put("arr", arr);
		rr.put("page", page);
		
		
		System.out.println(rr.toString()+"rr.toString()");
		return rr.toString();
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
		
		List<RefundDayImpleDto> refundto=refundDayService.ptgxoneday(mem_num);
		System.out.println("refundto"+refundto);				
		
		JSONArray tot = new JSONArray();
		
		 for(RefundDayImpleDto dto:refundto){
			 JSONObject jo=new JSONObject();
			 jo.put("mem_num", dto.getMem_num());
			 jo.put("ptday", dto.getPtday());
			 jo.put("gxday", dto.getGxday());
			 jo.put("spsday", dto.getSpsday());
			 jo.put("sgxday", dto.getSgxday());			
			 tot.add(jo);
		 }				 	
		
		System.out.println("tot.toString();:"+tot.toString());
		return tot.toString();
	}
	
	@RequestMapping(value="/ptgxmove1",method= {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String ptgxmove(RefundDto refundto,HttpSession session){
		System.out.println("ptgxmoveµµÂøPOST");
		System.out.println("refundto:"+refundto);
						
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mem_num", refundto.getMem_num());	
		
		/*
		List<RegistrationDto> rglist = refundservice.refundrgnum(map);
		System.out.println("rglist:"+rglist);
		int rg_num = 0;		
		String rg_type = "";
		for(int i=0; i < rglist.size(); i++){
			rg_num = rglist.get(i).getRg_num();			 			 
			rg_type = rglist.get(i).getRg_type();
			refundto.setRg_num(rg_num);
			System.out.println("rg_num:"+rg_num);
			refundto.setRg_type(rg_type);
			System.out.println("rg_type:"+rg_type);
			
			System.out.println("refundtoÃÖÁ¾:"+refundto);
			break;
		}
		*/
		refundservice.regiInsert(refundto);	
		System.out.println("refundto:"+refundto);
		
		List<RefundDto> refundlist = refundservice.refundlist();
		 JSONArray tot = new JSONArray();
		 
		 for(RefundDto dto:refundlist){
			 System.out.println("refundlist:"+refundlist);
			 JSONObject jo=new JSONObject();
			 jo.put("refund_num", dto.getRefund_num());
			 jo.put("mem_num", dto.getMem_num());
			 jo.put("refund_date", dto.getRefund_date().toString());
			 jo.put("rg_num", dto.getRg_num());
			 jo.put("ct_code", dto.getCt_code());
			 jo.put("rg_type", dto.getRg_type());
			 jo.put("refund_price", dto.getRefund_price());
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
			 jo.put("refund_num", dto.getRefund_num());
			 jo.put("mem_num", dto.getMem_num());
			 jo.put("refund_date", dto.getRefund_date().toString());
			 jo.put("rg_num", dto.getRg_num());
			 jo.put("ct_code", dto.getCt_code());
			 jo.put("rg_type", dto.getRg_type());
			 jo.put("refund_price", dto.getRefund_price());
			 tot.add(jo);
		 }	
		 	System.out.println("tot.toString():"+tot.toString());
			return tot.toString();
	}
	
}


























