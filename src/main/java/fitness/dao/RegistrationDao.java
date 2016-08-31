package fitness.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.ProsignDto;
import fitness.dto.PtsignDto;
import fitness.dto.RegistrationDto;

@Repository
public class RegistrationDao {
	@Autowired private SqlSession sqlSession;
	
	private String NAMESPACE="orm.mybatis.FinalMapper";
	
	//----------| 회원수강등록(insert)(테이블명: registration) |----------//
	public int regiInsert(RegistrationDto dto1){
		return sqlSession.insert(NAMESPACE+".regiInsert",dto1);
	}
	
	//----------| 단과과목등록(insert)(테이블명: prosign) |----------//
	public int prosignInsert(ProsignDto dto2){
		return sqlSession.insert(NAMESPACE+".prosignInsert", dto2);
	}
	
	//----------| pt과목등록(insert)(테이블명: ptsign) |----------//
	public int ptsignInsert(PtsignDto dto3){
		return sqlSession.insert(NAMESPACE+".ptsignInsert", dto3);
	}
}
