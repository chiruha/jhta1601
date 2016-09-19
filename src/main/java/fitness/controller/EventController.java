package fitness.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import fitness.dto.EventDto;
import fitness.service.EventService;
import page.util.PageUtil;

@Controller
public class EventController {
	@Autowired EventService service;
	//--------------------| 이벤트 등록하기 |--------------------//
	@RequestMapping(value="/eventInsert",method=RequestMethod.GET)
	public String eventInsertForm(){
		return ".event.eventInsert";
	}
	
	@RequestMapping(value="/eventInsert",method=RequestMethod.POST)
	public String eventInsert(String ev_title,
								String ev_content,
								String stf_num,
								Date ev_date,
								MultipartFile ev_picture,
								HttpSession session){
		System.out.println("eventInsert Controller 도착!!");
		//upload폴더의 절대경로 얻어오기
		String path=session.getServletContext().getRealPath("/resources/img/Event");
		System.out.println("업로드파일 절대경로 : "+path);
		//전송한 파일명 얻어오기
		String orgfilename=ev_picture.getOriginalFilename();
		//저장할 파일명 만들기(전송된 파일이름이 기존의 것과 동일한 경우, 중복되지 않게 하기 위함
		String savefilename=UUID.randomUUID()+"_"+orgfilename;
		//UUID.randomUUID(): 클래스의 메소드인데, 중복되지 않는 난수를 얻어올때 사용
		try{
			InputStream is=ev_picture.getInputStream();//전송된 파일을 읽어오기 위한 스트림객체
			FileOutputStream fos=new FileOutputStream(path+"/"+savefilename);//전송된 파일을 서버에 복사하기 위한 출력스트림객체
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			System.out.println(path+"/"+savefilename+"[이벤트사진업로드성공]");
			int stfnum=Integer.parseInt(stf_num);
			EventDto dto=new EventDto(0, ev_title, savefilename, ev_content, stfnum, null);
			System.out.println(dto.toString());	
			int n=service.eventInsert(dto);//입력하기
			System.out.println("success인가?? "+n);
			return ".member.memSuccess";
		}catch(IOException ie){
			System.out.println(ie.getMessage());
			return ".member.memError";
		}
		
	}
	//--------------------| 이벤트 전체목록보기 & "최신글" 상세보기 |--------------------//
	@RequestMapping("/eventSelectAll")
	public ModelAndView eventSelectAll(@RequestParam(value="pageNum",defaultValue="1")int pageNum){
		int totalRowCount=service.getEventCount();
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 5, 5);
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<EventDto> list=service.eventSelectAll(map);//글전체목록보기
		System.out.println("이벤트 글 전체보기 : "+list);
		
		EventDto dto=service.eventSelectNew();//최신글 상세보기
		System.out.println("최신글 dto : "+dto.toString());

		ModelAndView mv=new ModelAndView();
		mv.addObject("list",list);//글전체목록
		mv.addObject("pu",pu);//페이징
		mv.addObject("selectNew",dto);//최신글내용
		
		mv.setViewName(".event.eventSelectNew");
		return mv;
	}
	//--------------------| 이벤트 전체목록보기 & "선택한 글" 상세보기 |--------------------//
	@RequestMapping("/eventSelectAll2")
	public ModelAndView eventSelectAll2(int ev_num,@RequestParam(value="pageNum",defaultValue="1")int pageNum){
		int totalRowCount=service.getEventCount2();
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 5, 5);
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<EventDto> list=service.eventSelectAll2(map);//전체목록보기
		System.out.println("이벤트 글 전체보기 : "+list);
		
		EventDto dto=service.eventListOne(ev_num);//선택한 글 상세보기
		ModelAndView mv=new ModelAndView();
		mv.addObject("listone",dto);//선택한글
		mv.addObject("list",list);//글전체목록
		mv.addObject("pu",pu);//페이징
		mv.setViewName(".event.eventSelectOne");
		return mv;
	}

	//--------------------| 이벤트 삭제하기 |--------------------//
	@RequestMapping("/eventDelete")
	public String eventDel(int ev_num){
		try{
			service.delAnswer(ev_num);
			service.eventDel(ev_num);
			return ".member.memSuccess";
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".member.memError";
		}
	}
	//--------------------| 이벤트 수정페이지 상세보기 |--------------------//
	@RequestMapping("/eventUpdateList")
	public ModelAndView eventUpdateListOne(int ev_num){
		EventDto dto=service.eventListOne(ev_num);
		ModelAndView mv=new ModelAndView();
		mv.addObject("listone",dto);
		mv.setViewName(".event.eventUpdate");
		return mv;
	}

	//--------------------| 이벤트 수정하기 |--------------------//
	@RequestMapping("/eventUpdate")
	public String eventUpdate(int ev_num,String ev_title,
			String ev_content,
			String stf_num,
			Date ev_date,
			MultipartFile ev_picture,
			HttpSession session){
		System.out.println("stf_num"+stf_num);
		int stfnum=Integer.parseInt(stf_num);
		String path=session.getServletContext().getRealPath("/resources/img/Event");
		System.out.println("수정 업로드파일 절대경로 : "+path);
		EventDto dto=service.eventListOne(ev_num);
		File orgfile=new File(path+"\\"+dto.getEv_picture());
		orgfile.delete();
		//전송한 파일명 얻어오기
		String orgfilename=ev_picture.getOriginalFilename();
		String savefilename=UUID.randomUUID()+"_"+orgfilename;
		try{
			InputStream is=ev_picture.getInputStream();
			FileOutputStream fos=new FileOutputStream(path+"\\"+savefilename);
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			System.out.println(path+"/"+savefilename+"[이벤트사진 update성공]");
			EventDto dto1=new EventDto(ev_num, ev_title, savefilename, ev_content, stfnum, null);
			System.out.println("event Update Dto : "+dto1.toString());
			int n=service.eventUpdate(dto1);//수정하기
			System.out.println("수정success인가?? "+n);
			return ".member.memSuccess";
		}catch(IOException ie){
			System.out.println(ie.getMessage());
			return ".member.memError";
		}
	}
}
