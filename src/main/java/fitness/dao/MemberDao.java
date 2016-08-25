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
//----------| ȸ����� |----------//
	public int insert(MemberDto dto){
		return sqlSession.insert(NAMESPACE+".meminsert", dto);
	}
//----------| ȸ����ü��Ϻ��� |----------//
	public int getMemCount(){//����¡ó��(count���ϱ�)
		return sqlSession.selectOne(NAMESPACE+".getMemCount");
	}
	public List<MemberDto> listAll(HashMap<String, Integer> map){
		return sqlSession.selectList(NAMESPACE+".memSelectAll",map);
	}
}
