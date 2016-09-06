package fitness.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.ProperiodDto;
import fitness.dto.ProsignDto;
import fitness.dto.PtperiodDto;
import fitness.dto.PtsignDto;
import fitness.dto.RegistrationDto;

@Repository
public class RegistrationDao {
	@Autowired private SqlSession sqlSession;
	
	private String NAMESPACE="orm.mybatis.FinalMapper";
	
////////////////////////////////--| Insert |--////////////////////////////////	
	//----------| 회원수강등록(insert)(테이블명: registration) |----------//
	public int regiInsert(RegistrationDto dto1){
		return sqlSession.insert(NAMESPACE+".regiInsert",dto1);
	}
	public int getRgnum(){//가장 큰 rg_num얻어오기
		return sqlSession.selectOne(NAMESPACE+".rgNum");
	}
	
	//----------| 단과과목등록(insert)(테이블명: prosign) |----------//
	public int prosignInsert(ProsignDto dto2){
		return sqlSession.insert(NAMESPACE+".prosignInsert", dto2);
	}
	
	//----------| pt과목등록(insert)(테이블명: ptsign) |----------//
	public int ptsignInsert(PtsignDto dto3){
		return sqlSession.insert(NAMESPACE+".ptsignInsert", dto3);
	}
	//----------| 단과과목 기간등록(insert)(테이블명: properiod) |----------//
	public int properiodInsert(ProperiodDto dto4){
		return sqlSession.insert(NAMESPACE+".properiodInsert",dto4);
	}
	//----------| pt과목 기간등록(insert)(테이블명: ptperiod) |----------//
	public int ptperiodInsert(PtperiodDto dto5){
		return sqlSession.insert(NAMESPACE+".ptperiodInsert",dto5);
	}
//////////////////////////////--| select |--////////////////////////////////
	//----------| 회원수강등록 페이징처리(select)(테이블명: registration) |----------//
	public int getCountRegi(){
		return sqlSession.selectOne(NAMESPACE+".getCountRegi");
	}
	//----------| 회원수강등록 전체목록보기(selectList)(테이블명: registration) |----------//
	public List<RegistrationDto> regiListAll(HashMap<String, Integer> map){
		return sqlSession.selectList(NAMESPACE+".regiListAll",map);
	}
	
	//----------| 회원번호에 따른 과목유형(rg_type)별 전체목록보기(테이블명: prosign,ptsign) |----------//
	//단과과목
	public ProsignDto prosignListone(HashMap<String, Integer> map1){
		return sqlSession.selectOne(NAMESPACE+".regiSimpleListOne",map1);
	}
	//-- 단과명, 등록개월수 뽑아오기
	//<select id="regiSimpleListOneName" parameterType="int" resultType="">
	public ProsignDto prosignListoneName(String pro_code){
		return sqlSession.selectOne(NAMESPACE+".regiSimpleListOneName");
	}
	//PT과목
	public PtsignDto ptsignListone(HashMap<String, Integer> map2){
		return sqlSession.selectOne(NAMESPACE+".regiPTListOne",map2);
	}
	//-- pt명, 등록개월수, 횟수 뽑아오기 
	public PtsignDto ptsingListoneName(String pt_code){
		return sqlSession.selectOne(NAMESPACE+".regiPTListOneName");
	}
////////////////////////////////--| Update |--////////////////////////////////	
	//update하기 위한 getInfo
	public RegistrationDto regiGetInfo(HashMap<String, Integer>map){
		return sqlSession.selectOne(NAMESPACE+".regiGetInfo",map);
	}
	
	//----------| 회원수강등록(Update)(테이블명: registration) |----------//
	public int regiUpdate(RegistrationDto dto1){
		return sqlSession.update(NAMESPACE+".regiUpdate",dto1);
	}
	
	//----------| 단과과목등록(Update)(테이블명: prosign) |----------//
	public int prosignUpdate(ProsignDto dto2){
		return sqlSession.update(NAMESPACE+".prosignUpdate",dto2);
	}
	
	//----------| pt과목등록(Update)(테이블명: ptsign) |----------//
	public int ptsignUpdate(PtsignDto dto3){
		return sqlSession.update(NAMESPACE+".ptsignUpdate",dto3);
	}
	
	//----------| 단과과목 기간등록(Update)(테이블명: properiod) |----------//
	public int properiodUpdate(ProperiodDto dto4){
		return sqlSession.update(NAMESPACE+".properiodUpdate",dto4);
	}
	
	//----------| pt과목 기간등록(Update)(테이블명: ptperiod) |----------//
	public int ptperiodUpdate(PtperiodDto dto5){
		return sqlSession.update(NAMESPACE+".ptperiodUpdate",dto5);
	}
////////////////////////////////--| Delete |--////////////////////////////////	
	//-- 4.delete 수강정보 :prosign(단과과목등록) table -->
	public int regiDel(int rg_num){
		return sqlSession.delete(NAMESPACE+".regiDel",rg_num);
	}
	public int prosignDel(int rg_num){
		return sqlSession.delete(NAMESPACE+".prosignDel",rg_num);
	}
	//-- 4.delete 수강정보 :ptsign(pt등록) table -->
	public int ptsignDel(int rg_num){
		return sqlSession.delete(NAMESPACE+".ptsignDel",rg_num);
	}
	//-- 4.delete 수강정보 :properiod(단과-운동기간등록) table-->
	public int properiodDel(int rg_num){
		return sqlSession.delete(NAMESPACE+".properiodDel",rg_num);
	}
	//-- 4.delete 수강정보 :ptperiod(pt-운동기간등록) table -->
	public int ptperiodDel(int rg_num){
		return sqlSession.delete(NAMESPACE+".ptperiodDel",rg_num);
	}
////////////////////////////////--| PTregister |--////////////////////////////////
	
	public RegistrationDto ptRe(int mem_num){
		return sqlSession.selectOne(NAMESPACE+".regtDetail",mem_num);
	}
	
}
