package fitness.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.GxregisterDto;

import fitness.dto.GxsubjectDto;

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
	public List<GxregisterDto> gxlist(){
		return sqlSession.selectList(NAMESPACE+".gxlist");
	}
	public List<GxsubjectDto> gxsubject(){
		return sqlSession.selectList(NAMESPACE+".gxsubject");
		
	}
	
}



















