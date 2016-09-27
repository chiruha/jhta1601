package fitness.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.CenterTotalSalesDto;

@Repository
public class CompanyTotalSalesDao {
	@Autowired private SqlSession sqlSession;
	private String NAMESPACE="orm.mybatis.FinalMapper";
	
	//----------| ������ �� ���� ��Ȳ ��ü��Ϻ���(selectList)(���̺��: centertotalsales) |----------//
	public List<CenterTotalSalesDto> ctsSelect(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".ctsSelect", map);
	}
}
