package fitness.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fitness.dto.IncomeDto;
import fitness.service.IncomeService;

@Controller
public class IncomeController {
	@Autowired IncomeService service;

	//--------------------| ������ �� ���� ��� |--------------------//
	@RequestMapping(value="/centerIncomeInsert",method=RequestMethod.POST)
	public String centerInsert(IncomeDto dto){
		System.out.println("IncomeController ����!!");
		try{
			service.centerInsert(dto);
			return ".member.memSuccess";
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".member.memError";
		}
	}

	//--------------------| ������ �� ���� ��Ϻ���(Ajax->calculateAllSales.jsp) |--------------------//
	
}
