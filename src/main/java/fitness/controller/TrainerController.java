package fitness.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fitness.dto.StaffDto;
import fitness.dto.TrainerDto;
import fitness.service.StaffService;
import fitness.service.TrainerService;

@Controller
public class TrainerController {
	@Autowired private TrainerService service;
	@Autowired private StaffService stf;
	
	@RequestMapping(value="/trinsert", method=RequestMethod.GET)
	public String insert(String stf_num, HttpSession session){
		int num=Integer.parseInt(stf_num);
		StaffDto dto=stf.detailService(num);
		session.setAttribute("dto", dto);
		return ".staff.TrInsertView";
	}
	@RequestMapping(value="/trinsert", method=RequestMethod.POST)
	public String insert(TrainerDto dto, HttpSession session){
	try{
		service.insertService(dto);
		session.setAttribute("result", "강사 등록 성공!");
	}catch(Exception e){
		System.out.println(e.getMessage());
		session.setAttribute("result", "강사 등록 실패!");
	}
		return ".staff.ResultView";
	}
}
