package fitness.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.FreeboardDto;

@Repository
public class FreeboardDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="orm.mybatis.FinalMapper";
	public int insertDao(FreeboardDto dto){
		return sqlSession.insert(NAMESPACE+".fbinsert",dto);	
	}
	public int updateDao(FreeboardDto dto){
		return sqlSession.update(NAMESPACE+".fbupdate",dto);
	}
	public List<FreeboardDto> listDao(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".fblist",map);
	}
	public FreeboardDto detailDao(int fb_num){
		return sqlSession.selectOne(NAMESPACE+".fbdetail",fb_num);
	}
	public int deleteDao(int fb_num){
		return sqlSession.delete(NAMESPACE+".fbdelete",fb_num);
	}
	public int getfbCount(HashMap<String, Object> map){
		return   sqlSession.selectOne(NAMESPACE+".getfbCount", map);
	}
	//Á¶È¸¼ö
	public int fbaddHit(int fb_num){
		return sqlSession.update(NAMESPACE +".fbaddHit",fb_num);
	}
	public int fbrep(FreeboardDto dto){
		return sqlSession.update(NAMESPACE + ".fbrep",dto);
	}
	public int fbmaxnum(){
		return sqlSession.selectOne(NAMESPACE+".fbmaxnum");
	}
}