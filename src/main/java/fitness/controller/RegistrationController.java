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
import org.springframework.web.servlet.ModelAndView;

import fitness.dto.ProperiodDto;
import fitness.dto.ProsignDto;
import fitness.dto.PtperiodDto;
import fitness.dto.PtsignDto;
import fitness.dto.RegistrationDto;
import fitness.service.MemberService;
import fitness.service.RegistrationService;
import page.util.PageUtil;

/*
 * 수강등록 컨트롤러입니다.
 * 테이블명 : registratioin
 * */
@Controller
public class RegistrationController {
	@Autowired private RegistrationService service;
	@Autowired private MemberService mems;
	
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
		
		RegistrationDto dto1=new RegistrationDto(0, mem_num, rg_type, rg_price, locker_price, wear_price,null);
	
		try{
			System.out.println("regi컨트롤러: "+dto1.toString());
			service.regiInsert(dto1);//registration테이블에 insert
			int rg_num=service.getRgnum();
			System.out.println("insert 큰 번호 얻어오기: "+rg_num);
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
			return ".member.registrationInsert";
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".member.memError";
		}
	}
	//----------| 수강등록회원 전체보기(selectList)(테이블명: registration,prosign,ptsign) |----------//
	@RequestMapping("/regiSelect")
	public ModelAndView regiSelect(@RequestParam(value="pageNum", defaultValue="1") int pageNum, HttpSession session){
		int totalRowCount=service.getCountRegi();
		PageUtil pu=new PageUtil(pageNum, totalRowCount,10,5);//한페이지10줄, 페이재갯수5개
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

	//----------| 회원 수강정보 수정하기(delete&insert)(테이블명: registration,prosign,ptsign,properiod,prosign) |----------//
	/*
	 * insert할 때 선택한 정보에 따라 5개의 테이블 중에서 3개의 테이블에만 입력이 됨. 
	 * 이로 인해 update를 하고자 할 때 다음과 같은 문제점이 발생함
	 * 1. 부모테이블인 registration에는 update문을 사용해야함
	 * 2. 자식테이블 4개중에서 무엇을 선택하느냐에 따라 insert/delete/update가 필요함
	 * 3. 이런 경우에 update문을 쓰고자 한다면 엄청나게 많은 조건문이 필요하게 됨(결국, 코드가 매우 길어짐)
	 * 따라서 위와 같은 문제로 인해 update문을 쓰지 않고 수정 시, 기존정보를 모두 delete하고 수정하고자 하는 값을 insert하기로 함
	 */
	@RequestMapping(value="/regiUpdate",method= RequestMethod.GET)
	public ModelAndView regiUpdateForm(HttpServletRequest req){
		int mem_num=Integer.parseInt(req.getParameter("mem_num"));
		int rg_num=Integer.parseInt(req.getParameter("rg_num"));
		System.out.println("regiUpdate.GET : mem_num"+mem_num);
		System.out.println("regiUpdate.GET : rg_num"+rg_num);
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("mem_num", mem_num);
		map.put("rg_num", rg_num);
		RegistrationDto list=service.regiGetInfo(map);
		ModelAndView mv=new ModelAndView();
		mv.addObject("dto",list);
		mv.setViewName(".registration.regiUpdate");
		return mv;
	}
	
	@RequestMapping(value="/regiUpdate", method=RequestMethod.POST)
	public String regiUpdate(HttpServletRequest req){
		//기존정보 삭제하기(delete)
		int rg_num=Integer.parseInt(req.getParameter("rg_num"));
		String rg_type=req.getParameter("rg_type");
		System.out.println("regiUpdate.POST : rg_num: "+rg_num);
		System.out.println("regiUpdate.POST : rg_type: "+rg_type);
		try{
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("rg_num", rg_num);
			map.put("rg_type", rg_type);
			System.out.println("regiUpdate.POST :map: "+map.get("rg_num"));
			System.out.println("regiUpdate.POST :map: "+map.get("rg_type"));
			System.out.println("regiUpdate.POST :regi Map: "+map);
			int n1=service.prosignDel(rg_num);
			int n2=service.properiodDel(rg_num);
			int n4=service.ptsignDel(rg_num);
			int n5=service.ptperiodDel(rg_num);
			int n3=service.regiDel(rg_num);
			System.out.println("prosign Del : "+n1);
			System.out.println("properiod Del : "+n2);
			System.out.println("regi Del : "+n3);
			System.out.println("ptsign Del : "+n4);
			System.out.println("ptperiod Del : "+n5);			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
		//새로운정보 입력하기(insert)
		int mem_num=Integer.parseInt(req.getParameter("mem_num"));
		//String rg_type=req.getParameter("rg_type");
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
		
		RegistrationDto dto1=new RegistrationDto(0, mem_num, rg_type, rg_price, locker_price, wear_price,null);
		try{
			System.out.println("수정하기regi컨트롤러: "+dto1.toString());
			int uu=service.regiInsert(dto1);//registration테이블에 insert
			System.out.println("uu: "+uu);
			int rg_num1=service.getRgnum();
			System.out.println("수정하기 큰번호 얻어오기 : "+rg_num1);
			if(pro_code.equals("") && pro_name.equals("") ){//pt과목만 신청한 경우&& pro_signmonth==0
				PtsignDto dto3=new PtsignDto(0,rg_num1, mem_num, pt_code, pt_name, ptr_count);
				PtperiodDto dto5=new PtperiodDto(0, rg_num1, mem_num, pt_signmonth, null, null);
				service.ptsignInsert(dto3);//ptsign테이블에 insert
				service.ptperiodInsert(dto5);//ptperiod테이블에 insert
				System.out.println("ptsign컨트롤러: "+dto3.toString());
				System.out.println("ptperiod컨트롤러: "+dto5.toString());
				
				
			}else if(pt_code.equals("") && pt_name.equals("")){//단과과목만 신청한 경우 && pt_signmonth==0
				ProsignDto dto2=new ProsignDto(0, rg_num1, mem_num, pro_name, pro_code);
				ProperiodDto dto4=new ProperiodDto(0, rg_num1, mem_num, pro_signmonth, null, null);
				service.prosignInsert(dto2);//prosign테이블에 insert
				service.properiodInsert(dto4);//properiod테이블에 insert
				System.out.println("prosign컨트롤러: "+dto2.toString());
				System.out.println("proprice컨트롤러: "+dto4.toString());
				
			}else{//복합과목(단과과목+PT과목)신청한 경우
				ProsignDto dto2=new ProsignDto(0, rg_num1, mem_num, pro_name, pro_code);
				PtsignDto dto3=new PtsignDto(0, rg_num1, mem_num, pt_code, pt_name, ptr_count);
				ProperiodDto dto4=new ProperiodDto(0, rg_num1, mem_num, pro_signmonth, null, null);
				PtperiodDto dto5=new PtperiodDto(0, rg_num1, mem_num, pt_signmonth, null, null);
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
	@RequestMapping("/regiDelete")
	public String regiDel(HttpServletRequest req){
		int rg_num=Integer.parseInt(req.getParameter("rg_num"));
		String rg_type=req.getParameter("rg_type");
		System.out.println("rg_num: "+rg_num);
		System.out.println("rg_type: "+rg_type);
		try{
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("rg_num", rg_num);
			map.put("rg_type", rg_type);
			System.out.println("map: "+map.get("rg_num"));
			System.out.println("map: "+map.get("rg_type"));
			System.out.println("regi Map: "+map);
			if(rg_type.equals("단과과목")){
				service.prosignDel(rg_num);
				service.properiodDel(rg_num);
				service.regiDel(rg_num);
			}else if(rg_type.equals("PT")){
				service.ptsignDel(rg_num);
				service.ptperiodDel(rg_num);
				service.regiDel(rg_num);
			}else{
				service.prosignDel(rg_num);
				service.ptsignDel(rg_num);
				service.properiodDel(rg_num);
				service.ptperiodDel(rg_num);
				service.regiDel(rg_num);
			}
			return ".member.memSuccess";
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".member.memError";
		}
		
	}

	
}
