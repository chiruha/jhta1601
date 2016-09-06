package fitness.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.EventDao;
import fitness.dto.EventDto;

@Service
public class EventService {
	@Autowired EventDao dao;
	//--------------------| 이벤트등록(insert) |--------------------//
	public int eventInsert(EventDto dto){
		return dao.eventInsert(dto);
	}
	//--------------------| 이벤트 "최신글페이지" 전체보기(selectAll) |--------------------//
	public List<EventDto> eventSelectAll(HashMap<String, Integer> map){
		return dao.eventSelectAll(map);
	}
	public int getEventCount(){	//페이징처리 getEventCount
		return dao.getEventCount();
	}
	//--------------------| 이벤트 "선택한글페이지" 전체보기(selectAll) |--------------------//
	public List<EventDto> eventSelectAll2(HashMap<String, Integer> map){
		return dao.eventSelectAll2(map);
	}
	public int getEventCount2(){	//페이징처리 getEventCount
		return dao.getEventCount2();
	}
	//--------------------| 이벤트 "최신글" 상세보기(selectNew) |--------------------//
	public EventDto eventSelectNew(){
		return dao.eventSelectNew();
	}
	//--------------------| 이벤트 "선택한 글" 상세보기(selectOne) |--------------------//
	public EventDto eventListOne(int ev_num){
		return dao.eventListOne(ev_num);
	}
	//--------------------| 이벤트 삭제하기(delete) |--------------------//	
	public int eventDel(int ev_num){
		return dao.eventDel(ev_num);
	}
	//--------------------| 이벤트 수정하기(update) |--------------------//
	public int eventUpdate(EventDto dto){
		return dao.eventUpdate(dto);
	}
}
