package fitness.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import fitness.dto.EventCommentsDto;
import fitness.service.EventCommentsService;
import page.util.PageUtil;

@Controller
public class EventCommentsController {
	@Autowired EventCommentsService service;
	
	@RequestMapping("/EventCommentsInsert")
	public String eventCommentsInsert(HttpServletRequest req,@RequestParam(value="mem_num",defaultValue="0")int mem_num,@RequestParam(value="stf_num",defaultValue="0")int stf_num){
		System.out.println("eventCommentsInsert 컨트롤러 왔나??");
		int commMax=service.commMaxNum();//큰 글번호 얻어오기
		System.out.println("댓글 큰 글번호 : "+commMax);
		int cnum=0;
		int cref=0;
		int clev=0;
		int cstep=0;
		String comm_num=req.getParameter("comm_num");
		String comm_ref=req.getParameter("comm_ref");
		String comm_lev=req.getParameter("comm_lev");
		String comm_step=req.getParameter("comm_step");
		System.out.println("comm_num : "+comm_num);
		System.out.println("comm_ref : "+comm_ref);
		System.out.println("comm_lev : "+comm_lev);
		System.out.println("comm_step : "+comm_step);
		
		int snum=commMax+1;
		System.out.println("snum: "+snum);
		try{
			if(comm_num.equals("")){//새글인 경우
				System.out.println("새글인가??");
				cref=snum;
				System.out.println("새글인경우,, cref:"+cref);
			}else{//답글인경우
				System.out.println("답글인가??");
				cnum=Integer.parseInt(comm_num);
				cref=Integer.parseInt(comm_ref);
				clev=clev+1;
				cstep=cstep+1;
				System.out.println("답글인경우,,cnum:"+cnum+", cref:"+cref+", clev:"+clev+"cstep:"+cstep);
			}
			int ev_num=Integer.parseInt(req.getParameter("ev_num"));
			//int mem_num=Integer.parseInt(req.getParameter("mem_num"));
			String comments=req.getParameter("comments");
			EventCommentsDto dto1=new EventCommentsDto(snum, ev_num, mem_num, stf_num, comments, null, cref, clev, cstep);
			System.out.println("insert시 dto에 뭐가 담겼나?"+dto1.toString());
			service.eventCommentsInsert(dto1);
			return ".member.memSuccess";
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".member.memError";
		}	
	}
	
