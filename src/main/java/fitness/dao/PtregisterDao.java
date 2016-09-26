package fitness.dao;



import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.PtregisterDto;
import fitness.dto.RegistrationDto;
import fitness.dto.StaffDto;
import fitness.dto.ptrMemDto;

@Repository
public class PtregisterDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="orm.mybatis.FinalMapper";
	
	public int insert(PtregisterDto dto){
		return sqlSession.insert(NAMESPACE+".ptrinsert",dto);
	}
	
	public PtregisterDto detailDao(int num){
		return sqlSession.selectOne(NAMESPACE+".ptrinfo",num);
	}
	
	public List<PtregisterDto> list(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".ptrlistAll",map);
	}
	
	public List<ptrMemDto> memlist(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".ptrmemlistAll",map);
	}
	
	public int ptrOkupdate(PtregisterDto dto){
		return sqlSession.update(NAMESPACE+".ptrResult",dto);
	}
	
	public int ptmaxNum(){
		return sqlSession.selectOne(NAMESPACE+".ptmaxNum");
	}
	
	public PtregisterDto ptrgDetail(int rg_num){
		return sqlSession.selectOne(NAMESPACE+".ptrgDetail",rg_num);
	}
	public PtregisterDto ptr_numinfo(int tr_num){
		return sqlSession.selectOne(NAMESPACE+".ptr_numinfo",tr_num);
	}
	public List<StaffDto> ptstafflist(){
		return   sqlSession.selectList(NAMESPACE+".ptstafflist");
	}
	
	public Integer ptrcount(int rg_num){
		return   sqlSession.selectOne(NAMESPACE+".ptrcount",rg_num);
	}
	
	public int ptDelete(int ptr_num){
		return sqlSession.delete(NAMESPACE+".ptDelete",ptr_num);
	}
	public List<PtregisterDto> ptr_rg_numinfo(String rg_num){
		return sqlSession.selectList(NAMESPACE+".ptr_rg_numinfo",rg_num);
	}	
	public RegistrationDto regi_info(int mnum){
		return sqlSession.selectOne(NAMESPACE+".totregimoney",mnum);
	}
	
}



















