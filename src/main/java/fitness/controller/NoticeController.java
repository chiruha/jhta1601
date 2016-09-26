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
	@Autowired private StaffService StaffService;
	
	//�۵���ϱ� �μ�Ʈ
	@RequestMapping(value="/nocinsert",method= RequestMethod.GET)
	public String insert(){
		return ".notice.NocInsertView";
	}
	@RequestMapping(value="/nocinsert",method=RequestMethod.POST)
	public String insert(NoticeDto dto, HttpSession session){
		try{
			System.out.println(dto);
			service.insert(dto);
			session.setAttribute("result", "���� �� �߰� �Ϸ�!");
			}catch(Exception e){
				System.out.println(e.getMessage());
				session.setAttribute("result", "���� �� �߰� ����!");
			}
			return ".staff.ResultView";
		}
	//�˻� ��� ������ ��Ϻ���
	@RequestMapping("/noclist")
	public String selectAll(@RequestParam(value="pageNum",defaultValue="1") int pageNum, HttpSession session,
			HttpServletRequest request){
		String title=request.getParameter("title");
		String writer=request.getParameter("writer");
		String keyword=request.getParameter("keyword");
		
		// �ƹ��͵� ���õ��� �ʾ��� ��
		System.out.println(",������:"+title+",�ۼ���:"+writer+",keyword:"+keyword);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("title", title);
		map.put("writer", writer);
		map.put("keyword", keyword);
		
		//üũ�ڽ� ���� ������ ���� �� ��������
		session.setAttribute("title", title);
		session.setAttribute("writer", writer);
		session.setAttribute("keyword", keyword);
		
		int totalRowCount=service.getNocCount(map);
		System.out.println("������� �����ȿ��� ����Ʈ");
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 10, 5);
		map.put("startRow", pu.getStartRow()); 
		map.put("endRow", pu.getEndRow());
		List<NoticeDto> nlist=service.list(map);
		System.out.println(nlist);
		session.setAttribute("nlist",nlist);
		session.setAttribute("pu",pu);
		return ".notice.NoticeView";		
		
	}
	//�� �󼼺��� ������
		@RequestMapping("/noclistOne")
		public ModelAndView listOne(int nt_num){
			NoticeDto dto=service.listOne(nt_num); //dto
			service.addHit(nt_num);
			ModelAndView mv=new ModelAndView();
			mv.addObject("dto",dto);
			mv.setViewName(".notice.NocListOne");
			HashMap<String, Object> map;
		//	service.addHit(nt_num);
			System.out.println(dto);
			System.out.println(mv);
			return mv;
		}
	//�� �����ϱ� ����Ʈ
	@RequestMapping("/nocDelete")
	public String nocDelete(int nt_num, HttpSession session){
		try{
			service.NocDelete(nt_num);
			session.setAttribute("result", "���� �� ���� �Ϸ�!");
		}catch(Exception e){
			System.out.println(e.getMessage());
			session.setAttribute("result", "���� �� ���� ����!");
		}
		return ".staff.ResultView";
	}
	//�� �����ϱ� ������Ʈ"nocUpdate?nt_num=${dto.nt_num }"
	@RequestMapping(value="/nocUpdate", method= RequestMethod.GET) 
	public String update(int nt_num ,HttpSession session){
       
		NoticeDto dto=service.listOne(nt_num); //�󼼺��� ������ 
		session.setAttribute("dto", dto);		
		return ".notice.NocUpdateList";
	}
	@RequestMapping(value="/nocUpdate", method= RequestMethod.POST)
	public String update(NoticeDto dto, HttpSession session){
        try{
        	System.out.println(dto.toString());
        	service.NocUpdate(dto);
    		session.setAttribute("result", "���� �� ���� �Ϸ�!");
    		}catch(Exception e){
    			System.out.println(e.getMessage());
    			session.setAttribute("result", "���� �� ���� ����!");
    		}
    		return ".staff.ResultView";
    	}
}

