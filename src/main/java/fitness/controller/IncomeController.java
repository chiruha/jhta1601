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

	//--------------------| 지점별 월 수입 등록 |--------------------//
	@RequestMapping(value="/centerIncomeInsert",method=RequestMethod.POST)
	public String centerInsert(IncomeDto dto,HttpServletRequest req){
		System.out.println("IncomeController 도착!!");
		try{
			service.centerInsert(dto);
			req.setAttribute("result", "지점별 월 수입 계산 성공");
		}catch(Exception e){
			System.out.println(e.getMessage());
			req.setAttribute("result", "지점별 월 수입 계산 실패");
		}
		return ".staff.ResultView";
	}

	//--------------------| 지점별 월 수입 목록보기(Ajax->calculateAllSales.jsp) |--------------------//
	
}
