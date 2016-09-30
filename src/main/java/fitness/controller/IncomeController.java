package fitness.controller;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

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
	public String centerInsert(IncomeDto dto,HttpServletRequest req){
		System.out.println("IncomeController ����!!");
		try{
			service.centerInsert(dto);
			req.setAttribute("result", "������ �� ���� ��� ����");
		}catch(Exception e){
			System.out.println(e.getMessage());
			req.setAttribute("result", "������ �� ���� ��� ����");
		}
		return ".staff.ResultView";
	}

	//--------------------| ������ �� ���� ��Ϻ���(Ajax->calculateAllSales.jsp) |--------------------//
	
}
