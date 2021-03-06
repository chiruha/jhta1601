package fitness.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.TrainerDto;

@Repository
public class TrainerDao {
	@Autowired private SqlSession sqlSession;
	private final String NameSpace="orm.mybatis.FinalMapper";
	public int insertDao(TrainerDto dto){
		return sqlSession.insert(NameSpace+".trinsert",dto);
	}
	public int updateDao(TrainerDto dto){
		return sqlSession.update(NameSpace+".trupdate",dto);
	}
	public List<TrainerDto> listDao(HashMap<String, Object> map){
		return sqlSession.selectList(NameSpace+".trlist",map);
	}
	public TrainerDto detailDao(int num){
		return sqlSession.selectOne(NameSpace+".trdetail",num);
	}
	public TrainerDto detail2Dao(int num){
		return sqlSession.selectOne(NameSpace+".trdetail2",num);
	}
	public int deleteDao(int num){
		return sqlSession.delete(NameSpace+".trdelete",num);
	}
	public int getTrCount(HashMap<String, Object> map){
		return   sqlSession.selectOne(NameSpace+".getTrCount",map);
	}
}
