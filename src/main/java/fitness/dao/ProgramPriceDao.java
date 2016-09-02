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
	//------------------|ȸ����ȣ �˻��ϱ�(���̺��: member)|------------------//
	
	public List<MemberDto> memNum(HashMap<String, String> map){
		return sqlSession.selectList(NAMESPACE+".searchMemNum", map);
	}
	/*
	public MemberDto memNum(int mem_num){
		return sqlSession.selectOne(NAMESPACE+".memSearchList",mem_num);
	}
	*/
	//------------------|�ܰ����� select(���̺��: programprice)|------------------//
	public List<ProgramPriceDto> list(HashMap<String, Integer>map){//��ü����� �̾ƿ���
		return sqlSession.selectList(NAMESPACE+".programName",map);
	}
	public ProgramPriceDto proPrice(String pro_name){//�������ϸ� ���ݻ̾ƿ���
		System.out.println("proPrice DAO : "+pro_name);
		return sqlSession.selectOne(NAMESPACE+".programPrice",pro_name);
	}
	
	//------------------|pt���� select(���̺��: ptprice)|------------------//
	public List<PtPriceDto> ptlist(HashMap<String, Integer>map){//��ü�����̾ƿ���
		return sqlSession.selectList(NAMESPACE+".ptProgramName",map);
	}
	public PtPriceDto ptPrice(String pt_name){//�������ϸ� ���ݻ̾ƿ���
		System.out.println("ptPrice DAO: "+pt_name);
		return sqlSession.selectOne(NAMESPACE+".ptPrice",pt_name);
	}
}
