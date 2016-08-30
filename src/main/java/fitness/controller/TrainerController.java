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
	
	@RequestMapping("/trpage")
	public String page(StaffDto sdto, HttpSession session){
		session.setAttribute("sdto", sdto);
		try{
			if(service.detail2Service(sdto.getStf_num())!=null){
				session.setAttribute("dto", service.detail2Service(sdto.getStf_num()));
				return ".staff.TrUpdateView";
			}else{
				return ".staff.TrInsertView";
			}			
		}catch(Exception e){
			System.out.println(e.getMessage());
			session.setAttribute("result", "강사 등록/수정 페이지 이동 실패!");
			return ".staff.ResultView";
		}
	}
	
	
	
	@RequestMapping("/trinsert")
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
	
	@RequestMapping("/trupdate")
	public String update(TrainerDto dto, HttpSession session){
	try{
		System.out.println(dto.toString());
		service.updateService(dto);
		session.setAttribute("result", "강사 수정 성공!");
	}catch(Exception e){
		System.out.println(e.getMessage());
		session.setAttribute("result", "강사 수정 실패!");
	}
		return ".staff.ResultView";
	}
}
