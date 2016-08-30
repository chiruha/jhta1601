package fitness.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fitness.dto.CenterDto;
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
			session.setAttribute("result", "직급 추가 성공!!");
		}catch(Exception e){
			System.out.println(e.getMessage());
			session.setAttribute("result", "직급 추가 성공!!");
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
			session.setAttribute("result", "부서 추가 성공!!");
		}catch(Exception e){
			System.out.println(e.getMessage());
			session.setAttribute("result", "부서 추가 성공!!");
		}
		return ".staff.ResultView";
	}
}
