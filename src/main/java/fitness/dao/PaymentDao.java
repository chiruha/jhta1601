package fitness.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.PaymentDto;

@Repository
public class PaymentDao {
	@Autowired private SqlSession sqlSession;
	private final String NameSpace="orm.mybatis.FinalMapper";
	
	public int sattCnt(HashMap<String, Object> map){
		return   sqlSession.selectOne(NameSpace+".spayCnt", map);
	}
	public int insertDao(PaymentDto dto){
		return sqlSession.insert(NameSpace+".payinsert", dto);
	}
}
