package fitness.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.GxregisterDto;
import fitness.dto.PtregisterDto;

@Repository
public class GxregisterDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="orm.mybatis.FinalMapper";
	
	public int insert(GxregisterDto dto){
		return sqlSession.insert(NAMESPACE+".gxinsert",dto);
	}
	public GxregisterDto detail(int gx_num){
		return sqlSession.selectOne(NAMESPACE+".getInfo",gx_num);
	}
	
	
}



















