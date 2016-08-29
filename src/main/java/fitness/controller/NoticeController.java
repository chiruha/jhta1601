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
	//�������� ���������ü� ���ݾƿ� ,,�������� ���� ��Ʈ������ 
	//����� �ְ� �����۽��� ���������� ������ �ִ� �̰ɷ� ������ �ش� 
	@RequestMapping(value="/nocinsert",method=RequestMethod.POST)
	public String insert(NoticeDto dto, HttpSession session){
		try{
			String result=staffservice.detailService(2).getPos_code();
			System.out.println(result);
			if(result.equals("A"))
			{ service.insert(dto);
			}else{
				System.out.println("������ �����ϴ�"); //���������� ������ ���ְ� �ֿܼ����� �����ϱ�
			}
			//dto.setStf_num(staffDto dto,stf_num);
			System.out.println("������� ���� �ȿ��� �μ�Ʈ���߿´�");
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
		System.out.println("������� �����ȿ��� ����Ʈ");
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 5, 5);
		HashMap<String, String> map = new HashMap<String, String>(); //��Ʈ�� ��Ʈ���̴� �˻��� ���� ��Ʈ������ �޾ƿ´� 
		map.put("startRow", Integer.toString(pu.getStartRow())); //������Ƽ���ε� ��Ʈ������ �ٲ۴�
		map.put("endRow", Integer.toString(pu.getEndRow()));
		List<NoticeDto> list = service.list(map);
		System.out.println("��ü����"+list); //��ü ������� �߿´� 
		ModelAndView mv = new ModelAndView(".notice.NoticeView"); //.���ϸ�.�����̸����� ���ش� 
		mv.addObject("noclist",list);
		mv.addObject("pu",pu);
		return mv;		
		
	}
	
	
}
 