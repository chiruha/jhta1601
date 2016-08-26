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
	//----------| ȸ�����1 |----------//
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
	//----------| ȸ���󼼺���(�Ѹ�) |----------//	
	public MemberDto listOne(int mem_num){
		return sqlSession.selectOne(NAMESPACE+".memListOne",mem_num);
	}
	//----------| ȸ���������� |----------//	
	public int memDelete(int mem_num){
		return sqlSession.delete(NAMESPACE+".memDelete",mem_num);
	}
	
	//----------| ȸ�������ϱ� |----------//	
	public int memUpdate(MemberDto dto){
		return sqlSession.update(NAMESPACE+".memUpdate",dto);
	}
	//----------| ȸ���˻��ϱ� |----------//	
	public List<MemberDto> memSearchList(HashMap<String, String> map){
		return sqlSession.selectList(NAMESPACE+".memSearchList",map);
	}
}
