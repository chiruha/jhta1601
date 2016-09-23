package fitness.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.IncomeDto;

@Repository
public class IncomeDao {
	@Autowired SqlSession sqlSession;
	private final String NAMESPACE="orm.mybatis.FinalMapper";
	//------------------|�� ���� insert(���̺��: income)|------------------//
	public int centerInsert(IncomeDto dto){
		return sqlSession.insert(NAMESPACE+".centerInsert",dto);
	}
}
