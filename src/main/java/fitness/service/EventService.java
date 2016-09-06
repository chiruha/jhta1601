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
	//--------------------| �̺�Ʈ���(insert) |--------------------//
	public int eventInsert(EventDto dto){
		return dao.eventInsert(dto);
	}
	//--------------------| �̺�Ʈ "�ֽű�������" ��ü����(selectAll) |--------------------//
	public List<EventDto> eventSelectAll(HashMap<String, Integer> map){
		return dao.eventSelectAll(map);
	}
	public int getEventCount(){	//����¡ó�� getEventCount
		return dao.getEventCount();
	}
	//--------------------| �̺�Ʈ "�����ѱ�������" ��ü����(selectAll) |--------------------//
	public List<EventDto> eventSelectAll2(HashMap<String, Integer> map){
		return dao.eventSelectAll2(map);
	}
	public int getEventCount2(){	//����¡ó�� getEventCount
		return dao.getEventCount2();
	}
	//--------------------| �̺�Ʈ "�ֽű�" �󼼺���(selectNew) |--------------------//
	public EventDto eventSelectNew(){
		return dao.eventSelectNew();
	}
	//--------------------| �̺�Ʈ "������ ��" �󼼺���(selectOne) |--------------------//
	public EventDto eventListOne(int ev_num){
		return dao.eventListOne(ev_num);
	}
	//--------------------| �̺�Ʈ �����ϱ�(delete) |--------------------//	
	public int eventDel(int ev_num){
		return dao.eventDel(ev_num);
	}
	//--------------------| �̺�Ʈ �����ϱ�(update) |--------------------//
	public int eventUpdate(EventDto dto){
		return dao.eventUpdate(dto);
	}
}
