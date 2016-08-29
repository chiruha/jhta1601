package fitness.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	//스태프의 값을가져올수 있잖아요 ,,스태프가 넘을 스트링값을 
	//디비값을 넣고 에이작스나 제이쿼리로 쓸수가 있다 이걸로 권한을 준다 
	@RequestMapping(value="/nocinsert",method=RequestMethod.POST)
	public String insert(NoticeDto dto, HttpSession session){
		try{
			String result=staffservice.detailService(2).getPos_code();
			System.out.println(result);
			if(result.equals("A"))
			{ service.insert(dto);
			}else{
				System.out.println("권한이 없습니다"); //뷰페이지에 나오게 해주고 콘솔에서만 나오니깐
			}
			//dto.setStf_num(staffDto dto,stf_num);
			System.out.println("여기까지 오나 안오나 인서트는잘온다");
			service.insert(dto);
			return ".notice.NocSuccess";
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".notice.NocError";
		}
	}
	@RequestMapping("/noclist")
	public ModelAndView selectAll(@RequestParam(value="pageNum",defaultValue="1") int pageNum){
		int totalRowCount=service.getCount();
		System.out.println("여기까지 오나안오나 리스트");
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 5, 5);
		HashMap<String, String> map = new HashMap<String, String>(); //스트링 스트링이다 검색이 문자 스트링으로 받아온다 
		map.put("startRow", Integer.toString(pu.getStartRow())); //전부인티저인데 스트링으로 바꾼다
		map.put("endRow", Integer.toString(pu.getEndRow()));
		List<NoticeDto> list = service.list(map);
		System.out.println("전체보기"+list); //전체 찍어본결과값 잘온다 
		ModelAndView mv = new ModelAndView(".notice.NoticeView"); //.파일명.파일이름으로 써준다 
		mv.addObject("noclist",list);
		mv.addObject("pu",pu);
		return mv;		
		
	}
	
	
}
 