package fitness.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.MemberDto;
import fitness.dto.ProgramPriceDto;
import fitness.dto.ProsignDto;
import fitness.dto.PtPriceDto;
import fitness.dto.PtsignDto;
import fitness.dto.RefundSeongjinDto;
import fitness.dto.RegistrationDto;

@Repository

public class RefundSeongjinDao {
	@Autowired SqlSession sqlSession;
	private final String NAMESPACE="orm.mybatis.FinalMapper";

	//--------------------| ȯ���� ȸ�� �˻��ϱ� |--------------------//
	public List<RegistrationDto> memRegiRefundSearch(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".memRegiRefundSearch",map);
	}
	//--------------------| ȯ���� ȸ�� �˻��� ���� ���� ���ϱ�(����¡ó��)  |--------------------//
	public int getMemSearchCount(HashMap<String, Object> map){//����¡ó��(count���ϱ�)
		return sqlSession.selectOne(NAMESPACE+".getMemSearchCount",map);
	}
	//--------------------| ȯ���� ȸ�� ����������� ������  |--------------------//
	public MemberDto regiRefundCenter(HashMap<String, Object> map){//����¡ó��(count���ϱ�)
		return sqlSession.selectOne(NAMESPACE+".regiRefundCenter",map);
	}
	//------------------|�ܰ�����ȸ�� ȯ�� '��������' select(���̺��: prosign/properiod)|------------------//
	public ProsignDto simpleSelect(HashMap<String, Object> map){
		return sqlSession.selectOne(NAMESPACE+".simpleSelect",map);
	}
	//------------------|�ܰ�����ȸ�� ȯ�� '��������' select(���̺��: prosign/programprice)|------------------//
	public ProgramPriceDto simplePriceSelect(HashMap<String, Object> map){
		return sqlSession.selectOne(NAMESPACE+".simplePriceSelect",map);
	}
	//------------------|�ܰ����� � �� ������ ����ϱ�(���̺��: properiod)|------------------//
	public int calculateSimpleOneday(HashMap<String, Object> map){
		return sqlSession.selectOne(NAMESPACE+".calculateSimpleOneday",map);
	}
	//------------------|�ܰ����� � �� �ܿ��� ����ϱ�(���̺��: properiod)|------------------//
	public int calculateSimpleRemnant(HashMap<String, Object> map){
		return sqlSession.selectOne(NAMESPACE+".calculateSimpleRemnant",map);
	}
	//------------------|pt����ȸ�� ȯ�� '��������' select(���̺��: ptsign/ptperiod)|------------------//
	public PtsignDto ptSelect(HashMap<String, Object> map){
		return sqlSession.selectOne(NAMESPACE+".ptSelect",map);
	}
	//------------------|pt����ȸ�� ȯ�� '��������' select(���̺��: prosign/programprice)|------------------//
	public PtPriceDto ptPriceSelect(HashMap<String, Object> map){
		return sqlSession.selectOne(NAMESPACE+".ptPriceSelect",map);
	}
	//------------------|PT���� �� ������ ����ϱ�(���̺��: ptperiod)|------------------//
	public int calculatePtOneday(HashMap<String, Object> map){
		return sqlSession.selectOne(NAMESPACE+".calculatePtOneday",map);
	}
	//------------------|PT���� �ܿ���(ȯ�ҳ�¥) ����ϱ�(���̺��: ptperiod)|------------------//
	public int calculatePtRemnant(HashMap<String, Object> map){
		return sqlSession.selectOne(NAMESPACE+".calculatePtRemnant",map);
	}
	
	
	//------------------|ȯ�� insert(���̺��: refundseongjin)|------------------//
	public int refundSeongjinInsert(RefundSeongjinDto dto){
		return sqlSession.insert(NAMESPACE+".refundSeongjinInsert",dto);
	}
}
