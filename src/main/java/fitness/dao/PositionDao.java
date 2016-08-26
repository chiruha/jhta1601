package fitness.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.PositionDto;

@Repository
public class PositionDao {
	@Autowired private SqlSession sqlSession;
	private String NAMESPACE="orm.mybatis.FinalMapper";
	public List<PositionDto> listDao(){
		return sqlSession.selectList(NAMESPACE+".poslist");
	}
	public int insertDao(PositionDto dto){
		return sqlSession.insert(NAMESPACE+".posinsert",dto);
	}
	
}
