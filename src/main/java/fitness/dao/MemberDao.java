package fitness.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.MemberDto;

@Repository
public class MemberDao {
	@Autowired private SqlSession sqlSession;
	
	private String NAMESPACE="orm.mybatis.FinalMapper";
	//----------| 회원등록1 |----------//
	public int insert(MemberDto dto){
		return sqlSession.insert(NAMESPACE+".meminsert", dto);
	}
	//----------| 회원전체목록보기 |----------//
	public int getMemCount(){//페이징처리(count구하기)
		return sqlSession.selectOne(NAMESPACE+".getMemCount");
	}
	public List<MemberDto> listAll(HashMap<String, Integer> map){
		return sqlSession.selectList(NAMESPACE+".memSelectAll",map);
	}
	//----------| 회원상세보기(한명) |----------//	
	public MemberDto listOne(int mem_num){
		return sqlSession.selectOne(NAMESPACE+".memListOne",mem_num);
	}
	//----------| 회원삭제보기 |----------//	
	public int memDelete(int mem_num){
		return sqlSession.delete(NAMESPACE+".memDelete",mem_num);
	}
	
	//----------| 회원수정하기 |----------//	
	public int memUpdate(MemberDto dto){
		return sqlSession.update(NAMESPACE+".memUpdate",dto);
	}
	//----------| 회원검색하기 |----------//	
	public List<MemberDto> memSearchList(HashMap<String, String> map){
		return sqlSession.selectList(NAMESPACE+".memSearchList",map);
	}
}
