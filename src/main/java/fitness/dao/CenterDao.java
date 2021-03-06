package fitness.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.CenterDto;

@Repository
public class CenterDao {
	@Autowired private SqlSession sqlsession;
	private String NAMESPACE="orm.mybatis.FinalMapper";
	public int insertDao(CenterDto dto){
		return sqlsession.insert(NAMESPACE+".ctinsert",dto);
	}
	public List<CenterDto> listDao(){
		return sqlsession.selectList(NAMESPACE+".ctlist");
	}
	public CenterDto detailDao(int num){
		return sqlsession.selectOne(NAMESPACE+".ctdetail",num);
	}
	public int updateDao(CenterDto dto){
		return sqlsession.update(NAMESPACE+".ctupdate",dto);
	}
	public int deleteDao(int num){
		return sqlsession.delete(NAMESPACE+".ctdelete",num);
	}
}
