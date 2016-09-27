package fitness.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import fitness.dto.CenterTotalSalesDto;
import fitness.service.CompanyTotalSalesService;

@Controller
public class CompanyTotalSalesController {
	@Autowired CompanyTotalSalesService service;
	
	//------------------|������ �� ���� ��Ȳ ��ü��Ϻ��� ������ ����(���̺��: centertotalsales)|------------------//
	@RequestMapping(value="ctsSelect",method=RequestMethod.GET)
	public String centerTotSelect(){
		return ".sales.centerTotSelect";
	}
	
	//----------| ������ �� ���� ��Ȳ ��ü��Ϻ���(selectList)(���̺��: centertotalsales) |----------//
	@RequestMapping(value="/ctsSelect/xml",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String ctsSelect(String searchMonth){
		System.out.println("�˻����� date : "+searchMonth);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("searchMonth", searchMonth);
		
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<getTotList>");
		List<CenterTotalSalesDto> list=service.ctsSelect(map);
		System.out.println("������ �������� ����Ʈ : "+list);
		for(CenterTotalSalesDto dto:list){
			sb.append("<tot>");
			sb.append("<getCts_num>"+dto.getCts_num()+"</getCts_num>");
			sb.append("<getCt_code>"+dto.getCt_code()+"</getCt_code>");
			sb.append("<getCts_income>"+dto.getCts_income()+"</getCts_income>");
			sb.append("<getCts_refund>"+dto.getCts_refund()+"</getCts_refund>");
			sb.append("<getCts_totsales>"+dto.getCts_totsales()+"</getCts_totsales>");
			sb.append("<getCts_date>"+dto.getCts_date()+"</getCts_date>");
			sb.append("</tot>");
		}
		sb.append("</getTotList>");
		return sb.toString();
	}
}
