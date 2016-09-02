package com.project.fitness;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(@RequestParam(value="test", defaultValue="none") String test) {
		if(test.equals("goboot")){
			System.out.println("∏ﬁ¿Œ : "+test);
			return ".bootmain";
		}
		return ".main";
	}
	
}
