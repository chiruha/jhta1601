package fitness.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import fitness.dto.NoticeDto;
import fitness.service.NoticeService;
import fitness.service.StaffService;
import page.util.PageUtil;

@Controller
public class NoticeController {
	@Autowired private NoticeService service;
	@Autowired private StaffService staffservice;
	
	
	
	@RequestMapping(value="/nocinsert",method=RequestMethod.GET)
	public String insert(){
		return ".notice.NocInsertView";
	}
	
	@RequestMapping(value="/nocinsert",method=RequestMethod.POST)
	public String insert(NoticeDto dto, HttpSession session){
		try{
			service.insert(dto);
			return ".notice.NocSuccess";
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".notice.NocError";
		}
	}
	@RequestMapping("/noclist")
	public ModelAndView list(@RequestParam(value="pageNum",defaultValue="1") int pageNum){
		int totalRowCount=service.getCount();
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 5, 5);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<NoticeDto> list = service.list(map);
		
		ModelAndView mv = new ModelAndView("noclist");
		mv.addObject("noclist",list);
		mv.addObject("pu",pu);
		return mv;		
		
	}
}
 