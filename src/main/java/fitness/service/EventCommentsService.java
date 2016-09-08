package fitness.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.EventCommentsDao;
import fitness.dto.EventCommentsDto;

@Service
public class EventCommentsService {
	@Autowired EventCommentsDao dao;
	
	//----------------------------| insert |----------------------------//	
	public int eventCommentsInsert(EventCommentsDto dto){
		return dao.eventCommentsInsert(dto);
	}
	public int commMaxNum(){
		return dao.commMaxNum();
	}
	public int commRe(EventCommentsDto dto){//답글인 경우 step+1
		return dao.commRe(dto);
	}
	//----------------------------| select |----------------------------//
	//댓글 전체목록
	public List<EventCommentsDto> commList(HashMap<String, Integer> map){
		return dao.commList(map);
	}
	//댓글 갯수 구하기
	public int commCnt(int ev_num){
		return dao.commCnt(ev_num);
	}
	//----------------------------| selectOne |----------------------------//
	//댓글 전체목록
	public List<EventCommentsDto> commListOne(HashMap<String, Integer> map){
		return dao.commListOne(map);
	}
	//댓글 갯수 구하기
	public int commCntOne(int ev_num){
		return dao.commCntOne(ev_num);
	}
	
	//----------------------------| delete |----------------------------//
	//commDelete
	public int commDelete(int comm_num){
		return dao.commDelete(comm_num);
	}
	//----------------------------| update |----------------------------//
	//commUpdate
	public int commUpdate(EventCommentsDto dto){
		return dao.commUpdate(dto);
	}
}
