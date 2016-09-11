package fitness.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AttendenceController {
	
	
	
	@RequestMapping("/attcheck")
	public String attlist(String num, String type){
		System.out.println("attCtr num : "+ num +", type : "+type);
		return ".attendance.AttInsertView";
	}
	@RequestMapping("/attlist")
	public String attinsert(){
		
		return ".attendance.AttListView";
	}
	
	
}
