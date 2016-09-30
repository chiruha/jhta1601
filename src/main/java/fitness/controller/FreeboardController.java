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

import fitness.dto.FreeboardDto;
import fitness.service.FreeboardService;
import page.util.PageUtil;

@Controller
public class FreeboardController {
	@Autowired private FreeboardService service;
	
	
	@RequestMapping(value="/fbinsert",method=RequestMethod.GET)
	public String insert(){
		return ".freeboard.FreeInsertView";
	}
	@RequestMapping(value="/fbinsert",method= RequestMethod.POST)
	public String insert(HttpSession session,FreeboardDto dto,
			HttpServletRequest req){  // DB�� insert
			
	//	System.out.println("����Ʈ�� �����߿��� �μ�Ʈ"+dto.toString());
		int fnum=service.fbmaxnum();
	//	System.out.println("ū �۹�ȣ �߿��� �ȿ���" + fnum);
		int fbnum=0;
		int fbref=0;
		int fblev=0;
		int fbstep=0;
		/*String fb_num=req.getParameter("fb_num");
		String fb_lev=req.getParameter("fb_ref");
		String fb_step=req.getParameter("fb_lev");
		String fb_ref=req.getParameter("fb_step");
		System.out.println("fb_num"+fb_num+"fb_ref"+fb_ref+"fb_lev"+fb_lev+"fb_step"+fb_step);
		*/
		int snum=fnum+1;
		//sSystem.out.println("snum:"+snum);
		try{
			if(dto.getFb_num()==0){//�����ϰ�� ,�Ǵ��ұ������� 
		//		System.out.println("����������");
				fbref=fnum;
		//		System.out.println("�����ΰ��fbref:"+fbref);
			}else{//����ΰ��
				service.fbrep(dto);	//step+1
		//		System.out.println("��ۿ����ȿ���");
				fbref=dto.getFb_ref();
				fblev=dto.getFb_lev()+1;
				fbstep=dto.getFb_step()+1;
		//		System.out.println("����ΰ�� fb_lev:"+fblev+",fb_step:"+fbstep);
			}
			int mem_num=Integer.parseInt(req.getParameter("mem_num"));
			String fb_title=req.getParameter("fb_title");
			String fb_content=req.getParameter("fb_content");
			
			FreeboardDto dto1=new FreeboardDto(snum, mem_num, fb_title, fb_content, null,
					0, fbref, fblev, fbstep, null);
		//	System.out.println("insert�����ȿ�����������ֳ�"+dto1);
			service.insertService(dto1);  
		//	System.out.println(dto1.toString());
			
			//	req.setAttribute("result", "�����Խ��� �۵�� ����!");
		//	req.setAttribute("listurl", "<a href='fblist'>�۸��</a>");
		}catch(Exception e){
		//	System.out.println(e.getMessage());
			req.setAttribute("result", "�����Խ��� �۵�� ����!");
			req.setAttribute("listurl", "<a href='fblist'>�۸��</a>");
		}
		return ".freeboard.FreeListView";
		//return ".freeboard.ResultView";
	}
/*	@RequestMapping("/fbrep")
	public ModelAndView fbrep(HttpServletRequest req,FreeboardDto dto){
		int fb_num=Integer.parseInt(req.getParameter("fb_num"));
		int fb_ref=Integer.parseInt(req.getParameter("fb_ref"));
		int fb_lev=Integer.parseInt(req.getParameter("fb_lev"));
		int fb_step=Integer.parseInt(req.getParameter("fb_step"));
		System.out.println("fb_num"+fb_num+"fb_ref"+fb_ref+"fb_lev"+fb_lev+"fb_step"+fb_step);
		System.out.println("�������� �������� ���");
		service.fbrep(dto);
		FreeboardDto dto1=new FreeboardDto(fb_num, fb_ref, fb_lev, fb_step);
		System.out.println("fbrep : dto1 : "+dto1);
		ModelAndView mv=new ModelAndView();
		mv.addObject("dto",dto1);
		mv.setViewName(".freeboard.FreeInsertView");
		return mv;
	}
*/
	@RequestMapping("/fblist") // �˻� ��� ������ ��Ϻ��� 
	public String list(@RequestParam(value="pageNum", defaultValue="1") int pageNum, HttpSession session,
			HttpServletRequest request){
		String mem_num=request.getParameter("mem_num");
		String title=request.getParameter("title");
		String writer=request.getParameter("writer");
		String keyword=request.getParameter("keyword");

		// �ƹ��͵� ���õ��� �ʾ��� ��
		System.out.println("�ۼ��ڰ˻� : "+mem_num+", ����: "+title+", ����: "+writer+",keyword:"+keyword);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("mem_num", mem_num);
		map.put("title", title);
		map.put("writer", writer);
		map.put("keyword", keyword);
		
		int totalRowCount=service.getfbCount(map);
		System.out.println("����������� �ȿ��� fb����Ʈ");
		PageUtil pu=new PageUtil(pageNum, totalRowCount,10,5);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<FreeboardDto> fblist=service.listService(map);
		System.out.println(fblist);
		// üũ�ڽ� ���� ������ ���� �� �����ֱ�
		session.setAttribute("fblist", fblist);
		System.out.println("fblist��Ʈ�� :"+fblist);
		session.setAttribute("pu", pu);
		return ".freeboard.FreeListView";
	}
	
	
	
	@RequestMapping("/fbdetail") //�󼼺���
	public ModelAndView listOne(int fb_num){  //�����Ҷ��� ������ ����ó������ �����ش� �ش� jsp�� �����ش� ${dto.}
		FreeboardDto dto=service.detailService(fb_num);
		service.fbaddHit(fb_num);
		ModelAndView mv=new ModelAndView();
		mv.addObject("dto",dto);
		mv.setViewName(".freeboard.FreeDetailView");
		//HashMap<String, Object> map=new HashMap<String, Object>();
		//System.out.println(dto);
		//System.out.println(mv);'
		//map.put("dto", dto);
	
		return mv;
	}
	@RequestMapping("/fbdelete") //�����ϱ�
	public String delete(FreeboardDto dto, HttpSession session,HttpServletRequest req){
		System.out.println("fbdelete : "+dto.toString());
		try{
			service.deleteService(dto.getFb_num());
			req.setAttribute("result", "���� ����!");
			req.setAttribute("listurl", "<a href='fblist'>�۸��</a>");
		}catch(Exception e){
			System.out.println(e.getMessage());
			req.setAttribute("result", "���� ����!");
			req.setAttribute("listurl", "<a href='fblist'>�۸��</a>");
		}
		return ".freeboard.ResultView";
	}//
	@RequestMapping(value="/fbupdate",method=RequestMethod.POST) //�����ϱ�
	public String update(FreeboardDto dto,HttpSession session){
	try{
		System.out.println(dto.toString());
		service.updateService(dto);
		session.setAttribute("dto", dto);
		session.setAttribute("result", "�� ���� ����!");
	}catch(Exception e){
		System.out.println(e.getMessage());
		session.setAttribute("result", "�� ���� ����!");
	}
		return ".freeboard.ResultView";
	}
}
