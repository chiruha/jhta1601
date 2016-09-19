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
	//--------------------| �̺�Ʈ ����ϱ� |--------------------//
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
		System.out.println("eventInsert Controller ����!!");
		//upload������ ������ ������
		String path=session.getServletContext().getRealPath("/resources/img/Event");
		System.out.println("���ε����� ������ : "+path);
		//������ ���ϸ� ������
		String orgfilename=ev_picture.getOriginalFilename();
		//������ ���ϸ� �����(���۵� �����̸��� ������ �Ͱ� ������ ���, �ߺ����� �ʰ� �ϱ� ����
		String savefilename=UUID.randomUUID()+"_"+orgfilename;
		//UUID.randomUUID(): Ŭ������ �޼ҵ��ε�, �ߺ����� �ʴ� ������ ���ö� ���
		try{
			InputStream is=ev_picture.getInputStream();//���۵� ������ �о���� ���� ��Ʈ����ü
			FileOutputStream fos=new FileOutputStream(path+"/"+savefilename);//���۵� ������ ������ �����ϱ� ���� ��½�Ʈ����ü
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			System.out.println(path+"/"+savefilename+"[�̺�Ʈ�������ε强��]");
			int stfnum=Integer.parseInt(stf_num);
			EventDto dto=new EventDto(0, ev_title, savefilename, ev_content, stfnum, null);
			System.out.println(dto.toString());	
			int n=service.eventInsert(dto);//�Է��ϱ�
			System.out.println("success�ΰ�?? "+n);
			return ".member.memSuccess";
		}catch(IOException ie){
			System.out.println(ie.getMessage());
			return ".member.memError";
		}
		
	}
	//--------------------| �̺�Ʈ ��ü��Ϻ��� & "�ֽű�" �󼼺��� |--------------------//
	@RequestMapping("/eventSelectAll")
	public ModelAndView eventSelectAll(@RequestParam(value="pageNum",defaultValue="1")int pageNum){
		int totalRowCount=service.getEventCount();
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 5, 5);
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<EventDto> list=service.eventSelectAll(map);//����ü��Ϻ���
		System.out.println("�̺�Ʈ �� ��ü���� : "+list);
		
		EventDto dto=service.eventSelectNew();//�ֽű� �󼼺���
		System.out.println("�ֽű� dto : "+dto.toString());

		ModelAndView mv=new ModelAndView();
		mv.addObject("list",list);//����ü���
		mv.addObject("pu",pu);//����¡
		mv.addObject("selectNew",dto);//�ֽű۳���
		
		mv.setViewName(".event.eventSelectNew");
		return mv;
	}
	//--------------------| �̺�Ʈ ��ü��Ϻ��� & "������ ��" �󼼺��� |--------------------//
	@RequestMapping("/eventSelectAll2")
	public ModelAndView eventSelectAll2(int ev_num,@RequestParam(value="pageNum",defaultValue="1")int pageNum){
		int totalRowCount=service.getEventCount2();
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 5, 5);
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<EventDto> list=service.eventSelectAll2(map);//��ü��Ϻ���
		System.out.println("�̺�Ʈ �� ��ü���� : "+list);
		
		EventDto dto=service.eventListOne(ev_num);//������ �� �󼼺���
		ModelAndView mv=new ModelAndView();
		mv.addObject("listone",dto);//�����ѱ�
		mv.addObject("list",list);//����ü���
		mv.addObject("pu",pu);//����¡
		mv.setViewName(".event.eventSelectOne");
		return mv;
	}

	//--------------------| �̺�Ʈ �����ϱ� |--------------------//
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
	//--------------------| �̺�Ʈ ���������� �󼼺��� |--------------------//
	@RequestMapping("/eventUpdateList")
	public ModelAndView eventUpdateListOne(int ev_num){
		EventDto dto=service.eventListOne(ev_num);
		ModelAndView mv=new ModelAndView();
		mv.addObject("listone",dto);
		mv.setViewName(".event.eventUpdate");
		return mv;
	}

	//--------------------| �̺�Ʈ �����ϱ� |--------------------//
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
		System.out.println("���� ���ε����� ������ : "+path);
		EventDto dto=service.eventListOne(ev_num);
		File orgfile=new File(path+"\\"+dto.getEv_picture());
		orgfile.delete();
		//������ ���ϸ� ������
		String orgfilename=ev_picture.getOriginalFilename();
		String savefilename=UUID.randomUUID()+"_"+orgfilename;
		try{
			InputStream is=ev_picture.getInputStream();
			FileOutputStream fos=new FileOutputStream(path+"\\"+savefilename);
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			System.out.println(path+"/"+savefilename+"[�̺�Ʈ���� update����]");
			EventDto dto1=new EventDto(ev_num, ev_title, savefilename, ev_content, stfnum, null);
			System.out.println("event Update Dto : "+dto1.toString());
			int n=service.eventUpdate(dto1);//�����ϱ�
			System.out.println("����success�ΰ�?? "+n);
			return ".member.memSuccess";
		}catch(IOException ie){
			System.out.println(ie.getMessage());
			return ".member.memError";
		}
	}
}
