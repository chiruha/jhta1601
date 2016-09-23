package fitness.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.SalesSelectDto;

@Repository
public class centerSalesSelectDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="orm.mybatis.FinalMapper";
	//------------------|지점별 월매출 검색하기(테이블명: member&registration join해서)|------------------//
	public List<SalesSelectDto> monthSelectSales(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".centerSalesSelectAll", map);
	}
	
}
