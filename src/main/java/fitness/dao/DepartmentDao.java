package fitness.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.DepartmentDto;

@Repository
public class DepartmentDao {
	@Autowired private SqlSession sqlsession;
	private String NAMESPACE="orm.mybatis.FinalMapper";
	public int insertDao(DepartmentDto dto){
		return sqlsession.insert(NAMESPACE+".deptinsert",dto);
	}
	public List<DepartmentDto> listDao(){
		return sqlsession.selectList(NAMESPACE+".deptlist");
	}
}
