package fitness.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.RefundSeongjinDao;
import fitness.dto.MemberDto;
import fitness.dto.ProgramPriceDto;
import fitness.dto.ProsignDto;
import fitness.dto.PtPriceDto;
import fitness.dto.PtsignDto;
import fitness.dto.RefundSeongjinDto;
import fitness.dto.RegistrationDto;
@Service
public class RefundSeongjinService {
	@Autowired RefundSeongjinDao dao;
	//--------------------| ȯ���� ȸ�� �˻��ϱ� |--------------------//
	public List<RegistrationDto> memRegiRefundSearch(HashMap<String, Object> map){
		return dao.memRegiRefundSearch(map);
	}
	//--------------------| ȯ���� ȸ�� �˻��� ���� ���� ���ϱ�(����¡ó��)  |--------------------//
	public int getMemSearchCount(HashMap<String, Object> map){//����¡ó��(count���ϱ�)
		return dao.getMemSearchCount(map);
	}
	//--------------------| ȯ���� ȸ�� ����������� ������  |--------------------//
	public MemberDto regiRefundCenter(HashMap<String, Object> map){//����¡ó��(count���ϱ�)
		return dao.regiRefundCenter(map);
	}
	//------------------|�ܰ�����ȸ�� ȯ�� '��������' select(���̺��: prosign/properiod)|------------------//
	public ProsignDto simpleSelect(HashMap<String, Object> map){
		return dao.simpleSelect(map);
	}
	//------------------|�ܰ�����ȸ�� ȯ�� '��������' select(���̺��: prosign/programprice)|------------------//
	public ProgramPriceDto simplePriceSelect(HashMap<String, Object> map){
		return dao.simplePriceSelect(map);
	}
	//------------------|�ܰ����� � �� ������ ����ϱ�(���̺��: properiod)|------------------//
	public int calculateSimpleOneday(HashMap<String, Object> map){
		return dao.calculateSimpleOneday(map);
	}
	//------------------|�ܰ����� � �� �ܿ��� ����ϱ�(���̺��: properiod)|------------------//
	public int calculateSimpleRemnant(HashMap<String, Object> map){
		return dao.calculateSimpleRemnant(map);
	}
	//------------------|pt����ȸ�� ȯ�� '��������' select(���̺��: ptsign/ptperiod)|------------------//
	public PtsignDto ptSelect(HashMap<String, Object> map){
		return dao.ptSelect(map);
	}
	//------------------|pt����ȸ�� ȯ�� '��������' select(���̺��: prosign/programprice)|------------------//
	public PtPriceDto ptPriceSelect(HashMap<String, Object> map){
		return dao.ptPriceSelect(map);
	}
	
	//------------------|PT���� �� ������(ȯ�ҳ�¥) ����ϱ�(���̺��: ptperiod)|------------------//
	public int calculatePtOneday(HashMap<String, Object> map){
		return dao.calculatePtOneday(map);
	}
	//------------------|PT���� �ܿ���(ȯ�ҳ�¥) ����ϱ�(���̺��: ptperiod)|------------------//
	public int calculatePtRemnant(HashMap<String, Object> map){
		return dao.calculatePtRemnant(map);
	}
	
	//------------------|ȯ�� insert(���̺��: refundseongjin)|------------------//
	public int refundSeongjinInsert(RefundSeongjinDto dto){
		return dao.refundSeongjinInsert(dto);
	}
}
