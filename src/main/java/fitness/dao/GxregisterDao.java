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
	public GxregisterDto gxlist(String ct_name){
		return sqlSession.selectOne(NAMESPACE+".gxlist",ct_name);
	}
	public List<GxsubjectDto> gxsubject(){
		return sqlSession.selectList(NAMESPACE+".gxsubject");		
	}
	public String searchGx(String ct_name){
		return sqlSession.selectOne(NAMESPACE+".searchGx",ct_name);
	}
	public int ct_nameupdate(GxregisterDto dto){
		return sqlSession.update(NAMESPACE+".ct_nameupdate",dto);
	}
	
}



















