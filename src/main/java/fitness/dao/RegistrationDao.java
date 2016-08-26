package fitness.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.MemberDto;

@Repository
public class RegistrationDao {
	@Autowired private SqlSession sqlSession;
	
	private String NAMESPACE="orm.mybatis.FinalMapper";
	
	//----------| ȸ����ȣ�˻��ϱ� |----------//
	public List<MemberDto> searchMemNum(HashMap<String, String> map){
		return sqlSession.selectList(NAMESPACE+".searchMemNum",map);
	}
	
	
	
	//----------| ȸ��������� |----------//
		
	
	
	
}
