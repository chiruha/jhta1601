package fitness.dao;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.PtregisterDto;

@Repository
public class PtregisterDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="orm.mybatis.FinalMapper";
	
	public int insert(PtregisterDto dto){
		return sqlSession.insert(NAMESPACE+".ptrinsert",dto);
	}
	
	public PtregisterDto detailDao(int num){
		return sqlSession.selectOne(NAMESPACE+".ptrinfo",num);
	}
	
	public List<PtregisterDto> list(int num){
		return sqlSession.selectList(NAMESPACE+".ptrlistAll",num);
	}
	
}



















