package fitness.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sun.xml.internal.bind.v2.runtime.reflect.ListIterator;

import fitness.dto.ProperiodDto;
import fitness.dto.ProsignDto;
import fitness.dto.PtperiodDto;
import fitness.dto.PtsignDto;
import fitness.dto.RegistrationDto;

import fitness.service.RegistrationService;
import page.util.PageUtil;

/*
 * 수강등록 컨트롤러입니다.
 * 테이블명 : registratioin
 * */
@Controller
public class RegistrationController {
	@Autowired private RegistrationService service;
	
	@RequestMapping(value="/regiInsert",method= RequestMethod.GET)
	public String insertForm(){
		return ".registration.registrationInsert";
	}
	//----------| 수강등록(insert)(테이블명: registration,prosign,ptsign) |----------//	
	@RequestMapping(value="/regiInsert1", method=RequestMethod.POST)
	public String regiInsert(HttpServletRequest req){
		int mem_num=Integer.parseInt(req.getParameter("mem_num"));
		String rg_type=req.getParameter("rg_type");
		int rg_price=Integer.parseInt(req.getParameter("rg_price"));
		int locker_price=Integer.parseInt(req.getParameter("locker_price"));
		int wear_price=Integer.parseInt(req.getParameter("wear_price"));
		String pro_code=req.getParameter("pro_code");
		String pt_code=req.getParameter("pt_code");
		int ptr_count=Integer.parseInt(req.getParameter("ptr_count"));
		int pro_signmonth=Integer.parseInt(req.getParameter("pro_signmonth"));
		int pt_signmonth=Integer.parseInt(req.getParameter("pt_signmonth"));
		String pt_name=req.getParameter("pt_name");
		String pro_name=req.getParameter("pro_name");
		
		System.out.println("mem_num: "+mem_num);
		System.out.println("rg_type: "+rg_type);
		System.out.println("rg_price: "+rg_price);
		System.out.println("locker_price: "+locker_price);
		System.out.println("wear_price: "+wear_price);
		System.out.println("pro_code: "+pro_code);
		System.out.println("pt_code: "+pt_code);
		System.out.println("ptr_count: "+ptr_count);
		System.out.println("pro_signmonth: "+pro_signmonth);
		System.out.println("pt_signmonth: "+pt_signmonth);
		System.out.println("pt_name: "+pt_name);
		System.out.println("pro_name: "+pro_name);
		
		RegistrationDto dto1=new RegistrationDto(0, mem_num, rg_type, rg_price, locker_price, wear_price);
		
		try{
			System.out.println("regi컨트롤러: "+dto1.toString());
			service.regiInsert(dto1);//registration테이블에 insert
			int rg_num=service.getCountRegi();
			if(pro_code.equals("") && pro_name.equals("") ){//pt과목만 신청한 경우&& pro_signmonth==0
				PtsignDto dto3=new PtsignDto(0,rg_num, mem_num, pt_code, pt_name, ptr_count);
				PtperiodDto dto5=new PtperiodDto(0, rg_num, mem_num, pt_signmonth, null, null);
				service.ptsignInsert(dto3);//ptsign테이블에 insert
				service.ptperiodInsert(dto5);//ptperiod테이블에 insert
				System.out.println("ptsign컨트롤러: "+dto3.toString());
				System.out.println("ptperiod컨트롤러: "+dto5.toString());
				
				
			}else if(pt_code.equals("") && pt_name.equals("")){//단과과목만 신청한 경우 && pt_signmonth==0
				ProsignDto dto2=new ProsignDto(0, rg_num, mem_num, pro_name, pro_code);
				ProperiodDto dto4=new ProperiodDto(0, rg_num, mem_num, pro_signmonth, null, null);
				service.prosignInsert(dto2);//prosign테이블에 insert
				service.properiodInsert(dto4);//properiod테이블에 insert
				System.out.println("prosign컨트롤러: "+dto2.toString());
				System.out.println("proprice컨트롤러: "+dto4.toString());
				
			}else{//복합과목(단과과목+PT과목)신청한 경우
				ProsignDto dto2=new ProsignDto(0, rg_num, mem_num, pro_name, pro_code);
				PtsignDto dto3=new PtsignDto(0, rg_num, mem_num, pt_code, pt_name, ptr_count);
				ProperiodDto dto4=new ProperiodDto(0, rg_num, mem_num, pro_signmonth, null, null);
				PtperiodDto dto5=new PtperiodDto(0, rg_num, mem_num, pt_signmonth, null, null);
				service.prosignInsert(dto2);//prosign테이블에 insert
				service.ptsignInsert(dto3);//ptsign테이블에 insert
				service.properiodInsert(dto4);//properiod테이블에 insert
				service.ptperiodInsert(dto5);//ptperiod테이블에 insert
				System.out.println("ptsigndto: "+dto3.toString());
				System.out.println("prosigndto: "+dto2.toString());
			}
			return ".member.memSuccess";
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".member.memError";
		}
	}
	//----------| 수강등록회원 전체보기(selectList)(테이블명: registration,prosign,ptsign) |----------//
	@RequestMapping("/regiSelect")
	public ModelAndView regiSelect(@RequestParam(value="pageNum", defaultValue="1") int pageNum, HttpSession session){
		int totalRowCount=service.getCountRegi();
		PageUtil pu=new PageUtil(pageNum, totalRowCount,5,5);//한페이지5줄, 페이재갯수5개
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<RegistrationDto> list=service.regiListAll(map);
		ModelAndView mv=new ModelAndView();
		mv.addObject("listAll",list);
		mv.addObject("pu",pu);
		mv.setViewName(".registration.regiListAll");
		return mv;
	}
	//----------| 회원별 수강목록 보기(selectAll)(테이블명: registration,prosign,ptsign) |----------//
	//--단과과목
	@RequestMapping("/regiSimpleListOne")
	public ModelAndView regiSimpleListOne(HttpServletRequest req){
		int mem_num=Integer.parseInt(req.getParameter("mem_num"));
		int rg_num=Integer.parseInt(req.getParameter("rg_num"));
		System.out.println("mem_num"+mem_num);
		System.out.println("rg_num"+rg_num);
		
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("mem_num", mem_num);
		map.put("rg_num", rg_num);
		System.out.println("map: "+map.get("mem_num"));
		System.out.println("map: "+map.get("rg_num"));
		ProsignDto dto1=service.prosignListone(map);
		
		ModelAndView mv=new ModelAndView();
		mv.addObject("dto1",dto1);
		mv.setViewName(".registration.regiSimpleListOne");
		return mv;
	}
	//--PT과목
	@RequestMapping("/regiPTListOne")
	public ModelAndView regiPTListOne(HttpServletRequest req){
		int mem_num=Integer.parseInt(req.getParameter("mem_num"));
		int rg_num=Integer.parseInt(req.getParameter("rg_num"));
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("mem_num", mem_num);
		map.put("rg_num", rg_num);
		PtsignDto dto1=service.ptsignListone(map);
		System.out.println("map: "+map.get("mem_num"));
		System.out.println("map: "+map.get("rg_num"));
		ModelAndView mv=new ModelAndView();
		mv.addObject("dto1",dto1);
		mv.setViewName(".registration.regiPTListOne");
		return mv;
	}
	//--여러과목
	@RequestMapping("/regiMultiListOne")
	public ModelAndView regiMultiListOne(HttpServletRequest req){
		int mem_num=Integer.parseInt(req.getParameter("mem_num"));
		int rg_num=Integer.parseInt(req.getParameter("rg_num"));
		HashMap<String, Integer> map1=new HashMap<String, Integer>();
		HashMap<String, Integer> map2=new HashMap<String, Integer>();
		map1.put("mem_num", mem_num);
		map1.put("rg_num", rg_num);
		map2.put("mem_num", mem_num);
		map2.put("rg_num", rg_num);
		ProsignDto dto1=service.prosignListone(map1);
		PtsignDto dto2=service.ptsignListone(map2);
		System.out.println("map: "+map1.get("mem_num"));
		System.out.println("map: "+map1.get("rg_num"));
		System.out.println("map: "+map2.get("mem_num"));
		System.out.println("map: "+map2.get("rg_num"));
		ModelAndView mv=new ModelAndView();
		mv.addObject("dto1",dto1);
		mv.addObject("dto2",dto2);
		mv.setViewName(".registration.regiMultiListOne");
		return mv;
	}
	//프로그램상세보기
	/*
	--properiod--
	String pro_code=req.getParameter("pro_code");
	System.out.println("code: "+pro_code);
	ProsignDto dto2=service.prosignListoneName(pro_code);
	System.out.println("dto2: "+dto2.getPro_code());
	ModelAndView mv=new ModelAndView();
	mv.addObject("dto2",dto2);
	
	--ptperiod-- 
	String pt_code=req.getParameter("pt_code");
	PtsignDto dto2=service.ptsignListoneName(pt_code);
	ModelAndView mv=new ModelAndView();
	mv.addObject("dto2",dto2);
	
	*/
	 
}
