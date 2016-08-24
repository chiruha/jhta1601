package fitness.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.StaffDto;

@Repository
public class StaffDao {
	@Autowired private SqlSession sqlSession;
	private final String NameSpace="orm.mybatis.FinalMapper";
	public int insertDao(StaffDto dto){
		return sqlSession.insert(NameSpace+".stfinsert",dto);
	}
	public int updateDao(StaffDto dto){
		return sqlSession.update(NameSpace+".stfupdate",dto);
	}
	public List<StaffDto> listDao(){
		return sqlSession.selectList(NameSpace+".stflist");
	}
	public StaffDto detailDao(int num){
		return sqlSession.selectOne(NameSpace+".stfdetail",num);
	}
	public int deleteDao(int num){
		return sqlSession.delete(NameSpace+".delete",num);
	}
}
