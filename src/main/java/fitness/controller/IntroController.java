package fitness.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IntroController {

	
	@RequestMapping(value="/Apgujeong",method= RequestMethod.GET)
	public String Apgujeong(){
	//System.err.println("여기로 오나~~~");
		return ".intro.Apgujeong";
	}
	@RequestMapping(value="/Hwajeong",method= RequestMethod.GET)
	public String Hwajeong(){
		return ".intro.Hwajeong";
	}
	@RequestMapping(value="/Jongno",method= RequestMethod.GET)
	public String Jongno(){
		return ".intro.Jongno";
	}
	@RequestMapping(value="/Jongnosamga",method= RequestMethod.GET)
	public String Jongnosamga(){
		return ".intro.Jongnosamga";
	}
	@RequestMapping(value="/Sinchon",method= RequestMethod.GET)
	public String Sinchon(){
		return ".intro.Sinchon";
	}
	@RequestMapping(value="/Songpa",method= RequestMethod.GET)
	public String Songpa(){
		return ".intro.Songpa";
	}
	
}
