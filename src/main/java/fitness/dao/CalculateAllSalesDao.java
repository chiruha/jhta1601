package fitness.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.IncomeDto;

@Repository
public class CalculateAllSalesDao {
	@Autowired SqlSession sqlSession;
	private final String NAMESPACE="orm.mybatis.FinalMapper";
	//------------------|������ ������ �˻��ϱ�(���̺��: Income)|------------------//
	public List<IncomeDto> centerIncomeSelect(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".centerIncomeSelect", map);
	}
}
