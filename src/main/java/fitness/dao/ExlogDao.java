package fitness.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.ExerciseLogDto;



@Repository
public class ExlogDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="orm.mybatis.FinalMapper";
	
	public int exloginsert(ExerciseLogDto dto){
		return sqlSession.insert(NAMESPACE+".exloginsert",dto);
	}
	public List<ExerciseLogDto> exloglist(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".exloglist",map);
	}
	public int exloggetCount(){
		return sqlSession.selectOne(NAMESPACE+".exloggetCount");
	}
	
	
	
	
}

















