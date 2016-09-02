package fitness.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.MemberDto;
import fitness.dto.ProgramPriceDto;
import fitness.dto.PtPriceDto;

@Repository
public class ProgramPriceDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="orm.mybatis.FinalMapper";
	//------------------|회원번호 검색하기(테이블명: member)|------------------//
	
	public List<MemberDto> memNum(HashMap<String, String> map){
		return sqlSession.selectList(NAMESPACE+".searchMemNum", map);
	}
	/*
	public MemberDto memNum(int mem_num){
		return sqlSession.selectOne(NAMESPACE+".memSearchList",mem_num);
	}
	*/
	//------------------|단과과목 select(테이블명: programprice)|------------------//
	public List<ProgramPriceDto> list(HashMap<String, Integer>map){//전체과목명 뽑아오기
		return sqlSession.selectList(NAMESPACE+".programName",map);
	}
	public ProgramPriceDto proPrice(String pro_name){//과목선택하면 가격뽑아오기
		System.out.println("proPrice DAO : "+pro_name);
		return sqlSession.selectOne(NAMESPACE+".programPrice",pro_name);
	}
	
	//------------------|pt과목 select(테이블명: ptprice)|------------------//
	public List<PtPriceDto> ptlist(HashMap<String, Integer>map){//전체과목명뽑아오기
		return sqlSession.selectList(NAMESPACE+".ptProgramName",map);
	}
	public PtPriceDto ptPrice(String pt_name){//과목선택하면 가격뽑아오기
		System.out.println("ptPrice DAO: "+pt_name);
		return sqlSession.selectOne(NAMESPACE+".ptPrice",pt_name);
	}
}
