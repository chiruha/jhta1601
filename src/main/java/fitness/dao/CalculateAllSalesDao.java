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
	//------------------|지점별 월수입 검색하기(테이블명: Income)|------------------//
	public List<IncomeDto> centerIncomeSelect(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".centerIncomeSelect", map);
	}
	//------------------|지점별 월 환불 검색하기(테이블명: refundseongjin)|------------------//
	public List<RefundSeongjinDto> centerrefundselect(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".centerrefundselect",map);
	}
	//------------------|지점별 월 총매출 insert하기(테이블명: centertotalsales)|------------------//
	public int ctsInsert(CenterTotalSalesDto dto){
		return sqlSession.insert(NAMESPACE+".ctsInsert",dto);
	}
}
