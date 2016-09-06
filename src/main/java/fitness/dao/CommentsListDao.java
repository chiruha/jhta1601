package fitness.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.CommentsListDto;

@Repository
public class CommentsListDao {
	@Autowired private SqlSession sqlSession;
	
	private String NAMESPACE="orm.mybatis.FinalMapper";
	
	public List<CommentsListDto> commlist(){
		return sqlSession.selectList(NAMESPACE+".commList");
	}
	
}
