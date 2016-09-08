package fitness.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.metadata.SqlServerCallMetaDataProvider;
import org.springframework.stereotype.Repository;

import fitness.dto.EventCommentsDto;
@Repository
public class EventCommentsDao {
	@Autowired private SqlSession sqlSession;
	
	private String NAMESPACE="orm.mybatis.FinalMapper";
	
	//----------------------------| insert |----------------------------//	
	public int eventCommentsInsert(EventCommentsDto dto){
		return sqlSession.insert(NAMESPACE+".eventCommentsInsert",dto);
	}
	public int commMaxNum(){
		return sqlSession.selectOne(NAMESPACE+".commMaxNum");
	}
	public int commRe(EventCommentsDto dto){//답글인 경우 step+1
		return sqlSession.update(NAMESPACE+".commRe",dto);
	}
	
	//----------------------------| selectNew |----------------------------//
	public List<EventCommentsDto> commList(HashMap<String, Integer> map){
		return sqlSession.selectList(NAMESPACE+".commList",map);
	}
	public int commCnt(int ev_num){
		return sqlSession.selectOne(NAMESPACE+".commCnt",ev_num);
	}
	
	//----------------------------| selectOne |----------------------------//
	public List<EventCommentsDto> commListOne(HashMap<String, Integer> map){
		return sqlSession.selectList(NAMESPACE+".commListOne",map);
	}
	public int commCntOne(int ev_num){
		return sqlSession.selectOne(NAMESPACE+".commCntOne",ev_num);
	}
	
	//----------------------------| delete |----------------------------//
	public int commDelete(int comm_num){
		return sqlSession.delete(NAMESPACE+".commDelete",comm_num);
	}
	//----------------------------| update |----------------------------//
	public int commUpdate(EventCommentsDto dto){
		return sqlSession.update(NAMESPACE+".commUpdate",dto);
	}
}
