package fitness.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.Mem_attDto;

@Repository
public class Mem_attDao {
	@Autowired private SqlSession sqlsession;
	private final String NameSpace="orm.mybatis.FinalMapper";
	public int insertDao(){
		return sqlsession.insert(NameSpace+".mattinsert");
	}
	public List<Mem_attDto> listDao(){
		return sqlsession.selectList(NameSpace+".mattList");
	}
}
