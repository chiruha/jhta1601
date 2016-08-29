package fitness.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.ProgramPriceDto;

@Repository
public class ProgramPriceDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="orm.mybatis.FinalMapper";
	
	public List<ProgramPriceDto> list(HashMap<String, Integer>map){
		return sqlSession.selectList(NAMESPACE+".programName",map);
	}
}
