package fitness.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.ProgramPriceDto;
import fitness.dto.PtPriceDto;

@Repository
public class ProgramPriceDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="orm.mybatis.FinalMapper";
	//------------------|단과과목 select(테이블명: programprice)|------------------//
	public List<ProgramPriceDto> list(HashMap<String, Integer>map){
		return sqlSession.selectList(NAMESPACE+".programName",map);
	}
	
	//------------------|pt과목 select(테이블명: ptprice)|------------------//
	public List<PtPriceDto> ptlist(HashMap<String, Integer>map){
		return sqlSession.selectList(NAMESPACE+".ptProgramName",map);
	}
}
