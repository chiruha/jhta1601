package fitness.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.NoticeDto;

@Repository
public class NoticeDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="orm.mybatis.FinalMapper";
	
	public int insert(NoticeDto dto){
		return sqlSession.insert(NAMESPACE+".nocinsert",dto);
	}
	public int delete(int num){
		return sqlSession.delete(NAMESPACE+".nocdelete",num);
	}
	public NoticeDto detail(int num) {
		return sqlSession.selectOne(NAMESPACE+".nocdetail",num);
	}
	public int update(NoticeDto dto){
		return sqlSession.update(NAMESPACE+".nocupdate",dto);
	}
	public List<NoticeDto> list(HashMap<String, Integer> map) {
		return sqlSession.selectList(NAMESPACE+".noclist",map);
	}
	public int getCount(){
		return sqlSession.selectOne(NAMESPACE+".getCount");
	}
	public List<NoticeDto> list1(HashMap<String, String> map){
		return sqlSession.selectList(NAMESPACE+".noclist1",map);
	}
}
