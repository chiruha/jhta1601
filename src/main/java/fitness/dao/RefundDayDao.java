package fitness.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.MemberDto;
import fitness.dto.PtperiodDto;
import fitness.dto.RefundDayImpleDto;
import fitness.dto.RegistrationDto;

@Repository
public class RefundDayDao {
	@Autowired private SqlSession sqlSession;
	private String NAMESPACE="orm.mybatis.FinalMapper";
	
	//----------| 총등록금액 (테이블명: RefundDay) |----------//
	public List<RegistrationDto> totregimoney(int mem_num){		
		return sqlSession.selectList(NAMESPACE+".totregimoney",mem_num);
	}
	public List<MemberDto> memNaSeList(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".memNaSeList",map);
	}
	
	public RefundDayImpleDto ptgxoneday(int mem_num){
		return sqlSession.selectOne(NAMESPACE+".ptgxoneday",mem_num);
	}
}














