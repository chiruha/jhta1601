package fitness.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import fitness.dto.DepartmentDto;
import fitness.dto.PositionDto;
import fitness.service.DepartmentService;
import fitness.service.PositionService;

@Controller
public class PosDeptController {
	@Autowired private PositionService posService;
	@Autowired private DepartmentService deptService;

	@RequestMapping(value="/posinsert", method=RequestMethod.GET)
	public String posinsert(HttpSession session){
		List<DepartmentDto> deptlist=deptService.listService();
		session.setAttribute("deptlist", deptlist);
		return ".staff.PosInsertView";
	}
	@RequestMapping(value="/posinsert", method=RequestMethod.POST)
	public String posinsert(PositionDto pdto, HttpSession session){
		try{
			posService.insertService(pdto);
			session.setAttribute("result", "���� �߰� ����!!");
		}catch(Exception e){
			System.out.println(e.getMessage());
			session.setAttribute("result", "���� �߰� ����!!");
		}
		return ".staff.ResultView";
	}
	@RequestMapping(value="/deptinsert", method=RequestMethod.GET)
	public String deptinsert(){
		return ".staff.DeptInsertView";
	}
	@RequestMapping(value="/deptinsert", method=RequestMethod.POST)
	public String deptinsert(DepartmentDto ddto, HttpSession session){
		try{
			deptService.insertService(ddto);
			session.setAttribute("result", "�μ� �߰� ����!!");
		}catch(Exception e){
			System.out.println(e.getMessage());
			session.setAttribute("result", "�μ� �߰� ����!!");
		}
		return ".staff.ResultView";
	}
	
	@RequestMapping(value="/poslist", produces="application/xml;charset=utf-8")
	@ResponseBody  // ���ϵ� ��(String)�� �������� �ƴ� ajax�� ���� �������� ó���ϰ� ����� �ִ� ��
	public String getPosName(){
		ArrayList<PositionDto> plist=(ArrayList<PositionDto>) posService.listService();
		System.out.println("poslist"+plist);
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<positions>");
		for(PositionDto dto : plist){
			sb.append("<position>");
			sb.append("<poscode>"+dto.getPos_code()+"</poscode>");
			sb.append("<posname>"+dto.getPos_name()+"</posname>");
			sb.append("</position>");
		}
		sb.append("</positions>");
		return sb.toString();
	}
}
