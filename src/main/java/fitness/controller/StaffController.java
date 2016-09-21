package fitness.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
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
	public String insert(	HttpServletRequest requset){  // insert �������� �̵�
		List<CenterDto> ctlist=cts.listService();
		List<PositionDto>poslist=pos.listService();
		requset.setAttribute("poslist", poslist);
		requset.setAttribute("ctlist", ctlist);
		return ".staff.StfInsertView";
	}
	@RequestMapping(value="/stfinsert",method= RequestMethod.POST)
	public String insert(StaffDto dto, MultipartFile picture,	HttpSession session){  // DB�� insert
		try{
			String path=session.getServletContext().getRealPath("/resources/img/Staff");
			String stf_picture=picture.getOriginalFilename();
			if(stf_picture!=""){   // ���� ����� ��츸 ���ϸ� �����ϰ� �����
				System.out.println("����1:"+stf_picture);
				stf_picture=UUID.randomUUID()+"_"+stf_picture;
				System.out.println("����2:"+stf_picture);
				InputStream is=picture.getInputStream();
				FileOutputStream fos=new FileOutputStream(path+"/"+stf_picture);
				FileCopyUtils.copy(is, fos);
				is.close();
				fos.close();
			}
			dto.setStf_picture(stf_picture);
			System.out.println(dto.toString());
			service.insertService(dto);
			session.setAttribute("result", "���� ��� ����!");
		}catch(Exception e){
			System.out.println(e.getMessage());
			session.setAttribute("result", "���� ��� ����!");
		}
		return ".staff.ResultView";
	}
	@RequestMapping("/stflist") // �˻� ��� ������ ��Ϻ��� 
	public String list(@RequestParam(value="pageNum", defaultValue="1") int pageNum, HttpServletRequest request){
		String ct_code=request.getParameter("ct_code");
		String pos_code=request.getParameter("pos_code");
		String stf_name=request.getParameter("stf_name");
		String stf_phone=request.getParameter("stf_phone");
		String keyword=request.getParameter("keyword");
		String stype=request.getParameter("stype");
		// �ƹ��͵� ���õ��� �ʾ��� ��
		System.out.println("(�����˻�) ����: "+ct_code+", ����: "+pos_code+", �̸�: "+stf_name+", ��ȭ: "+stf_phone+", �˻���: "+keyword+"stype : "+stype);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("ct_code", ct_code);
		map.put("pos_code", pos_code);
		map.put("stf_name", stf_name);
		map.put("stf_phone", stf_phone);
		map.put("stype", stype);
		map.put("keyword", keyword);
		
		int totalRowCount=service.getStfCount(map);
		PageUtil pu=new PageUtil(pageNum, totalRowCount,10,5);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<StaffDto> stflist=service.listService(map);
		// üũ�ڽ� ���� ������ ���� �� �����ֱ�
		request.setAttribute("ct_code", ct_code);
		request.setAttribute("pos_code", pos_code);
		request.setAttribute("stf_name", stf_name);
		request.setAttribute("stf_phone", stf_phone); 
		request.setAttribute("keyword", keyword);
		
		request.setAttribute("stflist", stflist);
		System.out.println("stflist��Ʈ�� :"+stflist);
		request.setAttribute("pu", pu);
		return ".staff.StfListView";
	}
	@RequestMapping("/stfdetail")
	public String detail(String stf_num, HttpSession session){
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
			session.setAttribute("result", "�󼼺��� ����!");
			return ".staff.ResultView";
		}
	}
	@RequestMapping("/stfdelete")
	public String delete(StaffDto dto,	HttpSession session){
		System.out.println("stfdelete : "+dto.toString());
		try{
			service.deleteService(dto.getStf_num());
			session.setAttribute("result", "���� ����!");
		}catch(Exception e){
			System.out.println(e.getMessage());
			session.setAttribute("result", "���� ����!");
		}
		return ".staff.ResultView";
	}
	@RequestMapping("/stfupdate")
	public String update(StaffDto dto,MultipartFile picture, HttpSession session){
		System.out.println("stf������Ʈ : "+dto.toString()+"pic : "+picture);
	try{
		String path=session.getServletContext().getRealPath("/resources/img/Staff");
		String stf_picture=picture.getOriginalFilename();
		if(stf_picture!=""){   // ���� ����� ��츸 ���ϸ� �����ϰ� �����
			File delfile=new File(path+"/"+dto.getStf_picture());
			boolean result=delfile.delete();
			if(result==true){ 
				System.out.println("�������� ���� �Ϸ�");
			}else{
				System.out.println("�������� ���� ����");
				System.out.println(path+"/"+dto.getStf_picture());
			}
			System.out.println("����1 :"+stf_picture);
			stf_picture=UUID.randomUUID()+"_"+stf_picture;
			System.out.println("����2 :"+stf_picture);
			InputStream is=picture.getInputStream();
			FileOutputStream fos=new FileOutputStream(path+"/"+stf_picture);
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
		}
		dto.setStf_picture(stf_picture);
		System.out.println(dto.toString());
		service.updateService(dto);
		session.setAttribute("result", "���� ���� ����!");
	}catch(Exception e){
		System.out.println(e.getMessage());
		session.setAttribute("result", "���� ���� ����!");
	}
		return ".staff.ResultView";
	}
	
	@RequestMapping(value="/testpage",method= RequestMethod.GET)
	public String test(String test){  // insert �������� �̵�
		if(test.equals("1")){
			return ".staff.test2";
		}else if(test.equals("2")){
			return ".staff.testicon";
		}
		return ".staff.test2";
	}
	
	
	
	
}
