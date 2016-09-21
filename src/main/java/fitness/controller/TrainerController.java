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

import fitness.dto.CenterDto;
import fitness.dto.PositionDto;
import fitness.dto.StaffDto;
import fitness.dto.TrainerDto;
import fitness.service.CenterService;
import fitness.service.PositionService;
import fitness.service.StaffService;
import fitness.service.TrainerService;
import page.util.PageUtil;

@Controller
public class TrainerController {
	@Autowired private TrainerService service;
	@Autowired private StaffService sts;
	@Autowired private PositionService pos;
	@Autowired private CenterService cts;
	@RequestMapping("/trpage")
	public String page(int num, HttpServletRequest request){
		request.setAttribute("num", num);
		StaffDto sdto=sts.detailService(num);
		request.setAttribute("sdto", sdto);
		System.out.println("trpage stf_num: "+num);
		System.out.println("sdto : "+sdto.toString());
		try{
			if(service.detail2Service(num)!=null){
				System.out.println("trpage if : "+service.detail2Service(num));
				request.setAttribute("dto", service.detail2Service(num));
				return ".staff.TrUpdateView";
			}else{
				return ".staff.TrInsertView";
			}			
		}catch(Exception e){
			System.out.println(e.getMessage());
			request.setAttribute("result", "강사 등록/수정 페이지 이동 실패!");
			return ".staff.ResultView";
		}
	}
	
	@RequestMapping("/trlist")
	public String list(@RequestParam(value="pageNum", defaultValue="1") int pageNum, HttpServletRequest request){
		try{
			String ttype=request.getParameter("ttype");
			String tkeyword=request.getParameter("tkeyword");
			System.out.println("ttype : "+ttype+", tkey : "+tkeyword);
			HashMap<String, Object> map =new HashMap<String, Object>();
			map.put("ttype", ttype);
			map.put("tkeyword", tkeyword);
			int totalRowCount=service.getTrCount(map);
			PageUtil pu=new PageUtil(pageNum, totalRowCount,10,5);
			map.put("startRow", pu.getStartRow());
			map.put("endRow", pu.getEndRow());		
			request.setAttribute("pu", pu);
			List<TrainerDto> trlist=service.listService(map);
			request.setAttribute("trlist", trlist);
			request.setAttribute("ttype", ttype);
			request.setAttribute("tkeyword", tkeyword);
			System.out.println("trlist : "+trlist);
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return ".staff.TrListView";
	}
	
	@RequestMapping("/trdetail")
	public String detail(int tr_num, HttpServletRequest request){
		try{
			TrainerDto dto=service.detailService(tr_num);
			StaffDto sdto=sts.detailService(dto.getStf_num());
			CenterDto cdto=cts.detailService(sdto.getCt_code());
			PositionDto pdto=pos.detailService(sdto.getPos_code());
			request.setAttribute("pdto", pdto);
			request.setAttribute("cdto", cdto);
			request.setAttribute("sdto", sdto);
			request.setAttribute("dto", dto);
			System.out.println(dto.toString());
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return ".staff.TrDetailView";
	}
	
	@RequestMapping("/trdelete")
	public String delete(int tr_num, HttpServletRequest request){
		try{
			service.deleteService(tr_num);
			request.setAttribute("result", "강사 삭제 완료");
		}catch(Exception e){
			System.out.println(e.getMessage());
			request.setAttribute("result", "강사 삭제 실패");
		}
		return ".staff.ResultView";
	}
	
	
	@RequestMapping(value="/trpage/trinsert", method= RequestMethod.POST)
	public String insert(TrainerDto dto, HttpServletRequest request){
		System.out.println("trinsert"+dto.toString());
		try{
			service.insertService(dto);
			request.setAttribute("result", "강사 등록 성공!");
		}catch(Exception e){
			System.out.println(e.getMessage());
			request.setAttribute("result", "강사 등록 실패!");
		}
			return ".staff.ResultView";
	}
	
	@RequestMapping(value="/trpage/trupdate", method = RequestMethod.POST)
	public String update(TrainerDto dto, HttpServletRequest request){
	try{
		System.out.println("trupdate"+dto.toString());
		service.updateService(dto);
		request.setAttribute("result", "강사 수정 성공!");
	}catch(Exception e){
		System.out.println(e.getMessage());
		request.setAttribute("result", "강사 수정 실패!");
	}
		return ".staff.ResultView";
	}
}
