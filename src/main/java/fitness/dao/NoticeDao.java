package fitness.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.MemberDto;
import fitness.dto.NoticeDto;

@Repository
public class NoticeDao {
	@Autowired private SqlSession sqlSession;
	private String NAMESPACE="orm.mybatis.FinalMapper";
	public int insert(NoticeDto dto){
		return sqlSession.insert(NAMESPACE+".Nocinsert", dto);
	}
	public int getNocCount(HashMap<String, Object> map){//페이징처리(count구하기)
		return sqlSession.selectOne(NAMESPACE+".getNocCount",map);
	}
	public List<NoticeDto> listAll(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".NocSelectAll",map);
	}
	public NoticeDto listOne(int nt_num){
		return sqlSession.selectOne(NAMESPACE+".NocListOne",nt_num);
	}
	public int NocDelete(int nt_num){
		return sqlSession.delete(NAMESPACE+".NocDelete",nt_num);
	}
	
	public int NocUpdate(NoticeDto dto){
		return sqlSession.insert(NAMESPACE+".NocUpdate",dto);
	}
	public List<NoticeDto> NocSearchList(HashMap<String, String> map){
		return sqlSession.selectList(NAMESPACE+".NocSearchList",map);
	}
	//조회수
		public int addHit(int nt_num){
			return sqlSession.update(NAMESPACE +".addHit",nt_num);
		}
}
