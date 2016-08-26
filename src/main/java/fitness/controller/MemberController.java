package fitness.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import fitness.dto.MemberDto;
import fitness.service.MemberService;
import page.util.PageUtil;


@Controller
public class MemberController {
	@Autowired private MemberService service;
	//--------------------| 회원등록 |--------------------//
	@RequestMapping(value="/meminsert",method= RequestMethod.GET)
	public String insert(){
		return ".member.memInsert";
	}
	@RequestMapping(value="/meminsert",method= RequestMethod.POST)
	public String insert( String mem_name,
			 String mem_phone,
			String mem_addr,
			String mem_email,
			String mem_age,
			String mem_gen,
			String mem_birth,
			Date regdate,
			MultipartFile mem_picture,
			String ct_code, HttpSession session){
		System.out.println("어디까지왔나");
		//파일에 대한 정보를 MultipartFile이 가지고 있음
		//upload경로는 webabb -> resources -> img -> member : 여기에 회원사진을 저장하겠음
		//upload폴더의 절대경로 얻어오기
		String path=session.getServletContext().getRealPath("/resources/img/Member");
		
		//전송한 파일명 얻어오기
		String orgfilename=mem_picture.getOriginalFilename();
		//저장할 파일명 만들기(전송된 파일이름이 기존의 것과 동일한 경우, 중복되지 않게 하기 위함)
		String savefilename=UUID.randomUUID()+"_"+orgfilename;
		//UUID.randomUUID(): 클래스의 메소드인데, 중복되지 않는 난수를 얻어올 때 사용
		try{
			//전송된 파일을 읽어오기 위한 스트림객체
			InputStream is=mem_picture.getInputStream();
			//전송된 파일을 서버에 복사하기 위한 출력스트림객체
			FileOutputStream fos=new FileOutputStream(path+"\\"+savefilename);
			//파일 복사하기 : FileCopyUtils(spring이 가진 메소드)
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			System.out.println(path+"/"+savefilename+"[회원사진업로드성공]");
			int age=Integer.parseInt(mem_age);
			int code=Integer.parseInt(ct_code);

			MemberDto dto=new MemberDto(0, mem_name, mem_phone, mem_addr, mem_email, age, mem_gen, mem_birth, null, savefilename, code);
				System.out.println("name"+mem_name);
			int n=service.insert(dto);
			System.out.println("success로 안가나??"+n);
			return ".member.memSuccess";
		}catch(IOException ie){
			System.out.println(ie.getMessage());
			return ".member.memError";
		}
	}
	//--------------------| 회원전체목록보기 |--------------------//
	@RequestMapping("/memselectAll")
	public ModelAndView selectAll(@RequestParam(value="pageNum",defaultValue="1") int pageNum){
		int totalRowCount=service.getMemCount();
		PageUtil pu=new PageUtil(pageNum, 15, 10, totalRowCount);
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<MemberDto> list=service.list(map);
		System.out.println("전체보기"+list);
		ModelAndView mv=new ModelAndView();
		mv.addObject("list",list);
		mv.addObject("pu",pu);
		mv.setViewName(".member.memListAll");
		return mv;
	}
}
