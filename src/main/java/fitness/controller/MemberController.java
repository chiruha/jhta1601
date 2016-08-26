package fitness.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.omg.CORBA.INTERNAL;
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
	//--------------------| ȸ����� |--------------------//
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
		System.out.println("meminsert ��Ʈ�ѷ� ����");
		//���Ͽ� ���� ������ MultipartFile�� ������ ����
		//upload��δ� webabb -> resources -> img -> member : ���⿡ ȸ�������� �����ϰ���
		//upload������ ������ ������
		String path=session.getServletContext().getRealPath("/resources/img/Member");
		
		//������ ���ϸ� ������
		String orgfilename=mem_picture.getOriginalFilename();
		//������ ���ϸ� �����(���۵� �����̸��� ������ �Ͱ� ������ ���, �ߺ����� �ʰ� �ϱ� ����)
		String savefilename=UUID.randomUUID()+"_"+orgfilename;
		//UUID.randomUUID(): Ŭ������ �޼ҵ��ε�, �ߺ����� �ʴ� ������ ���� �� ���
		try{
			//���۵� ������ �о���� ���� ��Ʈ����ü
			InputStream is=mem_picture.getInputStream();
			//���۵� ������ ������ �����ϱ� ���� ��½�Ʈ����ü
			FileOutputStream fos=new FileOutputStream(path+"/"+savefilename);
			//���� �����ϱ� : FileCopyUtils(spring�� ���� �޼ҵ�)
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			System.out.println(path+"/"+savefilename+"[ȸ���������ε强��]");
			int age=Integer.parseInt(mem_age);
			int code=Integer.parseInt(ct_code);
			MemberDto dto=new MemberDto(0, mem_name, mem_phone, mem_addr, mem_email, age, mem_gen, mem_birth, null, savefilename, code);
			System.out.println(dto.toString());
				System.out.println("name"+mem_name);
			int n=service.insert(dto);
			System.out.println("success�� �Ȱ���??"+n);
			return ".member.memSuccess";
		}catch(IOException ie){
			System.out.println(ie.getMessage());
			return ".member.memError";
		}
	}
	//--------------------| ȸ����ü��Ϻ���1 |--------------------//
	@RequestMapping("/memselectAll")
	public ModelAndView selectAll(@RequestParam(value="pageNum",defaultValue="1") int pageNum){
		int totalRowCount=service.getMemCount();
		PageUtil pu=new PageUtil(pageNum, 15, 10, totalRowCount);
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<MemberDto> list=service.list(map);
		System.out.println("��ü����"+list);
		ModelAndView mv=new ModelAndView();
		mv.addObject("list",list);
		mv.addObject("pu",pu);
		mv.setViewName(".member.memListAll");
		return mv;
	}
	//--------------------| ȸ���󼼺���(�Ѹ�) |--------------------//
	@RequestMapping("/listOne")
	public ModelAndView listOne(int mem_num){
		MemberDto dto=service.listOne(mem_num);
		ModelAndView mv=new ModelAndView();
		mv.addObject("dto",dto);
		mv.setViewName(".member.memListOne");
		return mv;
	}
	//--------------------| ȸ�������ϱ� |--------------------//	
	@RequestMapping("/memDelete")
	public String memDelete(int mem_num){
		try{
			service.memDelete(mem_num);
			return ".member.memSuccess";
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".member.memError";
		}
	}
	//--------------------| ȸ�������ϱ� |--------------------//
	@RequestMapping("/memUpdateList")
	public ModelAndView memUpdateList(int mem_num){
		MemberDto dto=service.listOne(mem_num);
		ModelAndView mv=new ModelAndView();
		mv.addObject("dto",dto);
		mv.setViewName(".member.memUpdateList");
		return mv;
	}
	
	@RequestMapping("/memUpdate")
	public String memUpdate(int mem_num,String mem_name,
			 String mem_phone,
			String mem_addr,
			String mem_email,
			String mem_age,
			String mem_gen,
			String mem_birth,
			Date regdate,
			MultipartFile mem_picture,
			String ct_code, HttpSession session){
		System.out.println("���: "+mem_num);
		//int num=Integer.parseInt(mem_num);
		int age=Integer.parseInt(mem_age);
		int code=Integer.parseInt(ct_code);
		//upload������ ��� ������
		String path=session.getServletContext().getRealPath("resources/img/Member");
		
		MemberDto dto=service.listOne(mem_num);
		File orgfile=new File(path+"\\"+dto.getMem_picture());
		orgfile.delete();
		//������ ���ϸ� ������
		String orgfilename=mem_picture.getOriginalFilename();
		//������ ���ϸ� �����(���۵� �����̸��� ������ �Ͱ� ������ ���, �ߺ����� �ʰ� �ϱ� ����)
		String savefilename=UUID.randomUUID()+"_"+orgfilename;
		//UUID.randomUUID(): Ŭ������ �޼ҵ��ε�, �ߺ����� �ʴ� ������ ���� �� ���
		try{
			//���۵� ������ �о���� ���� ��Ʈ����ü
			InputStream is=mem_picture.getInputStream();
			//���۵� ������ ������ �����ϱ� ���� ��½�Ʈ����ü
			FileOutputStream fos=new FileOutputStream(path+"\\"+savefilename);
			//���� �����ϱ� : FileCopyUtils(spring�� ���� �޼ҵ�)
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			System.out.println(path+"/"+savefilename+"[ȸ������ update����]");
			
			MemberDto dto1=new MemberDto(mem_num, mem_name, mem_phone, mem_addr, mem_email, age, mem_gen, mem_birth, null, savefilename, code);
			System.out.println("��Ƽ�������� : "+dto1);
			int n=service.memUpdate(dto1);
			System.out.println("��������!!"+n);
			return ".member.memSuccess";
		}catch(IOException ie){
			System.out.println(ie.getMessage());
			return ".member.memError";
		}
	}
}
