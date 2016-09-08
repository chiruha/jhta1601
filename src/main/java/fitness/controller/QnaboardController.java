package fitness.controller;

import java.util.HashMap;
import java.util.List;
import java.util.concurrent.SynchronousQueue;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import fitness.dto.QnaboardDto;
import fitness.service.QnaboardService;
import page.util.PageUtil;

@Controller
public class QnaboardController {
	@Autowired QnaboardService service;
	//--------------------| QnA �۾���(insert) |--------------------//
	@RequestMapping(value="/qnainsert",method=RequestMethod.GET)
	public String insertForm(){
		System.out.println("insertForm GET���");
		return ".qnaboard.qnainsert";
	}
	
	@RequestMapping(value="/qnainsert",method=RequestMethod.POST)
	public String qnaInsert(HttpServletRequest req, @RequestParam(value="mem_num",defaultValue="0")int mem_num,@RequestParam(value="stf_num",defaultValue="0")int stf_num){
		System.out.println("insertForm POST���");
		//String mem_num="";
		int qnum=service.qnaMaxNum();//ū�۹�ȣ������
		System.out.println("ū �۹�ȣ: "+qnum);
		int qnanum=0;
		int qnaref=0;
		int qnalev=0;
		int qnastep=0;
		String qna_num=req.getParameter("qna_num");		
		String qna_ref=req.getParameter("qna_ref");
		String qna_lev=req.getParameter("qna_lev");
		String qna_step=req.getParameter("qna_step");
		System.out.println("qna_num : "+qna_num);
		System.out.println("qna_lev : "+qna_lev);
		System.out.println("qna_step : "+qna_step);
		System.out.println("qna_ref : "+qna_ref);
	
		//int qnanum=Integer.parseInt("qna_num");
		//int qnaref=Integer.parseInt("qna_ref");
		//int qnalev=Integer.parseInt("qna_lev");
		//int qnastep=Integer.parseInt("qna_step");
		
		
		int snum=qnum+1;
		System.out.println("snum: "+snum);
		try{
			if(qna_num.equals("")){//������ ���
				System.out.println("�����ΰ�??");
				qnaref=snum;
				System.out.println("������ ���,, qnaref:"+qnaref);
			}else{//����� ���
				System.out.println("����ΰ�??");
				qnanum=Integer.parseInt(qna_num);
				qnaref=Integer.parseInt(qna_ref);
				qnalev=qnalev+1;
				qnastep=qnastep+1;
				System.out.println("����� ���,, qna_lev: "+qnalev+", qna_step:"+qnastep);
			}
			
			//int mem_num=Integer.parseInt(req.getParameter("mem_num"));
			//int stf_num=Integer.parseInt(req.getParameter("stf_num"));
			String qna_title=req.getParameter("qna_title");
			String qna_content=req.getParameter("qna_content");
			
			QnaboardDto dto1=new QnaboardDto(snum, mem_num, stf_num, qna_title, qna_content, null, 0, qnaref, qnalev, qnastep);
			System.out.println("insert �� dto�� ���� ��峪?"+dto1);
			service.qnaInsert(dto1);
			return ".member.memSuccess";
		
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".member.memError";
		}
	}
	//--------------------| �� ��ü��� ���� |--------------------//
	@RequestMapping("/qnaselectAll")
	public ModelAndView qnaListAll(@RequestParam(value="pageNum",defaultValue="1")int pageNum){
		int totalRowCount=service.qnaCount();
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 5, 5);
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<QnaboardDto> qnalist=service.qnaListAll(map);
		ModelAndView mv=new ModelAndView();
		mv.addObject("qnalist",qnalist);
		mv.addObject("pu",pu);
		mv.setViewName(".qnaboard.qnaListAll");
		return mv;
	}
	//--------------------| �� �б�(�󼼺���) |--------------------//
	@RequestMapping("/qnaListOne")
	public ModelAndView qnaListOne(int qna_num){
		QnaboardDto dto=service.qnaListOne(qna_num);
		ModelAndView mv=new ModelAndView();
		service.qnaAddHit(qna_num);
		mv.addObject("dto",dto);
		mv.setViewName(".qnaboard.qnaListOne");
		return mv;
	}
	//--------------------| �� ����������(�󼼺���) |--------------------//
	@RequestMapping("/qnaUpdateList")
	public ModelAndView qnaUpdateList(int qna_num){
		QnaboardDto dto=service.qnaListOne(qna_num);
		ModelAndView mv=new ModelAndView();
		mv.addObject("dto",dto);
		mv.setViewName(".qnaboard.qnaUpdateList");
		return mv;
	}
	//--------------------| �� �����ϱ�(update) |--------------------//
	@RequestMapping("/qnaUpdate")
	public String qnaUpdate(QnaboardDto dto){
		try{
			int n=service.qnaUpdate(dto);
			System.out.println("������ �� �ǳ�??"+n);
			return ".member.memSuccess";
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".member.memError";
		}
	}
	//--------------------| �� �����ϱ�(�󼼺���) |--------------------//	
	@RequestMapping("/qnaDelete")
	public String qnaDelete(int qna_num){
		try{
			service.qnaDelete(qna_num);
			return ".member.memSuccess";
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".member.memError";
		}
	}
	//----------------------------| �۰˻��ϱ� |----------------------------//
	@RequestMapping("/qnaSearch")
	public ModelAndView qnaSearch(HttpServletRequest req, Model model){
		String field=req.getParameter("field");
		String keyword=req.getParameter("keyword");
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("field", field);
		map.put("keyword", keyword);
		List<QnaboardDto> qnalist=service.qnaSearch(map);
		System.out.println("�˻����Ǻ��� : "+qnalist);
		ModelAndView mv=new ModelAndView();
		mv.addObject("qnalist",qnalist);
		mv.setViewName(".qnaboard.qnaListAll");
		return mv;
	}
	@RequestMapping("/qnaAnswer")
	public ModelAndView qnaAnswer(HttpServletRequest req,QnaboardDto dto){
		int qna_num=Integer.parseInt(req.getParameter("qna_num"));
		int qna_ref=Integer.parseInt(req.getParameter("qna_ref"));
		int qna_lev=Integer.parseInt(req.getParameter("qna_lev"));
		int qna_step=Integer.parseInt(req.getParameter("qna_step"));
		System.out.println("qna_num"+qna_num);
		System.out.println("qna_ref"+qna_ref);
		System.out.println("qna_lev"+qna_lev);
		System.out.println("qna_step"+qna_step);
		System.out.println("qnaAnswer ������??");
		service.qnaAnswer(dto);
		QnaboardDto dto1=new QnaboardDto(qna_num, qna_ref, qna_lev, qna_step);
		System.out.println("qnaAnswer : dto1 : "+dto1);
		ModelAndView mv=new ModelAndView();
		mv.addObject("dto",dto1);
		mv.setViewName(".qnaboard.qnainsert");
		return mv;
	}
}
