package fitness.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.Stf_attDto;

@Repository
public class Stf_attDao {
	@Autowired private SqlSession sqlsession;
	private final String NameSpace="orm.mybatis.FinalMapper";
	public int insertDao(Stf_attDto dto){
		return sqlsession.insert(NameSpace+".sattinsert",dto);
	}
	public List<Stf_attDto> listDao(HashMap<String, Object> map){
		return sqlsession.selectList(NameSpace+".sattlist",map);
	}
}
