package fitness.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

import fitness.dto.EventDto;

@Repository
public class EventDao {
	@Autowired private SqlSession sqlSession;
	private String NAMESPACE="orm.mybatis.FinalMapper";
	
	//--------------------| 이벤트등록(insert) |--------------------//
	public int eventInsert(EventDto dto){
		return sqlSession.insert(NAMESPACE+".eventInsert",dto);
	}
	//--------------------| 이벤트 전체보기(selectAll) |--------------------//
	public List<EventDto> eventSelectAll(HashMap<String, Integer> map){
		return sqlSession.selectList(NAMESPACE+".eventSelectAll",map);
	}
	public int getEventCount(){	//페이징처리 getEventCount
		return sqlSession.selectOne(NAMESPACE+".getEventCount");
	}
	//--------------------| 이벤트 전체보기(선택한 글 : selectListOne 페이지) |--------------------//
	public List<EventDto> eventSelectAll2(HashMap<String, Integer> map){
		return sqlSession.selectList(NAMESPACE+".eventSelectAll2",map);
	}
	public int getEventCount2(){	//페이징처리(선택한 글 : selectListOne 페이지)
		return sqlSession.selectOne(NAMESPACE+".getEventCount2");
	}
	
	//--------------------| 이벤트 "최신글" 상세보기(selectNew) |--------------------//
	public EventDto eventSelectNew(){
		return sqlSession.selectOne(NAMESPACE+".eventSelectNew");
	}
	
	//--------------------| 이벤트 "선택한 글"상세보기(selectOne) |--------------------//
	public EventDto eventListOne(int ev_num){
		return sqlSession.selectOne(NAMESPACE+".eventListOne",ev_num);
	}
	//--------------------| 이벤트 삭제하기(delete) |--------------------//	
	public int eventDel(int ev_num){
		return sqlSession.delete(NAMESPACE+".eventDel",ev_num);
	}
	//--------------------| 이벤트 수정하기(update) |--------------------//
	public int eventUpdate(EventDto dto){
		return sqlSession.update(NAMESPACE+".eventUpdate",dto);
	}
}
