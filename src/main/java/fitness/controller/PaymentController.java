package fitness.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import fitness.service.PaymentService;

@Controller
public class PaymentController {
	@Autowired PaymentService ps;
	@RequestMapping(value="/wsum", produces="application/xml;charset=utf-8")
	@ResponseBody
	public String getWSum(@RequestParam(value="stf_num", defaultValue="0") int stf_num, HttpServletRequest request){
		String start_date=request.getParameter("start_date");
		System.out.println("sdate : "+start_date+", stf_num : "+stf_num);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("stf_num", stf_num);
		map.put("start_date", start_date);
		StringBuffer sb=new StringBuffer();
		int wsum=ps.spayService(map);
		System.out.println("wsum : "+wsum);
		sb.append("<?xml version=\"\1.0\" encoding=\"UTF-8\"?>");
		sb.append("<wsum>"+wsum+"</wsum>");
		
		return sb.toString();
	}
}
