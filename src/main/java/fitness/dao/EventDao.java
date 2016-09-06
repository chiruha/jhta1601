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
	
	//--------------------| �̺�Ʈ���(insert) |--------------------//
	public int eventInsert(EventDto dto){
		return sqlSession.insert(NAMESPACE+".eventInsert",dto);
	}
	//--------------------| �̺�Ʈ ��ü����(selectAll) |--------------------//
	public List<EventDto> eventSelectAll(HashMap<String, Integer> map){
		return sqlSession.selectList(NAMESPACE+".eventSelectAll",map);
	}
	public int getEventCount(){	//����¡ó�� getEventCount
		return sqlSession.selectOne(NAMESPACE+".getEventCount");
	}
	//--------------------| �̺�Ʈ ��ü����(������ �� : selectListOne ������) |--------------------//
	public List<EventDto> eventSelectAll2(HashMap<String, Integer> map){
		return sqlSession.selectList(NAMESPACE+".eventSelectAll2",map);
	}
	public int getEventCount2(){	//����¡ó��(������ �� : selectListOne ������)
		return sqlSession.selectOne(NAMESPACE+".getEventCount2");
	}
	
	//--------------------| �̺�Ʈ "�ֽű�" �󼼺���(selectNew) |--------------------//
	public EventDto eventSelectNew(){
		return sqlSession.selectOne(NAMESPACE+".eventSelectNew");
	}
	
	//--------------------| �̺�Ʈ "������ ��"�󼼺���(selectOne) |--------------------//
	public EventDto eventListOne(int ev_num){
		return sqlSession.selectOne(NAMESPACE+".eventListOne",ev_num);
	}
	//--------------------| �̺�Ʈ �����ϱ�(delete) |--------------------//	
	public int eventDel(int ev_num){
		return sqlSession.delete(NAMESPACE+".eventDel",ev_num);
	}
	//--------------------| �̺�Ʈ �����ϱ�(update) |--------------------//
	public int eventUpdate(EventDto dto){
		return sqlSession.update(NAMESPACE+".eventUpdate",dto);
	}
}
