package fitness.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import fitness.dto.ExerciseLogDto;
import fitness.service.ExlogService;
import fitness.service.TrainerService;



@Controller
public class ExlogController {
	@Autowired 	private TrainerService trservice;
	@Autowired 	private ExlogService exservice;
	
	
	@RequestMapping(value="/exloginsert",method=RequestMethod.GET)
	public String exloginsert(HttpSession session){
		System.out.println("exloginsertµµÂø");
		int snum = (Integer) session.getAttribute("snum"); //staff=stf_num 
		System.out.println("snum:"+snum);
		
		
		return ".exercise.exloginsert";
	}
	
	@RequestMapping(value="/exloginsert",method=RequestMethod.POST)
	public String exloginsert(ExerciseLogDto exDto,HttpSession session){
		System.out.println("exloginsertPOSTµµÂø");
		
		//session.setAttribute("result", "Á÷¿ø µî·Ï ¼º°ø!");
		return ".exercise.exloginsert";
	}
	
	@RequestMapping(value = "/exlogList")
    public String exlogList() {        
		
		//int totalRowCount 
        
        
        return ".exercise.exlogList";
    }
}
















