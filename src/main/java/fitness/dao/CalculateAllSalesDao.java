package fitness.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.CenterTotalSalesDto;
import fitness.dto.IncomeDto;
import fitness.dto.RefundSeongjinDto;

@Repository
public class CalculateAllSalesDao {
	@Autowired SqlSession sqlSession;
	private final String NAMESPACE="orm.mybatis.FinalMapper";
	//------------------|������ ������ �˻��ϱ�(���̺��: Income)|------------------//
	public List<IncomeDto> centerIncomeSelect(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".centerIncomeSelect", map);
	}
	//------------------|������ �� ȯ�� �˻��ϱ�(���̺��: refundseongjin)|------------------//
	public List<RefundSeongjinDto> centerrefundselect(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".centerrefundselect",map);
	}
	//------------------|������ �� �Ѹ��� insert�ϱ�(���̺��: centertotalsales)|------------------//
	public int ctsInsert(CenterTotalSalesDto dto){
		return sqlSession.insert(NAMESPACE+".ctsInsert",dto);
	}
}