	//----------------------------| selectNew |----------------------------//
	@RequestMapping(value="/commList/xml",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String commList(@RequestParam(value="pageNum",defaultValue="1")int pageNum,int ev_num){
		System.out.println("pageNum: "+pageNum);
		int totalRowCount=service.commCnt(ev_num);
		PageUtil puList=new PageUtil(pageNum, totalRowCount, 5, 5);
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("startRow", puList.getStartRow());
		map.put("endRow", puList.getEndRow());
		map.put("ev_num", ev_num);
		List<EventCommentsDto> list=service.commList(map);
		
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<comm>");
		sb.append("<paging>");
		sb.append("<getPageNum>"+puList.getPageNum()+"</getPageNum>");
		sb.append("<getTotalRowCount>"+puList.getTotalRowCount()+"</getTotalRowCount>");
		sb.append("<getRowBlockCount>"+puList.getRowBlockCount()+"</getRowBlockCount>");
		sb.append("<getPageBlockCount>"+puList.getPageBlockCount()+"</getPageBlockCount>");
		sb.append("<getStartPageNum>"+puList.getStartPageNum()+"</getStartPageNum>");
		sb.append("<getEndPageNum>"+puList.getEndPageNum()+"</getEndPageNum>");
		sb.append("<getTotalPageCount>"+puList.getTotalPageCount()+"</getTotalPageCount>");
		sb.append("</paging>");
		for(EventCommentsDto dto1:list){
			sb.append("<commListAll>");
			sb.append("<comm_num>"+dto1.getComm_num()+"</comm_num>");
			sb.append("<ev_num>"+dto1.getEv_num()+"</ev_num>");
			sb.append("<mem_num>"+dto1.getMem_num()+"</mem_num>");
			sb.append("<stf_num>"+dto1.getStf_num()+"</stf_num>");
			sb.append("<comments>"+dto1.getComments()+"</comments>");
			sb.append("<comm_date>"+dto1.getComm_date()+"</comm_date>");
			sb.append("<comm_ref>"+dto1.getComm_ref()+"</comm_ref>");
			sb.append("<comm_lev>"+dto1.getComm_lev()+"</comm_lev>");
			sb.append("<comm_step>"+dto1.getComm_step()+"</comm_step>");
			sb.append("</commListAll>");
		}
		sb.append("</comm>");
		System.out.println("commListAll toString() : "+sb.toString());
		return sb.toString();
	}
	//----------------------------| selectOne |----------------------------//
	//댓글 전체목록
	@RequestMapping(value="/commListOne/xml",produces="application/xml;charset=utf-8")
	@ResponseBody
	public String commListOne(@RequestParam(value="pageNum",defaultValue="1")int pageNum,int ev_num){
		System.out.println("pageNum: "+pageNum);
		int totalRowCount=service.commCntOne(ev_num);
		PageUtil puList=new PageUtil(pageNum, totalRowCount, 5, 5);
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("startRow", puList.getStartRow());
		map.put("endRow", puList.getEndRow());
		map.put("ev_num", ev_num);
		List<EventCommentsDto> list=service.commListOne(map);
		
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<comm>");
		//페이징처리
		sb.append("<paging>");
		sb.append("<getPageNum>"+puList.getPageNum()+"</getPageNum>");
		sb.append("<getTotalRowCount>"+puList.getTotalRowCount()+"</getTotalRowCount>");
		sb.append("<getRowBlockCount>"+puList.getRowBlockCount()+"</getRowBlockCount>");
		sb.append("<getPageBlockCount>"+puList.getPageBlockCount()+"</getPageBlockCount>");
		sb.append("<getStartPageNum>"+puList.getStartPageNum()+"</getStartPageNum>");
		sb.append("<getEndPageNum>"+puList.getEndPageNum()+"</getEndPageNum>");
		sb.append("<getTotalPageCount>"+puList.getTotalPageCount()+"</getTotalPageCount>");
		sb.append("</paging>");
		//댓글전체목록 받아오기
		for(EventCommentsDto dto1:list){
			sb.append("<commListAll>");
			sb.append("<comm_num>"+dto1.getComm_num()+"</comm_num>");
			sb.append("<ev_num>"+dto1.getEv_num()+"</ev_num>");
			sb.append("<mem_num>"+dto1.getMem_num()+"</mem_num>");
			sb.append("<stf_num>"+dto1.getStf_num()+"</stf_num>");
			sb.append("<comments>"+dto1.getComments()+"</comments>");
			sb.append("<comm_date>"+dto1.getComm_date()+"</comm_date>");
			sb.append("<comm_ref>"+dto1.getComm_ref()+"</comm_ref>");
			sb.append("<comm_lev>"+dto1.getComm_lev()+"</comm_lev>");
			sb.append("<comm_step>"+dto1.getComm_step()+"</comm_step>");
			sb.append("</commListAll>");
		}
		sb.append("</comm>");
		System.out.println("commListAll toString() : "+sb.toString());
		return sb.toString();
	}
	
	
	//----------------------------| delete |----------------------------//
	@RequestMapping("/EventCommentsDelete")
	public String commDelete(int comm_num){
		System.out.println("삭제번호 : "+comm_num);
		try{
			service.commDelete(comm_num);
			return ".member.memSuccess";
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".member.memError";
		}
	}
	//----------------------------| update |----------------------------//
	//EventCommentsUpdate
	@RequestMapping("/EventCommentsUpdate")
	public String EventCommentsUpdate(EventCommentsDto dto){
		try{
			service.commUpdate(dto);
			return ".member.memSuccess";
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ".member.memError";
		}
	}
}
