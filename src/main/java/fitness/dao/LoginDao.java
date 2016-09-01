package fitness.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDao {
	
	@Autowired SqlSession sqlSession;
	
	private String NAMESPACE="orm.mybatis.FinalMapper";
	
	public HashMap<String, Object> loginMem(HashMap<String, Object> map){
		return sqlSession.selectOne(NAMESPACE+".loginMem",map);
	}
	public HashMap<String, Object> loginAdmin(HashMap<String, Object> map){
		return sqlSession.selectOne(NAMESPACE+".loginAdmin",map);
	}
}
