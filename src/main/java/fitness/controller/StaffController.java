package fitness.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import fitness.dto.CenterDto;
import fitness.dto.PositionDto;
import fitness.dto.StaffDto;
import fitness.service.CenterService;
import fitness.service.PositionService;
import fitness.service.StaffService;
import page.util.PageUtil;

@Controller
public class StaffController {
	@Autowired private StaffService service;
	@Autowired private CenterService cts;
	@Autowired private PositionService pos;	
	
	@RequestMapping(value="/stfinsert",method= RequestMethod.GET)
	public String insert(HttpSession session){
		List<CenterDto> ctlist=cts.listService();
		List<PositionDto>poslist=pos.listService();
		session.setAttribute("poslist", poslist);
		session.setAttribute("ctlist", ctlist);
		return ".staff.StfInsertView";
	}
	@RequestMapping(value="/stfinsert",method= RequestMethod.POST)
	public String insert(StaffDto dto, MultipartFile picture,HttpSession session){
		try{
			String path=session.getServletContext().getRealPath("/resources/img/Staff");
			String stf_picture=picture.getOriginalFilename();
			if(stf_picture!=""){   // 사진 등록할 경우만 파일명 복잡하게 만들기
				System.out.println("사진1:"+stf_picture);
				stf_picture=UUID.randomUUID()+"_"+stf_picture;
				System.out.println("사진2:"+stf_picture);
				InputStream is=picture.getInputStream();
				FileOutputStream fos=new FileOutputStream(path+"/"+stf_picture);
				FileCopyUtils.copy(is, fos);
				is.close();
				fos.close();
			}
			dto.setStf_picture(stf_picture);
			System.out.println(dto.toString());
			service.insertService(dto);
			session.setAttribute("result", "직원 등록 성공!");
		}catch(Exception e){
			System.out.println(e.getMessage());
			session.setAttribute("result", "직원 등록 실패!");
		}
		return ".staff.ResultView";
	}
	@RequestMapping("/stflist")
	public String list(@RequestParam(value="pageNum", defaultValue="1") int pageNum, HttpSession session){
		int totalRowCount=service.getStfCount();
		PageUtil pu=new PageUtil(pageNum, totalRowCount,5,5);
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<StaffDto> stflist=service.listService(map);
		session.setAttribute("stflist", stflist);
		session.setAttribute("pu", pu);
		return ".staff.StfListView";
	}
	@RequestMapping("/stfdetail")
	public String detail(String stf_num ,HttpSession session){
		try{
			int num=Integer.parseInt(stf_num);
			StaffDto dto=service.detailService(num);
			PositionDto pdto=pos.detailService(dto.getPos_code());
			CenterDto cdto=cts.detailService(dto.getCt_code());
			session.setAttribute("pdto", pdto);
			session.setAttribute("cdto", cdto);
			session.setAttribute("dto", dto);
			return ".staff.StfDetailView";
		}catch(Exception e){
			System.out.println(e.getMessage());
			session.setAttribute("result", "상세보기 실패!");
			return ".staff.ResultView";
		}
	}

}
