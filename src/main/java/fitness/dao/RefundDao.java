package fitness.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.PtregisterDto;
import fitness.dto.RefundDto;
import fitness.dto.RegistrationDto;

@Repository
public class RefundDao {	
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="orm.mybatis.FinalMapper";
	
	public int insert(RefundDto refundDto){
		return sqlSession.insert(NAMESPACE+".refundInset",refundDto);
	}
	
	public List<RegistrationDto> refundrgnumlist(HashMap<String, Object>map){
		return sqlSession.selectList(NAMESPACE+".refundrgnum",map);
	}	
	public List<RefundDto> refundlist(){
		return sqlSession.selectList(NAMESPACE+".refundlist");
	}
	public int memNaCount(HashMap<String, Object>map){
		return sqlSession.selectOne(NAMESPACE+".memNaCount",map);
	}
}


















