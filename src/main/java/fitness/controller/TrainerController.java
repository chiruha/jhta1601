package fitness.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import fitness.dto.StaffDto;
import fitness.dto.TrainerDto;
import fitness.service.StaffService;
import fitness.service.TrainerService;
import page.util.PageUtil;

@Controller
public class TrainerController {
	@Autowired private TrainerService service;
	@Autowired private StaffService sts;
	
	@RequestMapping("/trpage")
	public String page(int num,HttpSession session){
		session.setAttribute("num", num);
		StaffDto sdto=sts.detailService(num);
		session.setAttribute("sdto", sdto);
		System.out.println("trpage stf_num: "+num);
		System.out.println("sdto : "+sdto.toString());
		try{
			if(service.detail2Service(num)!=null){
				System.out.println("trpage if : "+service.detail2Service(num));
				session.setAttribute("dto", service.detail2Service(num));
				return ".staff.TrUpdateView";
			}else{
				return ".staff.TrInsertView";
			}			
		}catch(Exception e){
			System.out.println(e.getMessage());
			session.setAttribute("result", "���� ���/���� ������ �̵� ����!");
			return ".staff.ResultView";
		}
	}
	
	@RequestMapping("/trlist")
	public String list(HttpSession session,@RequestParam(value="pageNum", defaultValue="1") int pageNum){
		try{
			System.out.println("tr �׽�Ʈ");
			HashMap<String, Object> map =new HashMap<String, Object>();
			int totalRowCount=service.getTrCount(map);
			PageUtil pu=new PageUtil(pageNum, totalRowCount,10,5);
			map.put("startRow", pu.getStartRow());
			map.put("endRow", pu.getEndRow());		
			session.setAttribute("pu", pu);
			
			List<TrainerDto> trlist=service.listService(map);
			session.setAttribute("trlist", trlist);
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return ".staff.TrListView";
	}
	
	@RequestMapping("/trdetail")
	public String detail(int tr_num, HttpSession session){
		try{
			TrainerDto dto=service.detailService(tr_num);
			session.setAttribute("dto", dto);
			System.out.println(dto.toString());
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return ".staff.TrDetailView";
	}
	
	@RequestMapping("/trdelete")
	public String delete(int tr_num, HttpSession session){
		try{
			service.deleteService(tr_num);
			session.setAttribute("result", "���� ���� �Ϸ�");
		}catch(Exception e){
			System.out.println(e.getMessage());
			session.setAttribute("result", "���� ���� ����");
		}
		return ".staff.ResultView";
	}
	
	
	@RequestMapping(value="/trpage/trinsert", method= RequestMethod.POST)
	public String insert(TrainerDto dto, HttpSession session){
		System.out.println("trinsert"+dto.toString());
		try{
			service.insertService(dto);
			session.setAttribute("result", "���� ��� ����!");
		}catch(Exception e){
			System.out.println(e.getMessage());
			session.setAttribute("result", "���� ��� ����!");
		}
			return ".staff.ResultView";
	}
	
	@RequestMapping(value="/trpage/trupdate", method = RequestMethod.POST)
	public String update(TrainerDto dto, HttpSession session){
	try{
		System.out.println("trupdate"+dto.toString());
		service.updateService(dto);
		session.setAttribute("result", "���� ���� ����!");
	}catch(Exception e){
		System.out.println(e.getMessage());
		session.setAttribute("result", "���� ���� ����!");
	}
		return ".staff.ResultView";
	}
}
