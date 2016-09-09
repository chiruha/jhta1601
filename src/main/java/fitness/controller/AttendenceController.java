package fitness.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AttendenceController {
	
	
	
	@RequestMapping("/attcheck")
	public String attlist(){
		
		return ".attendance.AttInsertView";
	}
	@RequestMapping("/attlist")
	public String attinsert(){
		
		return ".attendance.AttListView";
	}
	
	
}
