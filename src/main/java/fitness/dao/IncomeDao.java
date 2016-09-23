package fitness.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.IncomeDto;

@Repository
public class IncomeDao {
	@Autowired SqlSession sqlSession;
	private final String NAMESPACE="orm.mybatis.FinalMapper";
	//------------------|월 수입 insert(테이블명: income)|------------------//
	public int centerInsert(IncomeDto dto){
		return sqlSession.insert(NAMESPACE+".centerInsert",dto);
	}
}
