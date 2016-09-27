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
	@RequestMapping(value="/ctsSelect",method=RequestMethod.POST)
	public ModelAndView ctsSelect(String searchMonth){
		System.out.println("�˻����� date : "+searchMonth);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("searchMonth", searchMonth);
		
		List<CenterTotalSalesDto> list=service.ctsSelect(map);
		ModelAndView mv=new ModelAndView();
		mv.addObject("list",list);
		mv.setViewName(".sales.centerTotSelect");
		return mv;
	}
}
