package fitness.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fitness.dto.ProperiodDto;
import fitness.dto.ProsignDto;
import fitness.dto.PtperiodDto;
import fitness.dto.PtsignDto;
import fitness.dto.RegistrationDto;

import fitness.service.RegistrationService;

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
		
		RegistrationDto dto1=new RegistrationDto(0, mem_num, rg_type, rg_price, locker_price, wear_price);
		
		try{
			System.out.println("regi컨트롤러: "+dto1.toString());
			service.regiInsert(dto1);//registration테이블에 insert

			if(pro_code.equals("") && pro_signmonth==0){//pt과목만 신청한 경우
				PtsignDto dto3=new PtsignDto(0, mem_num, pt_code, ptr_count);
				PtperiodDto dto5=new PtperiodDto(0, mem_num, pt_signmonth, null, null);
				service.ptsignInsert(dto3);//ptsign테이블에 insert
				service.ptperiodInsert(dto5);//ptperiod테이블에 insert
			}else if(pt_code.equals("") && pt_signmonth==0){//단과과목만 신청한 경우
				ProsignDto dto2=new ProsignDto(0, mem_num, pro_code);
				ProperiodDto dto4=new ProperiodDto(0, mem_num, pro_signmonth, null, null);
				service.prosignInsert(dto2);//prosign테이블에 insert
				service.properiodInsert(dto4);//properiod테이블에 insert
			}else{//복합과목(단과과목+PT과목)신청한 경우
				ProsignDto dto2=new ProsignDto(0, mem_num, pro_code);
				PtsignDto dto3=new PtsignDto(0, mem_num, pt_code, ptr_count);
				ProperiodDto dto4=new ProperiodDto(0, mem_num, pro_signmonth, null, null);
				PtperiodDto dto5=new PtperiodDto(0, mem_num, pt_signmonth, null, null);
				service.prosignInsert(dto2);//prosign테이블에 insert
				service.ptsignInsert(dto3);//ptsign테이블에 insert
				service.properiodInsert(dto4);//properiod테이블에 insert
				service.ptperiodInsert(dto5);//ptperiod테이블에 insert
			}
			return ".member.memSuccess";
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".member.memError";
		}
	}
	
	
}
